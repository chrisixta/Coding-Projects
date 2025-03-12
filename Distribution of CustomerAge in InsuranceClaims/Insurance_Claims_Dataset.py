import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import gamma, weibull_min
#Load the dataset
t = pd.read_csv("InsuranceClaimsData.csv")
print(t.head())

#Summary
print(t["customer_age"].describe())  # Summary statistics
print("Missing values:", t["customer_age"].isnull().sum())  # Check missing values

#Histogram
plt.figure(figsize=(8, 5))
plt.hist(t["customer_age"], bins=100, edgecolor='black', alpha=0.8)
plt.xlabel("Customer Age")
plt.ylabel("Frequency")
plt.title("Distribution of Customer Ages in Insurance Claims")
plt.show()

# Fit a Gamma distribution
#Shows frequency & claim occurence
shape, loc, scale = gamma.fit(t["customer_age"])
print(f"Gamma Parameters: Shape={shape:.4f}, Scale={scale:.4f}")

# Fit a Weibull distribution
#Shows policholders survival rates $ longtevity risk
c, loc, scale = weibull_min.fit(t["customer_age"])
print(f"Weibull Parameters: c={c:.4f}, Scale={scale:.4f}")
