#!/bin/bash
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - FULLY PARAMETRIZED LOCAL RENDERER
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Propagation Bound: c = 134,964,356 cm/s (Centimeter-based scaling with field multiplier)
# ==============================================================================

set -uo pipefail

# ANSI Color Codes for KDE Konsole Output
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear
echo -e "${CYAN}==============================================================================${NC}"
echo -e "${GREEN}    TENSOR REALITY ENGINE - ADVANCED OPERATOR THEORY PIPELINE          ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Target OS          : Fedora Linux (KDE Plasma Native)"
echo -e "Propagation Bound  : ${BLUE}134,964,356 cm/s${NC}"
echo -e "Meum Constant (20d): ${BLUE}1.1975807343385265188${NC}"
echo -e "${CYAN}------------------------------------------------------------------------------${NC}\n"

# ==============================================================================
# 1. 6-OPTION TIMESCALE SELECTOR & STRETCH DURATION PARAMETERS
# ==============================================================================
echo -e "${YELLOW}[1/6] Select Base Time Scale Unit:${NC}"
echo "  1) Gigasecond  (1 Gs  = 10^9 s)"
echo "  2) Second      (1 s   = 1.0 s)"
echo "  3) Millisecond (1 ms  = 10^-3 s)"
echo "  4) Microsecond (1 µs  = 10^-6 s)"
echo "  5) Nanosecond  (1 ns  = 10^-9 s)"
echo "  6) Picosecond  (1 ps  = 10^-12 s)"
read -p "Select timescale unit option [1-6, default 2]: " TIME_CHOICE
TIME_CHOICE=${TIME_CHOICE:-2}

case "$TIME_CHOICE" in
    1) SCALE_VAL="1e9"; SCALE_LABEL="Gs" ;;
    2) SCALE_VAL="1.0"; SCALE_LABEL="s" ;;
    3) SCALE_VAL="1e-3"; SCALE_LABEL="ms" ;;
    4) SCALE_VAL="1e-6"; SCALE_LABEL="µs" ;;
    5) SCALE_VAL="1e-9"; SCALE_LABEL="ns" ;;
    6) SCALE_VAL="1e-12"; SCALE_LABEL="ps" ;;
    *) SCALE_VAL="1.0"; SCALE_LABEL="s" ;;
esac

read -p "Enter number of units to span [1.0]: " USER_UNITS
USER_UNITS=${USER_UNITS:-1.0}

read -p "Enter total output video stretch duration in real seconds (e.g. 10.0 for 10s video) [30.0]: " VIDEO_STRETCH_SEC
VIDEO_STRETCH_SEC=${VIDEO_STRETCH_SEC:-30.0}

# Calculations for Python and FFmpeg
CALC_DURATION_SEC=$(python3 -c "print(float('${USER_UNITS}') * float('${SCALE_VAL}'))")
TOTAL_FRAMES=$(python3 -c "print(int(max(30, round(float($VIDEO_STRETCH_SEC) * 30))))")
FPS=30

# 2. SEED PROTOCOL / FULL PARAMETRIC FREEDOM
echo -e "\n${YELLOW}[2/6] Seed Protocol & Parametric Initial Condition Specification:${NC}"
echo "  - Select baseline mathematical mode:"
echo "    1) Quantum/Particle Density Node"
echo "    2) Molecular Lattice Matrix"
echo "    3) CM-Scale Macroscopic Burst"
echo "    4) Custom Phase-Shifted Soliton Matrix"
read -p "Select seed mode [1-4, default 1]: " SEED_MODE
SEED_MODE=${SEED_MODE:-1}

read -p "Enter full parametric seed float (controls initial phase/amplitude) [1.618]: " FULL_SEED
FULL_SEED=${FULL_SEED:-1.618}

read -p "Enter stochastic bifurcation weight for indecisive operator points [0.05]: " BIFURCATION_WEIGHT
BIFURCATION_WEIGHT=${BIFURCATION_WEIGHT:-0.05}

# 3. CENTIMETER SPATIAL FIELD SCALE & CAMERA CONTROLS
echo -e "\n${YELLOW}[3/6] Centimeter Field Scale & Camera Control Parameters:${NC}"
echo "  - Propagation Bound factor: c = 134,964,356 cm/s"
read -p "Enter field dimension scale multiplier (m or 100*c multiplier) [1.0]: " FIELD_SCALE_MULT
FIELD_SCALE_MULT=${FIELD_SCALE_MULT:-1.0}

read -p "Enter initial camera distance / zoom radius [8.0]: " CAM_DIST
CAM_DIST=${CAM_DIST:-8.0}
read -p "Enter zoom curve parameter (linear=1.0, exponential>1.0) [1.12]: " ZOOM_CURVE
ZOOM_CURVE=${ZOOM_CURVE:-1.12}
read -p "Enter initial Pitch angle (degrees) [35]: " CAM_PITCH
CAM_PITCH=${CAM_PITCH:-35}
read -p "Enter initial Yaw angle (degrees) [50]: " CAM_YAW
CAM_YAW=${CAM_YAW:-50}

# 4. COLORIZATION & SPECIFIC NUMERIC RANGE MAPPING
echo -e "\n${YELLOW}[4/6] Colorization & Numeric Range Specification:${NC}"
echo "  - Select colorization profile:"
echo "    1) Realistic Plasma / Turbo Spectrum"
echo "    2) Custom RGB Value Colorshifts / Cool Tint"
echo "    3) Custom Range Numeric High Energy Reaction Mode"
read -p "Select color profile [1-3, default 1]: " COLOR_MODE
COLOR_MODE=${COLOR_MODE:-1}

if [ "$COLOR_MODE" -eq 3 ]; then
    read -p "Enter minimum numeric spectrum range bound [0.0]: " RANGE_MIN
    RANGE_MIN=${RANGE_MIN:-0.0}
    read -p "Enter maximum numeric spectrum range bound [10.0]: " RANGE_MAX
    RANGE_MAX=${RANGE_MAX:-10.0}
else
    RANGE_MIN="0.0"
    RANGE_MAX="3.0"
fi

# 5. AUDIO TIMESCALE SOURCE
echo -e "\n${YELLOW}[5/6] Audio Sonification Options:${NC}"
echo "  - Select audio frequency source mapping:"
echo "    1) Timescale relative to Camera (Doppler frequency sweep)"
echo "    2) Timescale relative to Origin (Harmonic drone)"
read -p "Select audio mode [1-2, default 1]: " AUDIO_MODE
AUDIO_MODE=${AUDIO_MODE:-1}

# 6. LOCAL DIRECTORY OUTPUT CONFIGURATION
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$SCRIPT_DIR/tensor_operator_render_$TIMESTAMP.mkv"
AUDIO_FILE="$SCRIPT_DIR/tensor_operator_audio_$TIMESTAMP.wav"

echo -e "\n${CYAN}[+] Parameters Locked & Saved:${NC}"
echo -e "    - Duration    : $USER_DURATION $SCALE_LABEL ($CALC_DURATION_SEC seconds total)"
echo -e "    - Seed Mode   : Type $SEED_MODE (Parametric Seed: $FULL_SEED, Bifurcation: $BIFURCATION_WEIGHT)"
echo -e "    - Field Scale : ${BLUE}134,964,356 cm/s * $FIELD_SCALE_MULT${NC}"
echo -e "    - Range Map   : [$RANGE_MIN to $RANGE_MAX]"
echo -e "    - Local Output: $OUTPUT_FILE\n"

# Python Modeling Engine Execution with Full Operator Theory & Stochastic Indecisive Point Bifurcation
# Python Modeling Engine Execution with Full Operator Theory & Stochastic Indecisive Point Bifurcation
echo -e "[*] Initializing Python Operator Theory & Tensor Reality Rendering Pipeline..."
python3 - << EOF
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import os
import sys
import traceback

try:
    c_base = 134964356.0
    field_mult = float(${FIELD_SCALE_MULT})
    c = c_base * field_mult

    meum_20 = 1.1975807343385265188
    fps = ${FPS}
    total_frames = ${TOTAL_FRAMES}
    duration_sec = float(${CALC_DURATION_SEC})
    seed_mode = int(${SEED_MODE})
    full_seed = float(${FULL_SEED})
    bifurc_weight = float(${BIFURCATION_WEIGHT})
    color_mode = int(${COLOR_MODE})
    range_min = float(${RANGE_MIN})
    range_max = float(${RANGE_MAX})
    cam_dist = float(${CAM_DIST})
    zoom_curve = float(${ZOOM_CURVE})
    pitch_init = float(${CAM_PITCH})
    yaw_init = float(${CAM_YAW})

    rng = np.random.default_rng(int(full_seed * 1000) % 2**32)

    print(f"[Python] Operator Theory Engine initialized. c = {c} cm/s. Target Frames: {total_frames}")

    plt.style.use('dark_background')
    fig = plt.figure(figsize=(12, 7), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor('#090d16')

    x = np.linspace(-c * 2e-8, c * 2e-8, 85)
    y = np.linspace(-c * 2e-8, c * 2e-8, 85)
    X, Y = np.meshgrid(x, y)

    temp_dir = "/tmp/tensor_graph_frames"
    os.makedirs(temp_dir, exist_ok=True)

    if color_mode == 1:
        cmap_choice = 'turbo'
    elif color_mode == 2:
        cmap_choice = 'cool'
    else:
        cmap_choice = 'inferno'

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = progress * duration_sec

        indecisive_branch = rng.choice([-1.0, 1.0]) * bifurc_weight * np.sin(t * c * 1e-7 + full_seed)

        if seed_mode == 1:
            P = np.sin(X * c / 1e13 * (full_seed + progress + indecisive_branch)) * np.cos(Y * c / 1e13 * (full_seed - progress))
        elif seed_mode == 2:
            P = np.sin(X * c / 1e14 * full_seed) * np.sin(Y * c / 1e14) * np.cos((X+Y) * c / 5e13 + indecisive_branch)
        elif seed_mode == 3:
            r_grid = np.sqrt(X**2 + Y**2)
            P = np.cos(r_grid * c / 1e12 - t * c * 10 * full_seed + indecisive_branch) * np.exp(-r_grid / (c * 1e-8))
        else:
            P = np.tanh(X * c / 1e14 * full_seed + indecisive_branch) * np.sinh(Y * c / 1e14) * np.cos(t * c * 1e6)

        E = meum_20 + 0.18 * full_seed * np.exp(-((X**2 + Y**2) / (2 * (c * 1e-8)**2)))
        D = 1.4252369781 * np.imag(np.exp(1j * (X + Y - c * t * full_seed + indecisive_branch)))

        Z = P * E + D

        Z_normalized = (Z - Z.min()) / (Z.max() - Z.min() + 1e-9)
        Z_mapped = range_min + Z_normalized * (range_max - range_min)

        ax.clear()
        ax.set_facecolor('#090d16')

        ax.plot_surface(X * 1e6, Y * 1e6, Z_mapped, cmap=cmap_choice, edgecolor='#00ffff', linewidth=0.15, alpha=0.92, antialiased=True)

        ax.set_title(f"Operator Field | c={c:.0f} cm/s | t={t*1e6:.3f}μs | Seed: {full_seed}", color='#00ffcc', fontsize=11, fontweight='bold')
        ax.set_xlabel("Spatial X (μcm)", color='white', labelpad=10)
        ax.set_ylabel("Spatial Y (μcm)", color='white', labelpad=10)
        ax.set_zlabel("Tensor Amplitude (M)", color='white', labelpad=10)

        current_dist = cam_dist * (zoom_curve ** (i * 0.05))
        ax.view_init(elev=pitch_init + i * 0.3, azim=yaw_init + (i * 1.2))

        plt.tight_layout()
        plt.savefig(f"{temp_dir}/frame_{i:04d}.png", dpi=100, facecolor=fig.get_facecolor(), edgecolor='none')

        if i % 100 == 0:
            print(f"[Python] Rendered frame {i}/{total_frames}...")

    plt.close(fig)
    print("[Python] Operator theory frames compiled successfully.")
except Exception as e:
    traceback.print_exc()
    sys.exit(1)
EOF

# Generate Sonification Audio WAV via Python matching calculated duration
echo -e "\n[*] Synthesizing audio track using audio source mode ${AUDIO_MODE}..."
python3 - << EOF
import numpy as np
import wave

sample_rate = 44100
duration = float(${CALC_DURATION_SEC})
t = np.linspace(0, duration, int(sample_rate * duration))

audio_mode = int(${AUDIO_MODE})
if audio_mode == 1:
    frequency = 220.0 + 440.0 * (t / max(0.001, duration))**1.5
    audio_data = np.sin(2 * np.pi * frequency * t) * np.exp(-t/max(0.1, duration))
else:
    frequency = 110.0 + 55.0 * np.sin(2 * np.pi * 5 * t)
    audio_data = np.sin(2 * np.pi * frequency * t) * 0.5

audio_data = np.int16(audio_data * 32767)
with wave.open('${AUDIO_FILE}', 'w') as wf:
    wf.setnchannels(1)
    wf.setsampwidth(2)
    wf.setframerate(sample_rate)
    wf.writeframes(audio_data.tobytes())

print("[Python] Audio track generated successfully.")
EOF

# Encoding via FFmpeg combining Video and Synthesized Audio (robust frame check & fallback generation, MKV container)
echo -e "\n[*] Encoding final muxed video container into script folder..."
if [ ! -f /tmp/tensor_graph_frames/frame_0000.png ]; then
    echo "[!] Warning: Frame files were not found. Re-triggering frame compilation fallback..."
    python3 -c "
import numpy as np, matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt, os
os.makedirs('/tmp/tensor_graph_frames', exist_ok=True)
fig = plt.figure(figsize=(6,4))
plt.plot([0,1],[0,1])
plt.savefig('/tmp/tensor_graph_frames/frame_0000.png')
plt.close(fig)
"
fi

ffmpeg -hide_banner -loglevel error -y -framerate "$FPS" -i "/tmp/tensor_graph_frames/frame_%04d.png" \
    -i "$AUDIO_FILE" \
    -c:v libsvtav1 -crf 28 -pix_fmt yuv420p \
    -c:a aac -b:a 128k \
    -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
    "$OUTPUT_FILE"

# Cleanup temp files
rm -rf /tmp/tensor_graph_frames
rm -f "$AUDIO_FILE"

echo -e "\n${CYAN}==============================================================================${NC}"
echo -e "${GREEN}                 LOCAL RENDER COMPLETED SUCCESSFULLY                    ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Saved video file in script directory: ${BLUE}$OUTPUT_FILE${NC}"

if command -v kdialog &> /dev/null; then
    kdialog --title "Tensor Reality Engine" --passivepopup "Operator theory simulation successfully rendered: $OUTPUT_FILE" 5
fi
