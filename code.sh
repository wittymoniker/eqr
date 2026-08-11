#!/bin/bash
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - 3D SELF-PHASING ROTATIONAL SEED PIPELINE
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Propagation Bound: c = 134,964,356 cm/s (Centimeter Scale with Synesthesia Audio Engine)
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
FPS=30
export TOTAL_FRAMES=$(python3 -c "print(int(max(30, round(float($VIDEO_STRETCH_SEC) * float($FPS)))))")
export CALC_DURATION_SEC

# ==============================================================================
# 2. PROCEDURAL EFFECTS & PROMPT CONFIGURATION
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

# 3. CENTIMETER-BASED FIELD SCALE & SPATIAL DOMAIN SELECTOR
echo -e "\n${YELLOW}[3/6] Centimeter-Based Spatial Scale & Heuristics:${NC}"
echo "Select Base Spatial Dimension Scale Unit (Metric relative to cm):"
echo "  1) Gigameter   (Gm  = 10^11 cm)"
echo "  2) Megameter   (Mm  = 10^8 cm)"
echo "  3) Kilometer   (km  = 10^5 cm)"
echo "  4) Centimeter  (cm  = 10^0 cm)"
echo "  5) Micrometer  (µm  = 10^-4 cm)"
echo "  6) Nanometer   (nm  = 10^-7 cm)"
echo "  7) Picometer   (pm  = 10^-10 cm)"
read -p "Select spatial domain scale option [1-7, default 4]: " SPATIAL_CHOICE
SPATIAL_CHOICE=${SPATIAL_CHOICE:-4}

case "$SPATIAL_CHOICE" in
    1) SPATIAL_BASE_VAL="1e11"; SPATIAL_LABEL="Gm" ;;
    2) SPATIAL_BASE_VAL="1e8"; SPATIAL_LABEL="Mm" ;;
    3) SPATIAL_BASE_VAL="1e5"; SPATIAL_LABEL="km" ;;
    4) SPATIAL_BASE_VAL="1.0"; SPATIAL_LABEL="cm" ;;
    5) SPATIAL_BASE_VAL="1e-4"; SPATIAL_LABEL="µm" ;;
    6) SPATIAL_BASE_VAL="1e-7"; SPATIAL_LABEL="nm" ;;
    7) SPATIAL_BASE_VAL="1e-10"; SPATIAL_LABEL="pm" ;;
    *) SPATIAL_BASE_VAL="1.0"; SPATIAL_LABEL="cm" ;;
esac

read -p "Enter custom free-parameter multiplier for spatial grid [1.1975807343]: " FIELD_SCALE_MULT
FIELD_SCALE_MULT=${FIELD_SCALE_MULT:-1.1975807343}

echo -e "\nSelect Target Labeling Heuristic Profile:"
echo "  1) mattervision (Density/Mass distribution field matrix overlays)"
echo "  2) photovision  (Photon flux luminance and wavelength-band colorization)"
echo "  3) hybrid_core  (Dual simultaneous mattervision & photovision tensor fusion)"
echo "  4) synesthesia  (Cross-modal sensory engine: light is heard, sound is seen)"
read -p "Select heuristic option [1-4, default 2]: " HEURISTIC_CHOICE
HEURISTIC_CHOICE=${HEURISTIC_CHOICE:-2}

case "$HEURISTIC_CHOICE" in
    1) TARGET_HEURISTIC="mattervision" ;;
    2) TARGET_HEURISTIC="photovision" ;;
    3) TARGET_HEURISTIC="hybrid_core" ;;
    4) TARGET_HEURISTIC="synesthesia" ;;
    *) TARGET_HEURISTIC="photovision" ;;
esac

echo -e "\n${YELLOW}[3.1] Select Acoustic Audio Sonification Profile (Ears Option):${NC}"
echo "  1) harmonic_drone  (Resonant multi-harmonic carrier chord synthesized from tensor mean slices)"
echo "  2) standing_wave   (Phase-coupled frequency sweeps mimicking acoustic cavity resonance)"
echo "  3) photon_chime    (High-frequency transient scintillation pulses mapped from optical flux)"
echo "  4) synesthesia_fx  (Cross-modal audio: direct optical spectrum wavelength-to-frequency translation)"
read -p "Select audio sonification profile [1-4, default 1]: " AUDIO_CHOICE
AUDIO_CHOICE=${AUDIO_CHOICE:-1}

case "$AUDIO_CHOICE" in
    1) AUDIO_PROFILE="harmonic_drone" ;;
    2) AUDIO_PROFILE="standing_wave" ;;
    3) AUDIO_PROFILE="photon_chime" ;;
    4) AUDIO_PROFILE="synesthesia_fx" ;;
    *) AUDIO_PROFILE="harmonic_drone" ;;
esac

read -p "Enter initial camera distance / zoom radius [2.0]: " CAM_DIST
CAM_DIST=${CAM_DIST:-2.0}
read -p "Enter zoom curve parameter [1.0]: " ZOOM_CURVE
ZOOM_CURVE=${ZOOM_CURVE:-1.0}
read -p "Enter initial Pitch angle (degrees) [35]: " CAM_PITCH
CAM_PITCH=${CAM_PITCH:-35}
read -p "Enter initial Yaw angle (degrees) [55]: " CAM_YAW
CAM_YAW=${CAM_YAW:-55}

# 4. EXPORT ENVIRONMENT VARIABLES FOR PYTHON
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
export OUTPUT_FILE="$SCRIPT_DIR/tensor_operator_render_$TIMESTAMP.mkv"
export AUDIO_FILE="$SCRIPT_DIR/tensor_operator_audio_$TIMESTAMP.wav"

export SPATIAL_BASE_VAL
export SPATIAL_LABEL
export TARGET_HEURISTIC
export AUDIO_PROFILE
export FIELD_SCALE_MULT
export FPS
export VIDEO_STRETCH_SEC
export FULL_SEED
export BIFURCATION_WEIGHT
export CAM_PITCH
export CAM_YAW
export PROMPT_INPUT
export HARMONIC_VEC

echo -e "\n${CYAN}[+] Parameters Locked & Saved:${NC}"
echo -e "    - Duration Spanned : $USER_UNITS $SCALE_LABEL ($CALC_DURATION_SEC physical seconds)"
echo -e "    - Video Stretch    : $VIDEO_STRETCH_SEC seconds playback"
echo -e "    - Total Frames     : $TOTAL_FRAMES frames at $FPS FPS"
echo -e "    - Spatial Scale    : $SPATIAL_LABEL (Multiplier: $FIELD_SCALE_MULT)"
echo -e "    - Heuristic Profile: ${BLUE}$TARGET_HEURISTIC${NC}"
echo -e "    - Audio Profile    : ${BLUE}$AUDIO_PROFILE${NC}"
echo -e "    - Local Output     : $OUTPUT_FILE\n"

# ==============================================================================
# 5. WRITE EXTERNAL PYTHON ENGINE (Prevents any bash heredoc parenthesis bugs)
# ==============================================================================
cat << 'EOF' > /tmp/tensor_engine.py
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
    spatial_base = float(os.environ.get("SPATIAL_BASE_VAL", "1.0"))
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    spatial_label = os.environ.get("SPATIAL_LABEL", "cm")
    heuristic = os.environ.get("TARGET_HEURISTIC", "photovision")
    audio_profile = os.environ.get("AUDIO_PROFILE", "harmonic_drone")
    
    c = c_base * field_mult

    meum_20 = 1.1975807343385265188
    fps = int(os.environ.get("FPS", "30"))
    total_frames = int(os.environ.get("TOTAL_FRAMES", "900"))
    duration_sec = float(os.environ.get("CALC_DURATION_SEC", "1.0"))
    playback_sec = float(os.environ.get("VIDEO_STRETCH_SEC", "30.0"))
    full_seed = float(os.environ.get("FULL_SEED", "1.25"))
    bifurc_weight = float(os.environ.get("BIFURCATION_WEIGHT", "0.01"))
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
    print(f"[Python] Optical Engine initialized. Scale Unit: {spatial_label}, Heuristic: {heuristic}, Audio: {audio_profile}")

    plt.style.use('dark_background')
    fig = plt.figure(figsize=(10, 6), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor('#090d16')

    grid_span = (c * 1e-8) * spatial_base
    x = np.linspace(-grid_span, grid_span, 50)
    y = np.linspace(-grid_span, grid_span, 50)
    X, Y = np.meshgrid(x, y)

    temp_dir = "/tmp/tensor_graph_frames"
    os.makedirs(temp_dir, exist_ok=True)

    tensor_audio_samples = []
    tensor_luminance_samples = []
    sample_rate = 44100
    total_audio_frames = int(sample_rate * playback_sec)
    log_interval = max(1, total_frames // 10)

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = progress * duration_sec

        prompt_modifier = 0.0
        use_negative_mass = False
        active_cmap = 'turbo'

        if heuristic == "mattervision":
            active_cmap = 'plasma'
        elif heuristic == "hybrid_core":
            active_cmap = 'viridis'
        elif heuristic == "synesthesia":
            active_cmap = 'coolwarm'

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
        E = meum_20 + 0.18 * hz * full_seed * np.exp(-((X_rot**2 + Y_rot**2) / (2 * (grid_span**2 + 1e-9))))
        D = 1.4252369781 * np.imag(np.exp(1j * (X_rot * hz + Y_rot * hx - c * t * full_seed + indecisive_branch)))

        Z = P * E + D

        if use_negative_mass:
            Z = -np.log(np.abs(Z) + 1e-5) * np.sign(Z)

        if heuristic == "mattervision":
            Z = np.abs(Z) * E
        elif heuristic == "hybrid_core":
            Z = Z * (1.0 + 0.5 * np.cos(P))
        elif heuristic == "synesthesia":
            Z = Z * np.sin(np.abs(P) * np.pi + progress * np.pi)

        Z = np.nan_to_num(Z, nan=0.0, posinf=1.0, neginf=-1.0)
        
        z_min, z_max = Z.min(), Z.max()
        if np.isclose(z_min, z_max):
            Z_norm = np.zeros_like(Z)
        else:
            Z_norm = (Z - z_min) / (z_max - z_min + 1e-9)

        lum_adj = 1.0 + 0.2 * np.sin(progress * np.pi * 2)
        Z_adjusted = np.clip(Z_norm * lum_adj, 0.0, 1.0)
        Z_adjusted = np.nan_to_num(Z_adjusted, nan=0.0)

        ax.clear()
        ax.set_facecolor('#090d16')
        ax.plot_surface(X_rot, Y_rot, Z_adjusted, cmap=active_cmap, linewidth=0.1, antialiased=True, alpha=0.9)

        title_prefix = f"SYNESTHESIA [Light->Sound]" if heuristic == "synesthesia" else f"Heuristic [{heuristic.upper}]"
        ax.set_title(f"{title_prefix} | Scale: {spatial_label} | t={t*1e6:.3f}µs", color='#00ffcc', fontsize=9, fontweight='bold')
        ax.set_xlabel(f"Spatial X ({spatial_label})", color='white', labelpad=6)
        ax.set_ylabel(f"Spatial Y ({spatial_label})", color='white', labelpad=6)
        ax.set_zlabel(f"Spatial Z ({spatial_label})", color='white', labelpad=6)

        ax.view_init(elev=pitch_init + i * 0.2, azim=yaw_init + (i * 0.8))

        plt.tight_layout()
        plt.savefig(f"{temp_dir}/frame_{i:04d}.png", dpi=90, facecolor=fig.get_facecolor(), edgecolor='none')

        if i % log_interval == 0 or i == total_frames - 1:
            print(f"[Python] Idealized Progress: Rendered frame {i+1}/{total_frames} ({(i+1)/total_frames*100:.1f}%)")

        wave_slice = np.mean(Z)
        luminance_slice = np.mean(Z_adjusted)
        tensor_audio_samples.append(wave_slice)
        tensor_luminance_samples.append(luminance_slice)

    plt.close(fig)
    print("[Python] Multi-spectral optical frames compiled successfully.")

    print(f"[Python] Synthesizing physical tensor audio ({audio_profile}) & synesthesia mapping...")
    t_audio = np.linspace(0, playback_sec, total_audio_frames)
    interp_wave = np.interp(np.linspace(0, len(tensor_audio_samples) - 1, total_audio_frames), np.arange(len(tensor_audio_samples)), tensor_audio_samples)
    interp_lum = np.interp(np.linspace(0, len(tensor_luminance_samples) - 1, total_audio_frames), np.arange(len(tensor_luminance_samples)), tensor_luminance_samples)

    if audio_profile == "harmonic_drone":
        audio_signal = interp_wave * np.sin(2 * np.pi * 110.0 * t_audio) + 0.5 * interp_lum * np.sin(2 * np.pi * 220.0 * t_audio * (1.0 + 0.1 * interp_wave)) + 0.25 * np.sin(2 * np.pi * 440.0 * t_audio)
    elif audio_profile == "standing_wave":
        audio_signal = np.sin(2 * np.pi * 150.0 * t_audio + interp_wave * np.pi) * np.cos(2 * np.pi * 2.0 * t_audio)
    elif audio_profile == "photon_chime":
        audio_signal = interp_lum * np.sin(2 * np.pi * 587.33 * t_audio + np.cumsum(interp_wave) * 0.01) + 0.3 * np.sin(2 * np.pi * 880.0 * t_audio)
    elif audio_profile == "synesthesia_fx" or heuristic == "synesthesia":
        optical_hz = 400.0 + (interp_lum * 400.0)
        audio_signal = interp_lum * np.sin(2 * np.pi * optical_hz * t_audio) * np.sin(2 * np.pi * 55.0 * t_audio * (1.0 + interp_wave))
    else:
        audio_signal = interp_wave * np.sin(2 * np.pi * 220.0 * t_audio)

    audio_signal = audio_signal / (np.max(np.abs(audio_signal)) + 1e-9)
    audio_pcm = np.int16(audio_signal * 32767)

    audio_file_path = os.environ.get("AUDIO_FILE", "tensor_operator_audio.wav")
    with wave.open(audio_file_path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sample_rate)
        wf.writeframes(audio_pcm.tobytes())

    print("[Python] Tensor physical audio and synesthesia soundmapping generated successfully.")

except Exception as e:
    print(f"[Python Error] Caught exception during execution: {e}")
    traceback.print_exc()
    sys.exit(1)
EOF

echo -e "[*] Initializing Crash-Resilient Python Pipeline with Operator Theory Logarithms..."
python3 /tmp/tensor_engine.py

# ==============================================================================
# BASH ENCODING & MUXING PIPELINE
# ==============================================================================
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
rm -f /tmp/tensor_engine.py

echo -e "\n${CYAN}==============================================================================${NC}"
echo -e "${GREEN}             LOCAL TENSOR RENDER COMPLETED SUCCESSFULLY                 ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Saved video file in script directory: ${BLUE}$OUTPUT_FILE${NC}"

if command -v kdialog &> /dev/null; then
    kdialog --title "Tensor Reality Engine" --passivepopup "3D Rotational Tensor simulation successfully rendered: $OUTPUT_FILE" 5
fi
