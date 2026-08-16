#!/usr/bin/env python3
# ==============================================================================
# ADVANCED TENSOR REALITY ENGINE - WINMAC VOLUMETRIC EDITION
# Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
# Features: True 3D Volumetric Rendering Schemes (Voxel Matrices, Isosurfaces, Scatter),
#           Metric Scales, Exact Field Meters Scaling Index, Audio Profiles, XYZ & Time Offsets
# ==============================================================================

import os
import sys
import traceback
import wave
import subprocess
import signal
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def signal_handler(sig, frame):
    print("\n[Python] Interrupted cleanly by user. Saving state...")
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

def run_winmac_engine():
    print("==============================================================================")
    print("    TENSOR REALITY ENGINE - WINMAC TRUE 3D VOLUMETRIC EDITION                 ")
    print("==============================================================================")

    # 1. Interactive or Environment-Based Configuration Parameters
    high_precision = os.environ.get("HIGH_PRECISION", "n").lower() == 'y'
    dtype = np.float64 if high_precision else np.float32

    print("[1/7] Initializing Timescale & Time Parameters (Base T = I = 1s enforced)...")
    user_units = float(os.environ.get("USER_UNITS", "420"))
    scale_val = float(os.environ.get("SCALE_VAL", "1.0")) # Default 1s
    time_offset = float(os.environ.get("TIME_OFFSET", "0.0"))
    video_stretch_sec = float(os.environ.get("VIDEO_STRETCH_SEC", "30.0"))

    calc_duration_sec = user_units * scale_val
    fps = int(os.environ.get("FPS", "30"))
    total_frames = int(os.environ.get("TOTAL_FRAMES", max(30, round(video_stretch_sec * fps))))

    # 2. Spatial Dimension Scale & Offsets
    print("[2/7] Loading Spatial Domain Scale & Volumetric Offsets...")
    spatial_base = float(os.environ.get("SPATIAL_BASE_VAL", "1.0")) # cm default
    exact_meters = float(os.environ.get("EXACT_METERS_SCALE", "1.0"))
    spatial_label = os.environ.get("SPATIAL_LABEL", "cm")
    
    offset_x = float(os.environ.get("OFFSET_X", "0.0"))
    offset_y = float(os.environ.get("OFFSET_Y", "0.0"))
    offset_z = float(os.environ.get("OFFSET_Z", "0.0"))

    # 3. Volumetric Rendering Schemes
    print("[3/7] Setting Up True 3D Volumetric Scheme...")
    vol_scheme = os.environ.get("VOL_SCHEME", "full_voxel_matrix") # full_voxel_matrix, scatter_tensor, shell_isosurface
    vol_res = int(os.environ.get("VOL_RES", "25"))
    vol_threshold = float(os.environ.get("VOL_THRESHOLD", "0.35"))

    # 4. Heuristics & Audio Profile
    print("[4/7] Configuring Heuristics & Acoustic Sonification...")
    heuristic = os.environ.get("TARGET_HEURISTIC", "hybrid_core")
    audio_profile = os.environ.get("AUDIO_PROFILE", "photon_chime")
    active_cmap = os.environ.get("VISUAL_CMAP", "linear")
    distortion_amp = float(os.environ.get("DISTORTION_AMP", "1.0"))
    safety_clamp = float(os.environ.get("SAFETY_CLAMP", "1000.0"))

    # 5. Procedural Effects & Field Constants
    print("[5/7] Parsing Procedural Prompt Modifiers & Field Scale Multipliers...")
    field_mult = float(os.environ.get("FIELD_SCALE_MULT", "1.1975807343"))
    full_seed = float(os.environ.get("FULL_SEED", "1.25"))
    cam_dist = float(os.environ.get("CAM_DIST", "2.0"))
    pitch_init = float(os.environ.get("CAM_PITCH", "35"))
    yaw_init = float(os.environ.get("CAM_YAW", "55"))

    prompt_input = os.environ.get("PROMPT_INPUT", "soliton_core,soliton_shift,clip_03")
    prompts = [p.strip().lower() for p in prompt_input.split(',')]

    raw_hvec = os.environ.get("HARMONIC_VEC", "1.0,1.0,1.0").split(',')
    h_vec = [float(v.strip()) for v in raw_hvec if v.strip()]
    hx = h_vec[0] if len(h_vec) > 0 else 1.0
    hy = h_vec[1] if len(h_vec) > 1 else 1.0
    hz = h_vec[2] if len(h_vec) > 2 else 1.0

    c = 1.0 * field_mult

    # Setup matplotlib figure
    plt.style.use('dark_background')
    fig = plt.figure(figsize=(10, 6), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor('#090d16')

    grid_span = ((c * 1.0) * spatial_base) * exact_meters

    x = np.linspace(-grid_span, grid_span, vol_res, dtype=dtype) + offset_x
    y = np.linspace(-grid_span, grid_span, vol_res, dtype=dtype) + offset_y
    z = np.linspace(-grid_span, grid_span, vol_res, dtype=dtype) + offset_z
    X, Y, Z_grid = np.meshgrid(x, y, z, indexing='ij')

    output_file = os.environ.get("OUTPUT_FILE", "tensor_winmac_render.mkv")
    audio_file_path = os.environ.get("AUDIO_FILE", "tensor_winmac_audio.wav")

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

    # Sonification Pass
    print("[6/7] Synthesizing Cross-Modal Acoustic Audio Track...")
    sample_rate = 44100
    total_audio_frames = int(sample_rate * video_stretch_sec)
    tensor_audio_samples = []

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = (progress * calc_duration_sec) + time_offset
        rot_angle = t * c * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        tensor_audio_samples.append(np.mean(np.sin((X_rot * c) / (hx * full_seed))))

    t_audio = np.linspace(0, video_stretch_sec, total_audio_frames, dtype=dtype)
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

    # Rendering Pass
    print(f"[7/7] Commencing True 3D Volumetric Stream Generation ({total_frames} frames)...")
    p_ffmpeg = subprocess.Popen(ffmpeg_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    log_interval = max(1, total_frames // 10)

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = (progress * calc_duration_sec) + time_offset

        prompt_modifier = 0.0
        use_negative_mass = False
        beta = 0.0

        if heuristic == "mattervision": active_cmap = 'plasma'
        elif heuristic == "photovision": active_cmap = 'turbo'
        elif heuristic == "synesthesia": active_cmap = 'coolwarm'

        for p in prompts:
            if "boost" in p: prompt_modifier += 1.5
            elif "shift" in p: beta += np.sin(progress * np.pi)
            elif "negative_mass" in p: use_negative_mass = True
            elif "ir" in p or "thermal" in p: active_cmap = 'inferno'
            elif "uv" in p: active_cmap = 'cool'

        rot_angle = t * c * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        Y_rot = X * np.sin(rot_angle) + Y * np.cos(rot_angle)

        P_vol = np.sin((X_rot * c) / (hx * (full_seed + prompt_modifier))) * np.cos((Y_rot * c) / (hy * full_seed) - beta)

        X_sq = np.clip(X_rot**2, -1e18, 1e18)
        Y_sq = np.clip(Y_rot**2, -1e18, 1e18)
        Z_sq = np.clip(Z_grid**2, -1e18, 1e18)

        E_vol = 1.0 + hz * full_seed * np.exp(-((X_sq + Y_sq + Z_sq) / (2.0 * (grid_span**2) + 1e-9)))
        V_field = (P_vol * E_vol + np.sin(Z_grid * hx * 0.1 - c * t)) * distortion_amp

        if use_negative_mass:
            V_field = -np.log(np.abs(V_field) + 1e-5) * np.sign(V_field)

        V_field = np.clip(V_field, -safety_clamp, safety_clamp)
        V_field = np.nan_to_num(V_field, nan=0.0, posinf=1.0, neginf=-1.0)
        v_min, v_max = V_field.min(), V_field.max()
        V_norm = np.zeros_like(V_field) if np.isclose(v_min, v_max) else (V_field - v_min) / (v_max - v_min + 1e-9)

        ax.clear()
        ax.set_facecolor('#090d16')

        if active_cmap == 'linear':
            cmap_to_use = plt.get_cmap('gray')
        else:
            cmap_to_use = plt.get_cmap(active_cmap)

        # True 3D Volumetric Scheme Handling (Zero 2D stacking artifacts)
        if vol_scheme == "full_voxel_matrix":
            voxels = np.abs(V_norm) >= vol_threshold
            colors = cmap_to_use(V_norm)
            ax.voxels(voxels, facecolors=colors, edgecolor='none', alpha=0.65)
        elif vol_scheme == "scatter_tensor":
            mask = np.abs(V_norm) >= vol_threshold
            ax.scatter(X_rot[mask], Y_rot[mask], Z_grid[mask], c=V_norm[mask], cmap=cmap_to_use, s=6, alpha=0.7, edgecolors='none')
        else:
            levels = np.linspace(vol_threshold, 1.0 - 0.05, 5)
            for lvl in levels:
                shell_mask = (np.abs(V_norm) >= lvl) & (np.abs(V_norm) < lvl + 0.15)
                if np.any(shell_mask):
                    ax.scatter(X_rot[shell_mask], Y_rot[shell_mask], Z_grid[shell_mask], c=V_norm[shell_mask], cmap=cmap_to_use, s=4, alpha=0.45, edgecolors='none')

        ax.set_title(f"WINMAC 3D TENSOR SCAN [{vol_scheme.upper}] | Scale: {spatial_label} ({exact_meters}m) | T=I={t:.2f}s", color='#00ffcc', fontsize=9, fontweight='bold')
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
            print(f"[Python] Rendered WinMac volumetric frame {i+1}/{total_frames} ({(i+1)/total_frames*100:.1f}%)")

    plt.close(fig)
    p_ffmpeg.communicate()

    if os.path.exists(audio_file_path):
        os.remove(audio_file_path)
    print(f"[Python] Render Complete! Saved file to: {output_file}")

if __name__ == '__main__':
    run_winmac_engine()
