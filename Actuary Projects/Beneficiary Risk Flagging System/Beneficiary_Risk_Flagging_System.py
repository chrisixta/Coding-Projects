import pandas as pd

# Load CSV file
t = pd.read_csv("DE1_0_2008_Beneficiary_Summary_File_Sample_1.csv")

#Calculate Age
t["AGE"] = (20080000 - t["BENE_BIRTH_DT"]) // 10000

#List of chronic condition columns
chronic_conditions = [
    "SP_CHF", "SP_CHRNKIDN", "SP_CNCR", "SP_COPD",
    "SP_DEPRESSN", "SP_DIABETES", "SP_ISCHMCHT",
    "SP_OSTEOPRS", "SP_RA_OA", "SP_STRKETIA"
]

#Count how many chronic conditions are present in each policyholder
t["CHRONIC_COUNT"] = t[chronic_conditions].apply(lambda row: sum(row == 1), axis=1)

#Calculate total policholder's medical reimbursement
t["TOTAL_REIMB"] = t["MEDREIMB_IP"] + t["MEDREIMB_OP"] + t["MEDREIMB_CAR"]

#Create risk flags
t["FLAG_CHRONIC"] = t["CHRONIC_COUNT"] >= 3
t["FLAG_COST"] = t["TOTAL_REIMB"] > 10000
t["FLAG_DEATH"] = t["BENE_DEATH_DT"].notna()

#Flag as high-risk if 2 or more conditions are met
t["HIGH_RISK"] = t[["FLAG_CHRONIC", "FLAG_COST", "FLAG_DEATH"]].sum(axis=1) >= 2

#Summary statistics
total_flagged = t["HIGH_RISK"].sum()
avg_age_flagged = t[t["HIGH_RISK"]]["AGE"].mean()
avg_age_nonflagged = t[~t["HIGH_RISK"]]["AGE"].mean()

top_chronic_flagged = (
    t[t["HIGH_RISK"]][chronic_conditions]
    .apply(lambda col: (col == 1).sum())
    .sort_values(ascending=False)
    .head(5)
)

#Export flagged beneficiaries to Excel
t[t["HIGH_RISK"]][[
    "DESYNPUF_ID", "AGE", "CHRONIC_COUNT", "TOTAL_REIMB", "FLAG_DEATH"
]].to_excel("flagged_beneficiaries.xlsx", index=False)

#Print project summary
print("===== Risk Flagging Summary =====")
print(f"Total High-Risk Beneficiaries: {total_flagged}")
print(f"Average Age (High-Risk): {avg_age_flagged:.1f}")
print(f"Average Age (Non-High-Risk): {avg_age_nonflagged:.1f}")
print("\nTop 5 Chronic Conditions Among High-Risk:")
print(top_chronic_flagged)
print("\nOutput saved to 'flagged_beneficiaries.xlsx'")
