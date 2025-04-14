import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import gamma, weibull_min

# Load the dataset
t = pd.read_csv("InsuranceClaimsData.csv")
ages = t["customer_age"].dropna()

# Summary
print(ages.describe())
print("Missing values:", t["customer_age"].isnull().sum())

# Histogram
plt.figure(figsize=(8, 5))
plt.hist(ages, bins=40, edgecolor='black', alpha=0.8)
plt.xlabel("Customer Age")
plt.ylabel("Frequency")
plt.title("Distribution of Customer Ages in Insurance Claims")
plt.show()

# Fit Gamma
gamma_shape, gamma_loc, gamma_scale = gamma.fit(ages)
print(f"Gamma Parameters: Shape={gamma_shape:.4f}, Scale={gamma_scale:.4f}")

# Fit Weibull
weibull_c, weibull_loc, weibull_scale = weibull_min.fit(ages)
print(f"Weibull Parameters: c={weibull_c:.4f}, Scale={weibull_scale:.4f}")

