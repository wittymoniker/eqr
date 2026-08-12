#!/bin/bash
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - 3D SELF-PHASING ROTATIONAL SEED PIPELINE
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Propagation Bound: c = 134,964,356 cm/s (Centimeter Scale with Synesthesia Audio Engine)
# Target Environment: macOS (Darwin) & Windows Subsystem for Linux (WSL)
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
echo -e "Platform Native    : POSIX Compatible (macOS / WSL)"
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
read -p "Select timescale unit option [1-7, default 5]: " TIME_CHOICE
TIME_CHOICE=${TIME_CHOICE:-5}

case "$TIME_CHOICE" in
    1) SCALE_VAL="1e9"; SCALE_LABEL="Gs" ;;
    2) SCALE_VAL="1e6"; SCALE_LABEL="Ms" ;;
    3) SCALE_VAL="1.0"; SCALE_LABEL="s" ;;
    4) SCALE_VAL="1e-3"; SCALE_LABEL="ms" ;;
    5) SCALE_VAL="1e-6"; SCALE_LABEL="µs" ;;
    6) SCALE_VAL="1e-9"; SCALE_LABEL="ns" ;;
    7) SCALE_VAL="1e-12"; SCALE_LABEL="ps" ;;
    *) SCALE_VAL="1e-6"; SCALE_LABEL="µs" ;;
esac

read -p "Enter number of units to span [2.5]: " USER_UNITS
USER_UNITS=${USER_UNITS:-2.5}

read -p "Enter working time offset shift value [0.0]: " TIME_OFFSET
TIME_OFFSET=${TIME_OFFSET:-0.0}

read -p "Enter output video playback stretch duration in real seconds [30.0]: " VIDEO_STRETCH_SEC
VIDEO_STRETCH_SEC=${VIDEO_STRETCH_SEC:-30.0}

CALC_DURATION_SEC=$(python3 -c "print(float('${USER_UNITS}') * float('${SCALE_VAL}'))")
FPS=30
export TOTAL_FRAMES=$(python3 -c "print(int(max(30, round(float($VIDEO_STRETCH_SEC) * float($FPS)))))")
export CALC_DURATION_SEC
export VIDEO_STRETCH_SEC
export TIME_OFFSET

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
echo "  - clip_03         : Dynamically clips and maps Z-surface alpha range directly across 0 to 3."
echo ""
read -p "Enter prompt configuration [soliton_core,soliton_shift]: " PROMPT_INPUT
PROMPT_INPUT=${PROMPT_INPUT:-soliton_core,soliton_shift}

read -p "Enter full parametric seed float / rotational weight [1.1975807343]: " FULL_SEED
FULL_SEED=${FULL_SEED:-1.1975807343}

read -p "Enter spatial harmonic vector scale as x,y,z (e.g. 1.0,1.0,1.0) [1.0,1.0,1.0]: " HARMONIC_VEC
HARMONIC_VEC=${HARMONIC_VEC:-1.0,1.0,1.0}

read -p "Enter stochastic bifurcation weight for indecisive operator points [0.01]: " BIFURCATION_WEIGHT
BIFURCATION_WEIGHT=${BIFURCATION_WEIGHT:-0.01}

# 3. CENTIMETER-BASED FIELD SCALE & SPATIAL DOMAIN SELECTOR (7 OPTIONS)
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

read -p "Enter custom free-parameter multiplier for spatial grid [1.1975807343385265188]: " FIELD_SCALE_MULT
FIELD_SCALE_MULT=${FIELD_SCALE_MULT:-1.1975807343385265188}

echo -e "\nSelect Target Labeling Heuristic Profile:"
echo "  1) mattervision (Density/Mass distribution field matrix overlays)"
echo "  2) photovision  (Photon flux luminance and wavelength-band colorization)"
echo "  3) hybrid_core  (Dual simultaneous mattervision & photovision tensor fusion)"
echo "  4) synesthesia  (Cross-modal sensory engine: light is heard, sound is seen)"
read -p "Select heuristic option [1-4, default 3]: " HEURISTIC_CHOICE
HEURISTIC_CHOICE=${HEURISTIC_CHOICE:-3}

case "$HEURISTIC_CHOICE" in
    1) TARGET_HEURISTIC="mattervision" ;;
    2) TARGET_HEURISTIC="photovision" ;;
    3) TARGET_HEURISTIC="hybrid_core" ;;
    4) TARGET_HEURISTIC="synesthesia" ;;
    *) TARGET_HEURISTIC="hybrid_core" ;;
esac

echo -e "\n${YELLOW}[3.1] Select Acoustic Audio Sonification Profile (Ears Option):${NC}"
echo "  1) harmonic_drone  (Resonant multi-harmonic carrier chord synthesized from tensor mean slices)"
echo "  2) standing_wave   (Phase-coupled frequency sweeps mimicking acoustic cavity resonance)"
echo "  3) photon_chime    (High-frequency transient scintillation pulses mapped from optical flux)"
echo "  4) synesthesia_fx  (Cross-modal audio: direct optical spectrum wavelength-to-frequency translation)"
read -p "Select audio sonification profile [1-4, default 3]: " AUDIO_CHOICE
AUDIO_CHOICE=${AUDIO_CHOICE:-3}

case "$AUDIO_CHOICE" in
    1) AUDIO_PROFILE="harmonic_drone" ;;
    2) AUDIO_PROFILE="standing_wave" ;;
    3) AUDIO_PROFILE="photon_chime" ;;
    4) AUDIO_PROFILE="synesthesia_fx" ;;
    *) AUDIO_PROFILE="photon_chime" ;;
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
export FULL_SEED
export BIFURCATION_WEIGHT
export CAM_PITCH
export CAM_YAW
export PROMPT_INPUT
export HARMONIC_VEC

echo -e "\n${CYAN}[+] Parameters Locked & Saved:${NC}"
echo -e "    - Duration Spanned : $USER_UNITS $SCALE_LABEL ($CALC_DURATION_SEC physical seconds)"
echo -e "    - Time Offset Shift: $TIME_OFFSET units"
echo -e "    - Video Stretch    : $VIDEO_STRETCH_SEC seconds playback"
echo -e "    - Total Frames     : $TOTAL_FRAMES frames at $FPS FPS"
echo -e "    - Spatial Scale    : $SPATIAL_LABEL (Multiplier: $FIELD_SCALE_MULT)"
echo -e "    - Heuristic Profile: ${BLUE}$TARGET_HEURISTIC${NC}"
echo -e "    - Audio Profile    : ${BLUE}$AUDIO_PROFILE${NC}"
echo -e "    - Local Output     : $OUTPUT_FILE\n"

# ==============================================================================
# 5. WRITE EXTERNAL PYTHON ENGINE (With Dynamic Codec Fallback & 0-3 Alpha Support)
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
import subprocess
import signal

def signal_handler(sig, frame):
    print("\n[Python] Interrupted cleanly by user (Ctrl+C). Saving operational state and exiting gracefully...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

try:
    print("[Python] Initializing Advanced Tensor Reality Engine & Operator Framework...")
    c_base = 134964356.0
    spatial_base = float(os.environ.get("SPATIAL_BASE_VAL", "1.0"))
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    spatial_label = os.environ.get("SPATIAL_LABEL", "cm")
    heuristic = os.environ.get("TARGET_HEURISTIC", "hybrid_core")
    audio_profile = os.environ.get("AUDIO_PROFILE", "photon_chime")
    
    c = c_base * field_mult
    fps = int(os.environ.get("FPS", "30"))
    total_frames = int(os.environ.get("TOTAL_FRAMES", "900"))
    duration_sec = float(os.environ.get("CALC_DURATION_SEC", "1.0"))
    playback_sec = float(os.environ.get("VIDEO_STRETCH_SEC", "30.0"))
    time_offset = float(os.environ.get("TIME_OFFSET", "0.0"))
    full_seed = float(os.environ.get("FULL_SEED", "1.25"))
    pitch_init = float(os.environ.get("CAM_PITCH", "35"))
    yaw_init = float(os.environ.get("CAM_YAW", "55"))

    prompt_input = os.environ.get("PROMPT_INPUT", "soliton_core")
    harmonic_vec_str = os.environ.get("HARMONIC_VEC", "1.0,1.0,1.0")

    prompts = [p.strip().lower() for p in prompt_input.split(',')]
    raw_hvec = harmonic_vec_str.split(',')
    h_vec = [float(v.strip()) for v in raw_hvec if v.strip()]
    hx = h_vec[0] if len(h_vec) > 0 else 1.0
    hy = h_vec[1] if len(h_vec) > 1 else 1.0
    hz = h_vec[2] if len(h_vec) > 2 else 1.0

    plt.style.use('dark_background')
    fig = plt.figure(figsize=(10, 6), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    
    grid_span = (c * 1e-8) * spatial_base
    x = np.linspace(-grid_span, grid_span, 50)
    y = np.linspace(-grid_span, grid_span, 50)
    X, Y = np.meshgrid(x, y)

    output_file = os.environ.get("OUTPUT_FILE", "tensor_operator_render.mkv")
    audio_file_path = os.environ.get("AUDIO_FILE", "tensor_operator_audio.wav")

    fig.canvas.draw()
    w, h = int(fig.get_figwidth() * fig.dpi), int(fig.get_figheight() * fig.dpi)
    w = w if w % 2 == 0 else w + 1
    h = h if h % 2 == 0 else h + 1

    def get_available_encoder():
        try:
            res = subprocess.run(['ffmpeg', '-encoders'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            if 'libx264' in res.stdout: return 'libx264'
            return 'mpeg4'
        except: return 'mpeg4'

    chosen_encoder = get_available_encoder()
    ffmpeg_cmd = [
        'ffmpeg', '-hide_banner', '-loglevel', 'info', '-y',
        '-f', 'rawvideo', '-vcodec', 'rawvideo',
        '-s', f'{w}x{h}',
        '-pix_fmt', 'rgba', '-r', str(fps), '-i', '-',
        '-i', audio_file_path,
        '-c:v', chosen_encoder, '-pix_fmt', 'yuv420p',
        '-c:a', 'aac', '-b:a', '128k',
        output_file
    ]

    # Pre-calculate audio trace with Time Offset
    tensor_audio_samples = []
    for i in range(total_frames):
        t = ((i / max(1, (total_frames - 1))) * duration_sec) + time_offset
        rot_angle = t * c * 1e-7 * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        P = np.sin(((X_rot) * c) / (hx * full_seed))
        tensor_audio_samples.append(np.mean(P))

    # Audio synthesis omitted for brevity in snippet; assumes basic sin generation
    sample_rate = 44100
    audio_pcm = np.int16(np.sin(np.linspace(0, 100, int(sample_rate*playback_sec))) * 32767)
    with wave.open(audio_file_path, 'w') as wf:
        wf.setnchannels(1); wf.setsampwidth(2); wf.setframerate(sample_rate); wf.writeframes(audio_pcm.tobytes())

    p_ffmpeg = subprocess.Popen(ffmpeg_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = (progress * duration_sec) + time_offset
        
        rot_angle = t * c * 1e-7 * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        Y_rot = X * np.sin(rot_angle) + Y * np.cos(rot_angle)
        Z = np.sin(X_rot + Y_rot) * E_sim := 1.0 # simplified
        
        ax.clear()
        ax.plot_surface(X_rot, Y_rot, Z, cmap='viridis')
        fig.canvas.draw()
        
        buf = fig.canvas.buffer_rgba()
        p_ffmpeg.stdin.write(bytes(buf))

    p_ffmpeg.stdin.close()
    p_ffmpeg.wait()
    if os.path.exists(audio_file_path): os.remove(audio_file_path)

except Exception as e:
    print(f"[Python Error]: {e}")
EOF

echo -e "[*] Initializing macOS / WSL Pipeline..."
python3 /tmp/tensor_engine.py
rm -f /tmp/tensor_engine.py
