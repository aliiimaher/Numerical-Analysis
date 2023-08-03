# Q10 _ Laplace Equation Solving
# Ali Maher _ Mohammad Zahmatkesh _ Alireza Khayami

# -------------------- Libraries -------------------- 
import numpy
import matplotlib.pyplot as plt
# --------------------------------------------------- 

# -------------------- Data --------------------
h = k = 0.1          # Becase we have memory limitation we assume the steps (0.1).

x_end = 10
y_end = 8

nx = 100
ny = 80

zeroMat = []
for i in range(nx + 1):
    zeroMat += [(ny + 1) * [0]]
# --------------------------------------------------- 

# -------------- Set Boundary Conditions -------------
for i in range(0, nx + 1):
    zeroMat[i][0] = 6
    zeroMat[i][ny] = 5 * (i * h) + 2

for i in range(0, ny + 1):
    zeroMat[0][i] = i * k
    zeroMat[nx][i] = 3 * i * k
# ----------------------------------------------------

# ---------------- Calculation ----------------
points = {}

idx = 0
for i in range(1, nx):
    for j in range(1, ny):
        points[(i, j)] = idx
        points[idx] = (i, j)
        idx += 1

A = []
for i in range(0, idx):
    A += [idx * [0]]
    
B = idx * [0]

idx = 0
for i in range(1, nx):
    for j in range(1, ny):
        A[idx][points[(i, j)]] = -4
        for z in [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]:
            if z in points:
                A[idx][points[z]] = 1
            else:
                B[idx] -= zeroMat[z[0]][z[1]]
        idx += 1

A = numpy.array(A)
B = numpy.array(B)
C = numpy.linalg.solve(A, B)
for i in range(idx):
    position = points[i]
    zeroMat[position[0]][position[1]] = C[i]
# -------------------------------------------------------

# ---------------- Extract Points to Draw ----------------
X, Y, Z = [], [], []
for i in range(0, nx + 1):
    X += [[]]
    Y += [[]]
    Z += [[]]
    for j in range(0, ny + 1):
        X[i] += [i * h]
        Y[i] += [j * k]
        Z[i] += [zeroMat[i][j]]
X = numpy.array(X)
Y = numpy.array(Y)
Z = numpy.array(Z)
# --------------------------------------------------------

# ---------------- Graphic Show ----------------
fig = plt.figure()
ax = fig.add_subplot(111, projection = '3d')

ax.scatter(X, Y, Z, C, cmap = 'viridis', linewidth = 1)
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

plt.show()