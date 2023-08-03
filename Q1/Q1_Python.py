# Q1 _ Gaussian Elimination
# Ali Maher _ Mohammad Zahmatkesh _ Alireza Khayami

# -------------------- Libraries --------------------
import numpy as np
import re
# ---------------------------------------------------

# ------------  How to Work with Program ------------
# 1. First enter number of variables
# 2. Enter the variables in seperate lines, like below:
#   x
#   y
#   z
#   w
#   m
# 3. Enter the equations in seperate lines, like below:
#   0.3x+9y-1z+3w-2m=17
#   7x+0y+1z-4w-1m=3
#   6x+2y+2z+8w+1m=1
#   -1x+17y-1.2z+1w+0m=15
#   -1x+1y+1z+2w+0m=-7
# ----------------------------------------------    

# -------------------- Data --------------------
varList = list()
print("Enter Number of Variables plz: ", end = "")
numberOfVars = int(input())

# get variables
for i in range(0, numberOfVars):
    varList.append(input())
    
# get equations
equationsList = list()
print("Please Enter the Equations Respectively: ")
for i in range (0, numberOfVars):
    equationsList.append(input())
# ----------------------------------------------
    
# ------ find data from entered equations ------
valuesList = list()
coefficientsList = list()
for i in equationsList:
    z = re.findall(r'[\d\.\-]+', i)
    # list of values
    valuesList.append(z[-1])
    # list of Coefficients
    coefficientsList.extend([z[:-1:]])
    
res = np.array(coefficientsList, dtype = float)
lastRes = np.array(valuesList, dtype = float)
# ----------------------------------------------

# ---------- Now Gaussian Elimination ----------
for k in range(0, numberOfVars - 1):
    for i in range(k+1, numberOfVars):
        if res[i, k] != 0.0:
            factor = res[i, k] / res[k, k]
            res[i,k+1:numberOfVars] = res[i, k+1:numberOfVars] - np.multiply(factor, res[k, k+1:numberOfVars])
            lastRes[i] = lastRes[i] - np.multiply(factor, lastRes[k])
            
for k in range(numberOfVars-1, -1, -1):
       lastRes[k] = (lastRes[k] - np.dot(res[k, k+1:numberOfVars], lastRes[k+1:numberOfVars]))/res[k,k]
# ----------------------------------------------            

# -------------- Print the Result --------------
print("Last Result is as below:")
for i in range(0, numberOfVars):
    print(varList[i], end = ": ")
    print(lastRes[i])