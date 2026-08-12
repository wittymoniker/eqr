#!/bin/bash
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - MASTER EDITION (FEDORA / LINUX)
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Features: Visible Numeric Entries, Time Offset, XYZ Meshgrid, 0-3 Alpha Map
# ==============================================================================

set -uo pipefail

GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}==============================================================================${NC}"
echo -e "${GREEN}    TENSOR REALITY ENGINE - MASTER FEDORA PIPELINE [VERIFIED LABELS]     ${NC}"
echo -e "${CYAN}==============================================================================${NC}"

# 1. TIMESCALE & TIME OFFSET CONFIGURATION
echo -e "\n${YELLOW}[1/6] Select Base Time Scale Unit:${NC}"
echo "  [1] Gigasecond  (1 Gs  = 10^9 seconds)"
echo "  [2] Megasecond  (1 Ms  = 10^6 seconds)"
echo "  [3] Second      (1 s   = 1.0 seconds)"
echo "  [4] Millisecond (1 ms  = 10^-3 seconds)"
echo "  [5] Microsecond (1 µs  = 10^-6 seconds) [DEFAULT]"
echo "  [6] Nanosecond  (1 ns  = 10^-9 seconds)"
echo "  [7] Picosecond  (1 ps  = 10^-12 seconds)"
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

echo -e "-> Active Scale Unit Selected: ${BLUE}${SCALE_LABEL}${NC}"

read -p "Enter number of units to span [numeric, default 2.5]: " USER_UNITS
USER_UNITS=${USER_UNITS:-2.5}

read -p "Enter working time offset shift value [numeric offset, default 0.0]: " TIME_OFFSET
TIME_OFFSET=${TIME_OFFSET:-0.0}

read -p "Enter output video playback stretch duration in real seconds [numeric, default 30.0]: " VIDEO_STRETCH_SEC
VIDEO_STRETCH_SEC=${VIDEO_STRETCH_SEC:-30.0}

CALC_DURATION_SEC=$(python3 -c "print(float('${USER_UNITS}') * float('${SCALE_VAL}'))")
FPS=30
export TOTAL_FRAMES=$(python3 -c "print(int(max(30, round(float($VIDEO_STRETCH_SEC) * float($FPS)))))")
export CALC_DURATION_SEC
export VIDEO_STRETCH_SEC
export TIME_OFFSET

# 2. XYZ MESHGRID & SPATIAL OFFSET CONFIGURATION
echo -e "\n${YELLOW}[2/6] Spatial Coordinate & Volumetric Offset Configuration:${NC}"
echo "  -> Enter numeric offsets to shift the center coordinates of the volumetric domain."
read -p "Enter spatial X meshgrid offset shift [numeric, default 0.0]: " OFFSET_X
OFFSET_X=${OFFSET_X:-0.0}
read -p "Enter spatial Y meshgrid offset shift [numeric, default 0.0]: " OFFSET_Y
OFFSET_Y=${OFFSET_Y:-0.0}
read -p "Enter spatial Z vertical shift offset [numeric, default 0.0]: " OFFSET_Z
OFFSET_Z=${OFFSET_Z:-0.0}

export OFFSET_X
export OFFSET_Y
export OFFSET_Z

# 3. PROCEDURAL EFFECTS & PROMPT CONFIGURATION
echo -e "\n${YELLOW}[3/6] Procedural Effects & Prompt Configuration (Comma-Separated):${NC}"
echo "  Available Operators / Modifiers:"
echo "    - soliton_core    : Standard baseline evaluation of P, E, D tensor subfunctions."
echo "    - soliton_boost   : Enhances energy amplitude multiplier & injector rate (+1.5 modifier)."
echo "    - soliton_shift   : Introduces dynamic phase-shifting oscillation across frames."
echo "    - clip_03         : Dynamically clips and maps Z-surface alpha range directly across 0 to 3."
echo "    - negative_mass   : Operator-theory logarithmic field inversion (-log(|Z|)*sign(Z))."
echo "    - ir_thermal      : Switches colormap to deep thermal-infrared band (inferno)."
echo "    - uv_spectrum     : Shifts colormap into ultraviolet fluorescence profile (cool)."
read -p "Enter prompt configuration [default: soliton_core,soliton_shift,clip_03]: " PROMPT_INPUT
PROMPT_INPUT=${PROMPT_INPUT:-soliton_core,soliton_shift,clip_03}

read -p "Enter full parametric seed float / rotational weight [numeric float, default 1.1975807343]: " FULL_SEED
FULL_SEED=${FULL_SEED:-1.1975807343}

read -p "Enter spatial harmonic vector scale as x,y,z [comma-separated, default 1.0,1.0,1.0]: " HARMONIC_VEC
HARMONIC_VEC=${HARMONIC_VEC:-1.0,1.0,1.0}

# 4. FIELD SCALE & METRICS
read -p "Enter custom free-parameter multiplier for spatial grid [numeric, default 1.1975807343385265188]: " FIELD_SCALE_MULT
FIELD_SCALE_MULT=${FIELD_SCALE_MULT:-1.1975807343385265188}

export SPATIAL_BASE_VAL="1.0"
export SPATIAL_LABEL="cm"
export TARGET_HEURISTIC="hybrid_core"
export AUDIO_PROFILE="photon_chime"
export FIELD_SCALE_MULT
export FPS
export FULL_SEED
export PROMPT_INPUT
export HARMONIC_VEC

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
export OUTPUT_FILE="$SCRIPT_DIR/tensor_master_render_$TIMESTAMP.mkv"
export AUDIO_FILE="$SCRIPT_DIR/tensor_master_audio_$TIMESTAMP.wav"

echo -e "\n${CYAN}[+] Master Parameters Locked:${NC}"
echo -e "    - Time Offset      : ${TIME_OFFSET} units"
echo -e "    - XYZ Offsets      : X=${OFFSET_X}, Y=${OFFSET_Y}, Z=${OFFSET_Z}"
echo -e "    - Output Target    : $OUTPUT_FILE\n"

# ==============================================================================
# 5. PYTHON MASTER ENGINE WRITER
# ==============================================================================
cat << 'EOF' > /tmp/tensor_master_engine.py
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
    print("\n[Python] Interrupted cleanly by user. Saving state...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

try:
    print("[Python] Initializing Master 3D Volumetric Meshgrid & Tensor Reality Engine...")
    c_base = 134964356.0
    spatial_base = float(os.environ.get("SPATIAL_BASE_VAL", "1.0"))
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    spatial_label = os.environ.get("SPATIAL_LABEL", "cm")
    
    c = c_base * field_mult
    fps = int(os.environ.get("FPS", "30"))
    total_frames = int(os.environ.get("TOTAL_FRAMES", "900"))
    duration_sec = float(os.environ.get("CALC_DURATION_SEC", "1.0"))
    playback_sec = float(os.environ.get("VIDEO_STRETCH_SEC", "30.0"))
    time_offset = float(os.environ.get("TIME_OFFSET", "0.0"))
    
    offset_x = float(os.environ.get("OFFSET_X", "0.0"))
    offset_y = float(os.environ.get("OFFSET_Y", "0.0"))
    offset_z = float(os.environ.get("OFFSET_Z", "0.0"))

    full_seed = float(os.environ.get("FULL_SEED", "1.25"))
    prompt_input = os.environ.get("PROMPT_INPUT", "soliton_core")
    prompts = [p.strip().lower() for p in prompt_input.split(',')]
    
    raw_hvec = os.environ.get("HARMONIC_VEC", "1.0,1.0,1.0").split(',')
    h_vec = [float(v.strip()) for v in raw_hvec if v.strip()]
    hx = h_vec[0] if len(h_vec) > 0 else 1.0
    hy = h_vec[1] if len(h_vec) > 1 else 1.0
    hz = h_vec[2] if len(h_vec) > 2 else 1.0

    plt.style.use('dark_background')
    fig = plt.figure(figsize=(10, 6), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor('#090d16')

    grid_span = (c * 1e-8) * spatial_base
    
    # Meshgrid with explicit XYZ offset initialization
    x = np.linspace(-grid_span, grid_span, 40) + offset_x
    y = np.linspace(-grid_span, grid_span, 40) + offset_y
    X, Y = np.meshgrid(x, y)

    output_file = os.environ.get("OUTPUT_FILE", "tensor_master_render.mkv")
    audio_file_path = os.environ.get("AUDIO_FILE", "tensor_master_audio.wav")

    fig.canvas.draw()
    w, h = int(fig.get_figwidth() * fig.dpi), int(fig.get_figheight() * fig.dpi)
    w = w if w % 2 == 0 else w + 1
    h = h if h % 2 == 0 else h + 1

    def get_available_encoder():
        try:
            res = subprocess.run(['ffmpeg', '-encoders'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            if 'libx264' in res.stdout: return 'libx264'
            elif 'libsvtav1' in res.stdout: return 'libsvtav1'
        except Exception:
            pass
        return 'mpeg4'

    chosen_encoder = get_available_encoder()
    print(f"[Python] Selected FFmpeg video encoder: {chosen_encoder}")

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

    sample_rate = 44100
    total_audio_frames = int(sample_rate * playback_sec)
    tensor_audio_samples = []

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = (progress * duration_sec) + time_offset
        rot_angle = t * c * 1e-7 * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        P_sample = np.sin((X_rot * c) / (hx * full_seed))
        tensor_audio_samples.append(np.mean(P_sample))

    t_audio = np.linspace(0, playback_sec, total_audio_frames)
    interp_wave = np.interp(np.linspace(0, len(tensor_audio_samples) - 1, total_audio_frames), np.arange(len(tensor_audio_samples)), tensor_audio_samples)
    audio_signal = interp_wave * np.sin(2 * np.pi * 220.0 * t_audio)
    audio_signal = audio_signal / (np.max(np.abs(audio_signal)) + 1e-9)
    audio_pcm = np.int16(audio_signal * 32767)

    with wave.open(audio_file_path, 'w') as wf:
        wf.setnchannels(1)
        wf.setsampwidth(2)
        wf.setframerate(sample_rate)
        wf.writeframes(audio_pcm.tobytes())

    p_ffmpeg = subprocess.Popen(ffmpeg_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    log_interval = max(1, total_frames // 10)

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = (progress * duration_sec) + time_offset

        prompt_modifier = 0.0
        use_negative_mass = False
        use_clip_03 = False
        beta = 0.0
        active_cmap = 'viridis'

        for p in prompts:
            if "boost" in p: prompt_modifier += 1.5
            elif "shift" in p: beta += np.sin(progress * np.pi)
            elif "negative_mass" in p: use_negative_mass = True
            elif "clip_03" in p: use_clip_03 = True
            elif "ir" in p or "thermal" in p: active_cmap = 'inferno'
            elif "uv" in p: active_cmap = 'cool'

        rot_angle = t * c * 1e-7 * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        Y_rot = X * np.sin(rot_angle) + Y * np.cos(rot_angle)
        Z_slice = np.zeros_like(X_rot)

        dims = [(X_rot, 0.0, hx, 0), (Y_rot, 0.0, hy, 0)]
        P_sum = np.zeros_like(X_rot)
        for idx_i, (val_i, off_i, h_i, _) in enumerate(dims):
            for idx_j, (val_j, off_j, h_j, _) in enumerate(dims):
                if idx_i != idx_j:
                    P_sum += np.sin(((val_i - off_i) * c) / (h_i * (full_seed + prompt_modifier))) * np.cos(((val_j - off_j) * c) / h_j - beta)

        E_sum = np.ones_like(X_rot)
        for idx_i, (val_i, off_i, _, _) in enumerate(dims):
            for idx_j, (val_j, off_j, _, _) in enumerate(dims):
                if idx_i != idx_j:
                    E_sum += hz * full_seed * np.exp(-(((val_i - off_i)**2 + (val_j - off_j)**2) / (2 * (grid_span**2))))

        linear_phase_sum = (X_rot * hz + Y_rot * hx + Z_slice * hy) - c * t * full_seed + beta
        D = np.imag(np.exp(1j * (linear_phase_sum)))
        Z = P_sum * E_sum + D

        if use_negative_mass:
            Z = -np.log(np.abs(Z) + 1e-5) * np.sign(Z)

        Z = np.nan_to_num(Z, nan=0.0, posinf=1.0, neginf=-1.0)
        z_min, z_max = Z.min(), Z.max()
        Z_norm = np.zeros_like(Z) if np.isclose(z_min, z_max) else (Z - z_min) / (z_max - z_min + 1e-9)

        lum_adj = 1.0 + 0.2 * np.sin(progress * np.pi * 2)
        Z_adjusted = np.clip(Z_norm * lum_adj, 0.0, 1.0) + offset_z

        if use_clip_03:
            alpha_map = np.clip(Z_adjusted * 3.0, 0.0, 1.0)
            cmap_obj = plt.get_cmap(active_cmap)
            rgba_face = cmap_obj(Z_adjusted)
            rgba_face[..., 3] = alpha_map
        else:
            rgba_face = active_cmap

        ax.clear()
        ax.set_facecolor('#090d16')
        ax.plot_surface(X_rot, Y_rot, Z_adjusted, facecolors=rgba_face if use_clip_03 else None, cmap=None if use_clip_03 else active_cmap, linewidth=0.1, antialiased=True, alpha=0.9)

        ax.set_title(f"MASTER | Time Offset T={t*1e6:.2f}µs | XYZ=({offset_x},{offset_y},{offset_z})", color='#00ffcc', fontsize=9, fontweight='bold')
        ax.set_xlabel(f"Spatial X ({spatial_label})", color='white')
        ax.set_ylabel(f"Spatial Y ({spatial_label})", color='white')
        ax.set_zlabel(f"Spatial Z ({spatial_label})", color='white')
        ax.view_init(elev=35.0 + i * 0.2, azim=55.0 + (i * 0.8))

        fig.set_size_inches(10, 6)
        plt.tight_layout()
        fig.canvas.draw()

        p_ffmpeg.stdin.write(bytes(fig.canvas.buffer_rgba()))
        p_ffmpeg.stdin.flush()

        if i % log_interval == 0 or i == total_frames - 1:
            print(f"[Python] Rendered master frame {i+1}/{total_frames} ({(i+1)/total_frames*100:.1f}%)")

    plt.close(fig)
    p_ffmpeg.communicate()

    if os.path.exists(audio_file_path):
        os.remove(audio_file_path)
    print("[Python] Master Pipeline Render Completed Successfully.")

except Exception as e:
    print(f"[Python Error]: {e}")
    traceback.print_exc()
    sys.exit(1)
EOF

python3 /tmp/tensor_master_engine.py
rm -f /tmp/tensor_master_engine.py

echo -e "\n${CYAN}==============================================================================${NC}"
echo -e "${GREEN}       MASTER FEDORA PIPELINE RENDER FINISHED SUCCESSFULLY               ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Saved file: ${BLUE}$OUTPUT_FILE${NC}"
