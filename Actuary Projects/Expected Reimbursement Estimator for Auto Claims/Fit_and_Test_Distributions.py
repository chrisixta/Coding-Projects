import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats
from scipy.integrate import quad

#Load data
t = pd.read_csv("AutoClaims.csv")
claims = t["PAID"]
x = np.linspace(claims.min(), claims.max(), 1000)

#Fit distributions: LogNormal, Gamma, Weibull, Exponential
lognorm_params = stats.lognorm.fit(claims, floc=0)
gamma_params = stats.gamma.fit(claims, floc=0)
weibull_params = stats.weibull_min.fit(claims, floc=0)
exp_params = stats.expon.fit(claims, floc=0)

#Compute PDFs
lognorm_pdf = stats.lognorm.pdf(x, *lognorm_params)
gamma_pdf = stats.gamma.pdf(x, *gamma_params)
weibull_pdf = stats.weibull_min.pdf(x, *weibull_params)
exp_pdf = stats.expon.pdf(x, *exp_params)

#Plot histogram with fitted PDFs
plt.figure(figsize=(12, 6))
plt.hist(claims, bins=50, density=True, alpha=0.7, color="gray", label="Claim Data Histogram")
plt.plot(x, lognorm_pdf, label="Lognormal", linewidth=2)
plt.plot(x, gamma_pdf, label="Gamma", linewidth=2)
plt.plot(x, weibull_pdf, label="Weibull", linewidth=2)
plt.plot(x, exp_pdf, label="Exponential", linewidth=2)
plt.title("Distribution Fit Comparison")
plt.xlabel("Claim Amount ($)")
plt.ylabel("Density")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig("distribution_comparison.png")

#Run K-S tests
ks_lognorm = stats.kstest(claims, 'lognorm', args=lognorm_params)
ks_gamma = stats.kstest(claims, 'gamma', args=gamma_params)
ks_weibull = stats.kstest(claims, 'weibull_min', args=weibull_params)
ks_expon = stats.kstest(claims, 'expon', args=exp_params)

#Print results
print("K-S Test Results:")
print(f"Lognormal: statistic={ks_lognorm.statistic:.4f}, p-value={ks_lognorm.pvalue:.4g}")
print(f"Gamma:     statistic={ks_gamma.statistic:.4f}, p-value={ks_gamma.pvalue:.4g}")
print(f"Weibull:   statistic={ks_weibull.statistic:.4f}, p-value={ks_weibull.pvalue:.4g}")
print(f"Exponential: statistic={ks_expon.statistic:.4f}, p-value={ks_expon.pvalue:.4g}")
