#!/usr/bin/env bash
# EQR Reality Simulation - Infinite Points x Finite Infinity Kernel Blend
# Target: Fedora 43 (python3, numpy, matplotlib)

set -euo pipefail

if ! python3 -c "import numpy, matplotlib" &> /dev/null; then
    echo "Installing required dependencies..."
    sudo dnf install -y python3-numpy python3-matplotlib
fi

python3 - << 'EOF'
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

# --- 1. INFINITE POINTS CONTINUUM (Grid Setup) ---
N = 64            # Resolution (3D Grid)
L = 10.0          # Spatial Extent
dx = L / N
x = np.linspace(-L/2, L/2, N)
y = np.linspace(-L/2, L/2, N)
z = np.linspace(-L/2, L/2, N)
X, Y, Z = np.meshgrid(x, y, z, indexing='ij')

dt = 0.005
steps = 200

# --- 2. FINITE INFINITY (\infty_f) LOCAL INTERACTION KERNEL ---
# Defines bounded local interactions between all points
r2 = X**2 + Y**2 + Z**2
sigma_f = 2.0     # Finite Infinity local cutoff radius
finite_infinity_kernel = np.exp(-r2 / (2 * sigma_f**2)) # Bounded local metric

# Fourier Operators for infinite global space continuum
kx = 2 * np.pi * np.fft.fftfreq(N, d=dx)
ky = 2 * np.pi * np.fft.fftfreq(N, d=dx)
kz = 2 * np.pi * np.fft.fftfreq(N, d=dx)
KX, KY, KZ = np.meshgrid(kx, ky, kz, indexing='ij')
K2 = KX**2 + KY**2 + KZ**2

# Kinetic Unitary Operator (Global Infinite Domain)
T_op = np.exp(-1j * 0.5 * K2 * dt)

# --- 3. INITIAL P, E, D STATES WITH NON-PLANAR TOPOLOGY ---
# Topological vortex in 3D (Winding number m=2)
phi = np.arctan2(Y, X)
theta = np.arccos(np.clip(Z / (np.sqrt(r2) + 1e-9), -1.0, 1.0))

# Wavefunction P (Position/Probability)
psi = np.exp(-r2 / 4.0) * np.exp(1j * 2 * phi) * np.sin(theta)

# Density Field D coupled via Finite Infinity Kernel
D = np.exp(-r2 / 8.0) * finite_infinity_kernel

# Energy Potential E (Non-planar Anharmonic 3D Field)
E_potential = 0.5 * r2 + 0.2 * (X * Y * Z)

# --- 4. TIME EVOLUTION (OPERATOR STEPPING) ---
print("Simulating Infinite Field x Finite Infinity Local Interactions...")

history_x, history_y, history_z = [], [], []

for t in range(steps):
    # Step A: Infinite Global Kinetic Step (Fourier Domain)
    psi_k = np.fft.fftn(psi)
    psi_k *= T_op
    psi = np.fft.ifftn(psi_k)

    # Step B: Finite Infinity Local Interaction Step
    # Calculate non-linear potential using local finite-infinity bounded kernel
    local_density = np.abs(psi)**2
    bounded_interaction = np.fft.ifftn(np.fft.fftn(local_density) * np.fft.fftn(finite_infinity_kernel)).real
    
    # Effective potential driving 3D non-planar dynamics
    V_eff = E_potential + 2.0 * bounded_interaction - 0.5 * D
    psi *= np.exp(-1j * V_eff * dt)

    # Step C: Second Infinite Kinetic Step
    psi_k = np.fft.fftn(psi)
    psi_k *= T_op
    psi = np.fft.ifftn(psi_k)

    # Norm Preservation (Unitary Operator Constraint)
    psi /= np.sqrt(np.sum(np.abs(psi)**2) * (dx**3))

    # Track 3D Expectation Trajectory <X>, <Y>, <Z>
    if t % 2 == 0:
        p_dens = np.abs(psi)**2
        mean_x = np.sum(X * p_dens) * (dx**3)
        mean_y = np.sum(Y * p_dens) * (dx**3)
        mean_z = np.sum(Z * p_dens) * (dx**3) + np.angle(psi[N//2, N//2, N//2]) # Phase Z-coupling
        
        history_x.append(mean_x)
        history_y.append(mean_y)
        history_z.append(mean_z)

# --- 5. VISUALIZE 3D NON-PLANAR MANIFOLD ---
fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection='3d')

ax.plot(history_x, history_y, history_z, color='mediumpurple', lw=2.5, label='3D Non-Planar Trajectory')
ax.scatter(history_x[0], history_y[0], history_z[0], color='cyan', s=60, label='Initial State')
ax.scatter(history_x[-1], history_y[-1], history_z[-1], color='magenta', s=60, label='Final State')

# Draw Finite Infinity Boundary Envelope
u = np.linspace(0, 2 * np.pi, 20)
v = np.linspace(0, np.pi, 20)
sphere_x = sigma_f * np.outer(np.cos(u), np.sin(v))
sphere_y = sigma_f * np.outer(np.sin(u), np.sin(v))
sphere_z = sigma_f * np.outer(np.ones(np.size(u)), np.cos(v))
ax.plot_wireframe(sphere_x, sphere_y, sphere_z, color='gray', alpha=0.15, label=r'Finite Infinity Boundary ($\infty_f$)')

ax.set_title(r'EQR 3D Continuum ($\infty$ Points $\times$ $\infty_f$ Kernel)', fontsize=12)
ax.set_xlabel('Position X')
ax.set_ylabel('Position Y')
ax.set_zlabel('Phase / Density Z')
ax.legend(loc='upper right')

plt.tight_layout()
plt.savefig('eqr_blended_3d.png', dpi=150)
print("Simulation finished successfully. Saved 3D manifold to 'eqr_blended_3d.png'.")
EOF
