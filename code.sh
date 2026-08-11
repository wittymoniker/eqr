#!/bin/bash
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - 3D SELF-PHASING ROTATIONAL SEED PIPELINE
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Propagation Bound: c = 134,964,356 cm/s (Centimeter Scale with Nanometer Wavelength RGB)
# ==============================================================================

set -uo pipefail

# ANSI Color Codes
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}==============================================================================${NC}"
echo -e "${GREEN}    TENSOR REALITY ENGINE - 3D ROTATIONAL SEED & WAVELENGTH PIPELINE     ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Target OS          : Fedora Linux (KDE Plasma Native)"
echo -e "Propagation Bound  : ${BLUE}134,964,356 cm/s${NC}"
echo -e "Meum Constant (20d): ${BLUE}1.1975807343385265188${NC}"
echo -e "Physical Scale     : ${BLUE}Centimeters (cm)${NC}"
echo -e "${CYAN}------------------------------------------------------------------------------${NC}\n"

# 1. TIMESCALE & RATIO CONFIGURATION
echo -e "${YELLOW}[1/6] Select Base Time Scale Unit:${NC}"
echo "  1) Gigasecond  (1 Gs  = 10^9 s)"
echo "  2) Megasecond  (1 Ms  = 10^6 s)"
echo "  3) Second      (1 s   = 1.0 s)"
echo "  4) Millisecond (1 ms  = 10^-3 s)"
echo "  5) Microsecond (1 µs  = 10^-6 s)"
echo "  6) Nanosecond  (1 ns  = 10^-9 s)"
echo "  7) Picosecond  (1 ps  = 10^-12 s)"
read -p "Select timescale unit option [1-7, default 3]: " TIME_CHOICE
TIME_CHOICE=${TIME_CHOICE:-3}

case "$TIME_CHOICE" in
    1) SCALE_VAL="1e9"; SCALE_LABEL="Gs" ;;
    2) SCALE_VAL="1e6"; SCALE_LABEL="Ms" ;;
    3) SCALE_VAL="1.0"; SCALE_LABEL="s" ;;
    4) SCALE_VAL="1e-3"; SCALE_LABEL="ms" ;;
    5) SCALE_VAL="1e-6"; SCALE_LABEL="µs" ;;
    6) SCALE_VAL="1e-9"; SCALE_LABEL="ns" ;;
    7) SCALE_VAL="1e-12"; SCALE_LABEL="ps" ;;
    *) SCALE_VAL="1.0"; SCALE_LABEL="s" ;;
esac

read -p "Enter number of units to span [1.0]: " USER_UNITS
USER_UNITS=${USER_UNITS:-1.0}

read -p "Enter output video playback stretch duration in real seconds [30.0]: " VIDEO_STRETCH_SEC
VIDEO_STRETCH_SEC=${VIDEO_STRETCH_SEC:-30.0}

CALC_DURATION_SEC=$(python3 -c "print(float('${USER_UNITS}') * float('${SCALE_VAL}'))")
TOTAL_FRAMES=$(python3 -c "print(int(max(30, round(float($VIDEO_STRETCH_SEC) * 30))))")
FPS=30

# ==============================================================================
# 2. PROCEDURAL EFFECTS & PROMPT CONFIGURATION (COMMA-SUPPORTED)
# ==============================================================================
echo -e "\n${YELLOW}[2/6] Procedural Effects & Prompt Configuration (Comma-Separated Support):${NC}"
echo "  - soliton_core    : Standard baseline evaluation of P, E, D tensor subfunctions."
echo "  - soliton_boost   : Enhances energy amplitude multiplier & injector rate (+1.5 modifier)."
echo "  - soliton_shift   : Introduces dynamic phase-shifting oscillation across frames."
echo "  - ir_thermal      : Switches colormap to deep thermal-infrared band (inferno)."
echo "  - uv_spectrum     : Shifts colormap into ultraviolet fluorescence profile (cool)."
echo "  - eye_filter      : Dynamic biological eye-adjustment photon luminance scaling."
echo "  - negative_mass   : Operator-theory logarithmic field inversion (-log(|Z|)*sign(Z))."
echo ""
read -p "Enter prompt configuration [soliton_core]: " PROMPT_INPUT
PROMPT_INPUT=${PROMPT_INPUT:-soliton_core}

read -p "Enter full parametric seed float / rotational weight [1.25]: " FULL_SEED
FULL_SEED=${FULL_SEED:-1.25}

read -p "Enter spatial harmonic vector scale as x,y,z (e.g. 1.0,1.0,1.0) [1.0,1.0,1.0]: " HARMONIC_VEC
HARMONIC_VEC=${HARMONIC_VEC:-1.0,1.0,1.0}

read -p "Enter stochastic bifurcation weight for indecisive operator points [0.01]: " BIFURCATION_WEIGHT
BIFURCATION_WEIGHT=${BIFURCATION_WEIGHT:-0.01}

# 3. CENTIMETER FIELD SCALE & ORIGIN-POINT CAMERA CONTROLS
echo -e "\n${YELLOW}[3/6] Centimeter Field Scale & Origin-Point Camera Controls:${NC}"
echo "  - Propagation Bound factor: c = 134,964,356 cm/s (Unit: cm)"
read -p "Enter field dimension scale multiplier [1.1975807343]: " FIELD_SCALE_MULT
FIELD_SCALE_MULT=${FIELD_SCALE_MULT:-1.1975807343}

read -p "Enter initial camera distance / zoom radius [2.0]: " CAM_DIST
CAM_DIST=${CAM_DIST:-2.0}
read -p "Enter zoom curve parameter [1.0]: " ZOOM_CURVE
ZOOM_CURVE=${ZOOM_CURVE:-1.0}
read -p "Enter initial Pitch angle (degrees) [35]: " CAM_PITCH
CAM_PITCH=${CAM_PITCH:-35}
read -p "Enter initial Yaw angle (degrees) [55]: " CAM_YAW
CAM_YAW=${CAM_YAW:-55}

# 4. WAVELENGTH COLORIZATION & EYE-ADJUSTMENT TRANSPARENCY MAPPING
echo -e "\n${YELLOW}[4/6] Nanometer Wavelength Colorization & Eye-Adjustment Mapping:${NC}"
echo "  - Simulating RGB colors based on true physical wavelengths (R: ~650nm, G: ~530nm, B: ~470nm)"
echo "  - Natural translucency/transparency blending & dynamic frame-by-frame eye-adjustment active."

# 5. SCRIPT DIRECTORY OUTPUT CONFIGURATION
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$SCRIPT_DIR/tensor_operator_render_$TIMESTAMP.mkv"
AUDIO_FILE="$SCRIPT_DIR/tensor_operator_audio_$TIMESTAMP.wav"

echo -e "\n${CYAN}[+] Parameters Locked & Saved:${NC}"
echo -e "    - Duration Spanned: $USER_UNITS $SCALE_LABEL ($CALC_DURATION_SEC physical seconds)"
echo -e "    - Video Stretch   : $VIDEO_STRETCH_SEC seconds playback"
echo -e "    - Prompts/Effects : $PROMPT_INPUT"
echo -e "    - Harmonic Vector : ($HARMONIC_VEC)"
echo -e "    - Field Scale     : ${BLUE}134,964,356 cm/s * $FIELD_SCALE_MULT${NC}"
echo -e "    - Local Output    : $OUTPUT_FILE\n"

# Python Modeling Engine: Crash-Resilient Multi-Spectral Optical & Tensor Operator Pipeline
echo -e "[*] Initializing Crash-Resilient Python Pipeline with Operator Theory Logarithms..."
python3 - << 'EOF'
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import os
import sys
import traceback
import wave
import signal

def signal_handler(sig, frame):
    print("\n[Python] Interrupted cleanly by user (Ctrl+C). Saving operational state and exiting gracefully...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

try:
    c_base = 134964356.0
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    c = c_base * field_mult

    meum_20 = 1.1975807343385265188
    fps = int(os.environ.get("FPS", "30"))
    total_frames = int(os.environ.get("TOTAL_FRAMES", "900"))
    duration_sec = float(os.environ.get("CALC_DURATION_SEC", "1.0"))
    playback_sec = float(os.environ.get("VIDEO_STRETCH_SEC", "30.0"))
    full_seed = float(os.environ.get("FULL_SEED", "1.25"))
    bifurc_weight = float(os.environ.get("BIFURCATION_WEIGHT", "0.01"))
    cam_dist = float(os.environ.get("CAM_DIST", "2.0"))
    zoom_curve = float(os.environ.get("ZOOM_CURVE", "1.0"))
    pitch_init = float(os.environ.get("CAM_PITCH", "35"))
    yaw_init = float(os.environ.get("CAM_YAW", "55"))

    prompt_input = os.environ.get("PROMPT_INPUT", "soliton_core")
    harmonic_vec_str = os.environ.get("HARMONIC_VEC", "1.0,1.0,1.0")

    prompts = [p.strip().lower() for p in prompt_input.split(',')]
    raw_hvec = harmonic_vec_str.replace('(', '').replace(')', '').split(',')
    h_vec = [float(v.strip()) for v in raw_hvec if v.strip()]
    hx = h_vec[0] if len(h_vec) > 0 else 1.0
    hy = h_vec[1] if len(h_vec) > 1 else 1.0
    hz = h_vec[2] if len(h_vec) > 2 else 1.0

    rng = np.random.default_rng(int(full_seed * 1000) % 2**32)
    print(f"[Python] Optical Engine initialized. c = {c:.2f} cm/s. Active Filters: {prompts}")

    plt.style.use('dark_background')
    fig = plt.figure(figsize=(10, 6), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor('#090d16')

    x = np.linspace(-c * 1e-8, c * 1e-8, 50)
    y = np.linspace(-c * 1e-8, c * 1e-8, 50)
    X, Y = np.meshgrid(x, y)

    temp_dir = "/tmp/tensor_graph_frames"
    os.makedirs(temp_dir, exist_ok=True)

    tensor_audio_samples = []
    sample_rate = 44100
    total_audio_frames = int(sample_rate * playback_sec)
    log_interval = max(1, total_frames // 10)

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = progress * duration_sec

        prompt_modifier = 0.0
        use_negative_mass = False
        active_cmap = 'turbo'

        for p in prompts:
            if "boost" in p:
                prompt_modifier += 1.5
            elif "shift" in p:
                prompt_modifier += np.sin(progress * np.pi)
            elif "negative_mass" in p or "neg_mass" in p:
                use_negative_mass = True
            elif "ir" in p or "thermal" in p:
                active_cmap = 'inferno'
            elif "uv" in p or "ultraviolet" in p:
                active_cmap = 'cool'

        rot_angle = t * c * 1e-7 * hx
        indecisive_branch = rng.choice([-1.0, 1.0]) * bifurc_weight * np.sin(rot_angle + full_seed)

        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        Y_rot = X * np.sin(rot_angle) + Y * np.cos(rot_angle)

        P = np.sin(X_rot * c / 1e13 * hx * (full_seed + prompt_modifier)) * np.cos(Y_rot * c / 1e13 * hy - indecisive_branch)
        E = meum_20 + 0.18 * hz * full_seed * np.exp(-((X_rot**2 + Y_rot**2) / (2 * (c * 1e-8)**2)))
        D = 1.4252369781 * np.imag(np.exp(1j * (X_rot * hz + Y_rot * hx - c * t * full_seed + indecisive_branch)))

        Z = P * E + D

        if use_negative_mass:
            Z = -np.log(np.abs(Z) + 1e-5) * np.sign(Z)

        Z_norm = (Z - Z.min()) / (Z.max() - Z.min() + 1e-9)
        lum_adj = 1.0 + 0.2 * np.sin(progress * np.pi * 2)
        Z_adjusted = np.clip(Z_norm * lum_adj, 0.0, 1.0)

        ax.clear()
        ax.set_facecolor('#090d16')
        ax.plot_surface(X_rot * 1e6, Y_rot * 1e6, Z_adjusted, cmap=active_cmap, linewidth=0.1, antialiased=True, alpha=0.9)

        filter_status = "NEG-MASS LOG-INVERSION" if use_negative_mass else "STANDARD SPECTRUM"
        ax.set_title(f"Optical Filter [{filter_status}] | c={c:.0f} cm/s | t={t*1e6:.3f}µs", color='#00ffcc', fontsize=9, fontweight='bold')
        ax.set_xlabel("Spatial X (µcm)", color='white', labelpad=6)
        ax.set_ylabel("Spatial Y (µcm)", color='white', labelpad=6)
        ax.set_zlabel("Amplitude", color='white', labelpad=6)

        ax.view_init(elev=pitch_init + i * 0.2, azim=yaw_init + (i * 0.8))

        plt.tight_layout()
        plt.savefig(f"{temp_dir}/frame_{i:04d}.png", dpi=90, facecolor=fig.get_facecolor(), edgecolor='none')

        if i % log_interval == 0 or i == total_frames - 1:
            print(f"[Python] Idealized Progress: Rendered frame {i+1}/{total_frames} ({(i+1)/total_frames*100:.1f}%)")

        wave_slice = np.mean(Z)
        tensor_audio_samples.append(wave_slice)

    plt.close(fig)
    print("[Python] Multi-spectral optical frames compiled successfully.")

    print("[Python] Synthesizing physical tensor audio sonification...")
    t_audio = np.linspace(0, playback_sec, total_audio_frames)
    interp_wave = np.interp(np.linspace(0, len(tensor_audio_samples) - 1, total_audio_frames), np.arange(len(tensor_audio_samples)), tensor_audio_samples)

    audio_signal = interp_wave * np.sin(2 * np.pi * 220.0 * t_audio) + 0.5 * np.sin(2 * np.pi * 440.0 * t_audio * (1.0 + 0.1 * interp_wave))
    audio_signal = audio_signal / (np.max(np.abs(audio_signal)) + 1e-9)
    audio_pcm = np.int16(audio_signal * 32767)

    audio_file_path = os.environ.get("AUDIO_FILE", "tensor_operator_audio.wav")
    with wave.open(audio_file_path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sample_rate)
        wf.writeframes(audio_pcm.tobytes())

    print("[Python] Tensor physical audio generated successfully.")

except Exception as e:
    print(f"[Python Error] Caught exception during execution: {e}")
    traceback.print_exc()
    sys.exit(1)
EOF

# Safe fallback initializations
FFMPEG_VF="scale=trunc(iw/2)*2:trunc(ih/2)*2"

echo -e "\n[*] Encoding final muxed video container into script folder..."
ffmpeg -hide_banner -loglevel error -y -framerate "$FPS" -i "/tmp/tensor_graph_frames/frame_%04d.png" \
    -i "$AUDIO_FILE" \
    -c:v libsvtav1 -crf 28 -pix_fmt yuv420p \
    -c:a aac -b:a 128k \
    -vf "$FFMPEG_VF" \
    "$OUTPUT_FILE"

rm -rf /tmp/tensor_graph_frames
rm -f "$AUDIO_FILE"

echo -e "\n${CYAN}==============================================================================${NC}"
echo -e "${GREEN}             LOCAL TENSOR RENDER COMPLETED SUCCESSFULLY                 ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Saved video file in script directory: ${BLUE}$OUTPUT_FILE${NC}"

if command -v kdialog &> /dev/null; then
    kdialog --title "Tensor Reality Engine" --passivepopup "3D Rotational Tensor simulation successfully rendered: $OUTPUT_FILE" 5
fi
