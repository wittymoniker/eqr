#!/bin/bash
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - MASTER VOLUMETRIC EDITION (FEDORA)
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Features: True 3D Volumetric Rendering Schemes (Voxels, Isosurfaces, Scatter),
#           Metric Scales, Audio Profiles, Camera/Zoom Constraints, XYZ & Time Offsets
# ==============================================================================

set -uo pipefail

GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}==============================================================================${NC}"
echo -e "${GREEN}    TENSOR REALITY ENGINE - FEDORA VOLUMETRIC MASTER EDITION             ${NC}"
echo -e "${CYAN}==============================================================================${NC}"

# 1. TIMESCALE & TIME OFFSET CONFIGURATION
echo -e "\n${YELLOW}[1/7] Select Base Time Scale Unit:${NC}"
echo "  [1] Gigasecond  (1 Gs  = 10^9 s)"
echo "  [2] Megasecond  (1 Ms  = 10^6 s)"
echo "  [3] Second      (1 s   = 1.0 s)"
echo "  [4] Millisecond (1 ms  = 10^-3 s)"
echo "  [5] Microsecond (1 µs  = 10^-6 s) [DEFAULT]"
echo "  [6] Nanosecond  (1 ns  = 10^-9 s)"
echo "  [7] Picosecond  (1 ps  = 10^-12 s)"
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

# 2. METRIC SPATIAL DOMAIN SCALE & XYZ OFFSET CONFIGURATION
# 2. METRIC SPATIAL DOMAIN SCALE & XYZ OFFSET CONFIGURATION
echo -e "\n${YELLOW}[2/7] Centimeter-Based Spatial Dimension Scale & Volumetric Offsets:${NC}"
echo "Select Base Spatial Dimension Scale Unit (Metric relative to cm):"
echo "  [1] Gigameter   (Gm  = 10^11 cm)"
echo "  [2] Megameter   (Mm  = 10^8 cm)"
echo "  [3] Kilometer   (km  = 10^5 cm)"
echo "  [4] Centimeter  (cm  = 10^0 cm) [DEFAULT]"
echo "  [5] Micrometer  (碌m  = 10^-4 cm)"
echo "  [6] Nanometer   (nm  = 10^-7 cm)"
echo "  [7] Picometer   (pm  = 10^-10 cm)"
read -p "Select spatial domain scale option [1-7, default 4]: " SPATIAL_CHOICE
SPATIAL_CHOICE=${SPATIAL_CHOICE:-4}

case "$SPATIAL_CHOICE" in
    1) SPATIAL_BASE_VAL="1e11"; SPATIAL_LABEL="Gm" ;;
    2) SPATIAL_BASE_VAL="1e8"; SPATIAL_LABEL="Mm" ;;
    3) SPATIAL_BASE_VAL="1e5"; SPATIAL_LABEL="km" ;;
    4) SPATIAL_BASE_VAL="1.0"; SPATIAL_LABEL="cm" ;;
    5) SPATIAL_BASE_VAL="1e-4"; SPATIAL_LABEL="碌m" ;;
    6) SPATIAL_BASE_VAL="1e-7"; SPATIAL_LABEL="nm" ;;
    7) SPATIAL_BASE_VAL="1e-10"; SPATIAL_LABEL="pm" ;;
    *) SPATIAL_BASE_VAL="1.0"; SPATIAL_LABEL="cm" ;;
esac

# Added prompt for the exact field number of meters for graph scaling/index
read -p "Enter exact field scale factor in meters [numeric, default 1.0]: " EXACT_METERS_SCALE
EXACT_METERS_SCALE=${EXACT_METERS_SCALE:-1.0}

read -p "Enter spatial X volumetric offset shift [numeric, default 0.0]: " OFFSET_X
OFFSET_X=${OFFSET_X:-0.0}
read -p "Enter spatial Y volumetric offset shift [numeric, default 0.0]: " OFFSET_Y
OFFSET_Y=${OFFSET_Y:-0.0}
read -p "Enter spatial Z vertical volumetric offset [numeric, default 0.0]: " OFFSET_Z
OFFSET_Z=${OFFSET_Z:-0.0}

export SPATIAL_BASE_VAL
export SPATIAL_LABEL
export EXACT_METERS_SCALE
export OFFSET_X
export OFFSET_Y
export OFFSET_Z

# 3. 3D VOLUMETRIC SCHEME & RENDERING OPTIMIZATION PROMPT
echo -e "\n${YELLOW}[3/7] 3D Volumetric Scheme & Optimization Techniques:${NC}"
echo "Select True 3D Volumetric Rendering Scheme to Avoid Flat Distortion Planes:"
echo "  [1] voxel_grid   (Discretized 3D cubic blocks / structural voxel matrices)"
echo "  [2] isosurface   (Multi-layered 3D contour meshes / volumetric shell nesting) [DEFAULT]"
echo "  [3] scatter_3d   (High-density point-cloud particle energy distribution field)"
read -p "Select volumetric scheme option [1-3, default 2]: " VOL_SCHEME_CHOICE
VOL_SCHEME_CHOICE=${VOL_SCHEME_CHOICE:-2}

case "$VOL_SCHEME_CHOICE" in
    1) VOL_SCHEME="voxel_grid" ;;
    2) VOL_SCHEME="isosurface" ;;
    3) VOL_SCHEME="scatter_3d" ;;
    *) VOL_SCHEME="isosurface" ;;
esac

read -p "Enter volumetric grid resolution density [integer 15-50, default 25]: " VOL_RES
VOL_RES=${VOL_RES:-25}

read -p "Enter volumetric threshold cut-off or density filter [float 0.0-1.0, default 0.3]: " VOL_THRESHOLD
VOL_THRESHOLD=${VOL_THRESHOLD:-0.3}

export VOL_SCHEME
export VOL_RES
export VOL_THRESHOLD

# 4. HEURISTICS & ACOUSTIC AUDIO PROFILES
echo -e "\n${YELLOW}[4/7] Target Labeling Heuristic Profiles:${NC}"
echo "  [1] mattervision (Density/Mass distribution field matrix overlays)"
echo "  [2] photovision  (Photon flux luminance and wavelength-band colorization)"
echo "  [3] hybrid_core  (Dual simultaneous mattervision & photovision tensor fusion) [DEFAULT]"
echo "  [4] synesthesia  (Cross-modal sensory engine: light is heard, sound is seen)"
read -p "Select heuristic option [1-4, default 3]: " HEURISTIC_CHOICE
HEURISTIC_CHOICE=${HEURISTIC_CHOICE:-3}

case "$HEURISTIC_CHOICE" in
    1) TARGET_HEURISTIC="mattervision" ;;
    2) TARGET_HEURISTIC="photovision" ;;
    3) TARGET_HEURISTIC="hybrid_core" ;;
    4) TARGET_HEURISTIC="synesthesia" ;;
    *) TARGET_HEURISTIC="hybrid_core" ;;
esac

echo -e "\n${YELLOW}[4.1] Acoustic Audio Sonification Profile (Ears Option):${NC}"
echo "  [1] harmonic_drone  (Resonant multi-harmonic carrier chord synthesized from tensor mean slices)"
echo "  [2] standing_wave   (Phase-coupled frequency sweeps mimicking acoustic cavity resonance)"
echo "  [3] photon_chime    (High-frequency transient scintillation pulses mapped from optical flux) [DEFAULT]"
echo "  [4] synesthesia_fx  (Cross-modal audio: direct optical spectrum wavelength-to-frequency translation)"
read -p "Select audio sonification profile [1-4, default 3]: " AUDIO_CHOICE
AUDIO_CHOICE=${AUDIO_CHOICE:-3}

case "$AUDIO_CHOICE" in
    1) AUDIO_PROFILE="harmonic_drone" ;;
    2) AUDIO_PROFILE="standing_wave" ;;
    3) AUDIO_PROFILE="photon_chime" ;;
    4) AUDIO_PROFILE="synesthesia_fx" ;;
    *) AUDIO_PROFILE="photon_chime" ;;
esac

export TARGET_HEURISTIC
export AUDIO_PROFILE

# 5. PROCEDURAL EFFECTS, CAMERA CONSTRAINTS & PROMPT CONFIGURATION
echo -e "\n${YELLOW}[5/7] Procedural Effects & Camera Constraints Configuration:${NC}"
read -p "Enter prompt configuration [default: soliton_core,soliton_shift,clip_03]: " PROMPT_INPUT
PROMPT_INPUT=${PROMPT_INPUT:-soliton_core,soliton_shift,clip_03}

read -p "Enter full parametric seed float / rotational weight [numeric float, default 1.1975807343]: " FULL_SEED
FULL_SEED=${FULL_SEED:-1.1975807343}

read -p "Enter spatial harmonic vector scale as x,y,z [comma-separated, default 1.0,1.0,1.0]: " HARMONIC_VEC
HARMONIC_VEC=${HARMONIC_VEC:-1.0,1.0,1.0}

read -p "Enter custom free-parameter multiplier for spatial grid [numeric, default 1.1975807343385265188]: " FIELD_SCALE_MULT
FIELD_SCALE_MULT=${FIELD_SCALE_MULT:-1.1975807343385265188}

read -p "Enter initial camera distance / zoom radius [numeric, default 2.0]: " CAM_DIST
CAM_DIST=${CAM_DIST:-2.0}
read -p "Enter initial Pitch angle in degrees [numeric, default 35]: " CAM_PITCH
CAM_PITCH=${CAM_PITCH:-35}
read -p "Enter initial Yaw angle in degrees [numeric, default 55]: " CAM_YAW
CAM_YAW=${CAM_YAW:-55}

export FIELD_SCALE_MULT
export FPS
export FULL_SEED
export PROMPT_INPUT
export HARMONIC_VEC
export CAM_DIST
export CAM_PITCH
export CAM_YAW

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
export OUTPUT_FILE="$SCRIPT_DIR/tensor_volumetric_render_$TIMESTAMP.mkv"
export AUDIO_FILE="$SCRIPT_DIR/tensor_volumetric_audio_$TIMESTAMP.wav"

echo -e "\n${CYAN}[+] Volumetric Master Parameters Locked:${NC}"
echo -e "    - Metric Scale     : ${SPATIAL_LABEL}"
echo -e "    - Volumetric Scheme: ${VOL_SCHEME} (Res: ${VOL_RES}, Threshold: ${VOL_THRESHOLD})"
echo -e "    - Time Offset      : ${TIME_OFFSET} units"
echo -e "    - XYZ Offsets      : X=${OFFSET_X}, Y=${OFFSET_Y}, Z=${OFFSET_Z}"
echo -e "    - Output Target    : $OUTPUT_FILE\n"

# ==============================================================================
# 6. PYTHON VOLUMETRIC 3D ENGINE WRITER
# ==============================================================================
cat << 'EOF' > /tmp/tensor_volumetric_engine.py
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
    print("[Python] Initializing True 3D Volumetric Tensor Reality Engine...")
    c_base = 134964356.0
    spatial_base = float(os.environ.get("SPATIAL_BASE_VAL", "1.0"))
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    spatial_label = os.environ.get("SPATIAL_LABEL", "cm")
    heuristic = os.environ.get("TARGET_HEURISTIC", "hybrid_core")
    audio_profile = os.environ.get("AUDIO_PROFILE", "photon_chime")
    
    vol_scheme = os.environ.get("VOL_SCHEME", "isosurface")
    vol_res = int(os.environ.get("VOL_RES", "25"))
    vol_threshold = float(os.environ.get("VOL_THRESHOLD", "0.3"))

    c = c_base * field_mult
    fps = int(os.environ.get("FPS", "30"))
    total_frames = int(os.environ.get("TOTAL_FRAMES", "900"))
    duration_sec = float(os.environ.get("CALC_DURATION_SEC", "1.0"))
    playback_sec = float(os.environ.get("VIDEO_STRETCH_SEC", "30.0"))
    time_offset = float(os.environ.get("TIME_OFFSET", "0.0"))
    
    offset_x = float(os.environ.get("OFFSET_X", "0.0"))
    offset_y = float(os.environ.get("OFFSET_Y", "0.0"))
    offset_z = float(os.environ.get("OFFSET_Z", "0.0"))

    spatial_base = float(os.environ.get("SPATIAL_BASE_VAL", "1.0"))
    exact_meters = float(os.environ.get("EXACT_METERS_SCALE", "1.0"))
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    
    # Incorporate exact field meters into the overall grid span calculation
    grid_span = ((c * 1e-8) * spatial_base) * exact_meters

    full_seed = float(os.environ.get("FULL_SEED", "1.25"))
    cam_dist = float(os.environ.get("CAM_DIST", "2.0"))
    pitch_init = float(os.environ.get("CAM_PITCH", "35"))
    yaw_init = float(os.environ.get("CAM_YAW", "55"))

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
    
    # Full 3D Volumetric Meshgrid (X, Y, Z space coordinates)
    x = np.linspace(-grid_span, grid_span, vol_res) + offset_x
    y = np.linspace(-grid_span, grid_span, vol_res) + offset_y
    z = np.linspace(-grid_span, grid_span, vol_res) + offset_z
    X, Y, Z_grid = np.meshgrid(x, y, z, indexing='ij')

    output_file = os.environ.get("OUTPUT_FILE", "tensor_volumetric_render.mkv")
    audio_file_path = os.environ.get("AUDIO_FILE", "tensor_volumetric_audio.wav")

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
        tensor_audio_samples.append(np.mean(np.sin((X_rot * c) / (hx * full_seed))))

    t_audio = np.linspace(0, playback_sec, total_audio_frames)
    interp_wave = np.interp(np.linspace(0, len(tensor_audio_samples) - 1, total_audio_frames), np.arange(len(tensor_audio_samples)), tensor_audio_samples)

    if audio_profile == "harmonic_drone":
        audio_signal = interp_wave * np.sin(2 * np.pi * 110.0 * t_audio) + 0.5 * np.sin(2 * np.pi * 330.0 * t_audio)
    elif audio_profile == "standing_wave":
        audio_signal = np.sin(2 * np.pi * 150.0 * t_audio + interp_wave * np.pi) * np.cos(2 * np.pi * 2.0 * t_audio)
    elif audio_profile == "photon_chime":
        audio_signal = interp_wave * np.sin(2 * np.pi * 587.33 * t_audio)
    elif audio_profile == "synesthesia_fx":
        audio_signal = interp_wave * np.sin(2 * np.pi * 440.0 * t_audio) * np.sin(2 * np.pi * 55.0 * t_audio)
    else:
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
        beta = 0.0
        active_cmap = 'viridis'

        if heuristic == "mattervision": active_cmap = 'plasma'
        elif heuristic == "photovision": active_cmap = 'turbo'
        elif heuristic == "synesthesia": active_cmap = 'coolwarm'

        for p in prompts:
            if "boost" in p: prompt_modifier += 1.5
            elif "shift" in p: beta += np.sin(progress * np.pi)
            elif "negative_mass" in p: use_negative_mass = True
            elif "ir" in p or "thermal" in p: active_cmap = 'inferno'
            elif "uv" in p: active_cmap = 'cool'

        rot_angle = t * c * 1e-7 * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        Y_rot = X * np.sin(rot_angle) + Y * np.cos(rot_angle)
        
        # True 3D Volumetric Tensor Evaluation across X, Y, Z_grid
        P_vol = np.sin((X_rot * c) / (hx * (full_seed + prompt_modifier))) * np.cos((Y_rot * c) / (hy * full_seed) - beta)
        E_vol = 1.0 + hz * full_seed * np.exp(-((X_rot**2 + Y_rot**2 + Z_grid**2) / (2 * (grid_span**2))))
        V_field = P_vol * E_vol + np.sin(Z_grid * hx * 0.1 - c * t * 1e-7)

        if use_negative_mass:
            V_field = -np.log(np.abs(V_field) + 1e-5) * np.sign(V_field)

        V_field = np.nan_to_num(V_field, nan=0.0, posinf=1.0, neginf=-1.0)
        v_min, v_max = V_field.min(), V_field.max()
        V_norm = np.zeros_like(V_field) if np.isclose(v_min, v_max) else (V_field - v_min) / (v_max - v_min + 1e-9)

        ax.clear()
        ax.set_facecolor('#090d16')

        # True 3D Volumetric Rendering Schemes Implementation
        if vol_scheme == "voxel_grid":
            # Scheme 1: Discretized 3D cubic voxel blocks
            voxels = np.abs(V_norm) > (1.0 - vol_threshold)
            colors = plt.get_cmap(active_cmap)(V_norm)
            ax.voxels(voxels, facecolors=colors, edgecolor='k', linewidth=0.05, alpha=0.7)
        elif vol_scheme == "scatter_3d":
            # Scheme 2: High-density 3D energy point-cloud scatter distribution
            mask = np.abs(V_norm) > vol_threshold
            ax.scatter(X_rot[mask], Y_rot[mask], Z_grid[mask], c=V_norm[mask], cmap=active_cmap, s=5, alpha=0.6, edgecolors='none')
        else:
            # Scheme 3 (Default): Multi-layered Isosurface Volumetric Nesting
            # Slices through Z-depth to form true nested 3D volumetric shells instead of a flat plane
            cmap_obj = plt.get_cmap(active_cmap)
            for z_idx in range(0, Z_grid.shape[2], max(1, Z_grid.shape[2] // 6)):
                xi = X_rot[:, :, z_idx]
                yi = Y_rot[:, :, z_idx]
                zi = Z_grid[:, :, z_idx]
                fi = V_norm[:, :, z_idx]
                ax.plot_surface(xi, yi, zi, facecolors=cmap_obj(fi), linewidth=0.0, antialiased=True, alpha=0.5)

        ax.set_title(f"3D VOLUMETRIC [{vol_scheme.upper}] | Scale: {spatial_label} | T={t*1e6:.2f}µs", color='#00ffcc', fontsize=9, fontweight='bold')
        ax.set_xlabel(f"Spatial X ({spatial_label})", color='white')
        ax.set_ylabel(f"Spatial Y ({spatial_label})", color='white')
        ax.set_zlabel(f"Spatial Z ({spatial_label})", color='white')
        
        ax.dist = cam_dist * 10.0
        ax.view_init(elev=pitch_init + i * 0.2, azim=yaw_init + (i * 0.8))

        fig.set_size_inches(10, 6)
        plt.tight_layout()
        fig.canvas.draw()

        p_ffmpeg.stdin.write(bytes(fig.canvas.buffer_rgba()))
        p_ffmpeg.stdin.flush()

        if i % log_interval == 0 or i == total_frames - 1:
            print(f"[Python] Rendered volumetric frame {i+1}/{total_frames} ({(i+1)/total_frames*100:.1f}%)")

    plt.close(fig)
    p_ffmpeg.communicate()

    if os.path.exists(audio_file_path):
        os.remove(audio_file_path)
    print("[Python] Volumetric Master Pipeline Render Completed Successfully.")

except Exception as e:
    print(f"[Python Error]: {e}")
    traceback.print_exc()
    sys.exit(1)
EOF

python3 /tmp/tensor_volumetric_engine.py
rm -f /tmp/tensor_volumetric_engine.py

echo -e "\n${CYAN}==============================================================================${NC}"
echo -e "${GREEN}       FEDORA VOLUMETRIC PIPELINE RENDER FINISHED SUCCESSFULLY           ${NC}"
echo -e "${CYAN}==============================================================================${NC}"
echo -e "Saved file: ${BLUE}$OUTPUT_FILE${NC}"
