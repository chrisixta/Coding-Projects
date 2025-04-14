import pandas as pd
import numpy as np
import scipy.stats as stats
from scipy.integrate import quad

# Load data
t = pd.read_csv("AutoClaims.csv")
claims = t["PAID"]

# Fit the best distribution (Lognormal, fixed from earlier)
shape, loc, scale = stats.lognorm.fit(claims, floc=0)
lognorm_dist = stats.lognorm(shape, loc=loc, scale=scale)

# Define deductible and policy limit
d = 500      # deductible
u = 10000    # policy limit

# Define the survival function S(x)
S = lambda x: lognorm_dist.sf(x)

# Define the Coaching Actuaries expected reimbursement formula using S(x)
# E[Y] = ∫ from d to u of S(x) dx
expected_reimb, _ = quad(S, d, u)

print(f"Expected Reimbursement E[Y] shortcut method:")
print(f"E[Y] = ∫ from {d} to {u} of S(x) dx = ${expected_reimb:.2f}")
