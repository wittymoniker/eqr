<#
==============================================================================
 ADVANCED TENSOR REALITY ENGINE - MASTER VOLUMETRIC EDITION (WINMAC / POWERSHELL)
 Framework: Equation of Reality, P,E,D Subfunctions, Operator Theory, Meum (20d)
 Features: Cross-Platform Python Engine Wrapper, Interval Opacity Grading,
           Camera Trajectories, Tensor Differential Operators, Audio Synthesis
==============================================================================
#>

$Host.UI.RawUI.ForegroundColor = "Cyan"
Write-Host "=============================================================================="
Write-Host "    TENSOR REALITY ENGINE - WINMAC TRUE 3D VOLUMETRIC MASTER EDITION          " -ForegroundColor Green
Write-Host "=============================================================================="

# 1. TIMESCALE & TIME OFFSET CONFIGURATION
Write-Host "`n[1/8] Select Base Time Scale Unit:" -ForegroundColor Yellow
Write-Host "  [1] Gigasecond  (1 Gs  = 10^9 s)"
Write-Host "  [2] Megasecond  (1 Ms  = 10^6 s)"
Write-Host "  [3] Second      (1 s   = 1.0 s) [DEFAULT/FIXED BASE T=I=1]"
Write-Host "  [4] Millisecond (1 ms  = 10^-3 s)"
Write-Host "  [5] Microsecond (1 µs  = 10^-6 s)"
Write-Host "  [6] Nanosecond  (1 ns  = 10^-9 s)"
Write-Host "  [7] Picosecond  (1 ps  = 10^-12 s)"
$timeChoice = Read-Host "Select timescale unit option [1-7, default 3]"
if (-not $timeChoice) { $timeChoice = "3" }

switch ($timeChoice) {
    "1" { $scaleVal = "1e9"; $scaleLabel = "Gs" }
    "2" { $scaleVal = "1e6"; $scaleLabel = "Ms" }
    "3" { $scaleVal = "1.0"; $scaleLabel = "s" }
    "4" { $scaleVal = "1e-3"; $scaleLabel = "ms" }
    "5" { $scaleVal = "1e-6"; $scaleLabel = "µs" }
    "6" { $scaleVal = "1e-9"; $scaleLabel = "ns" }
    "7" { $scaleVal = "1e-12"; $scaleLabel = "ps" }
    default { $scaleVal = "1.0"; $scaleLabel = "s" }
}

$userUnits = Read-Host "Enter number of units to span [numeric, default 420]"
if (-not $userUnits) { $userUnits = "420" }

$timeOffset = Read-Host "Enter working time offset shift value [numeric offset, default 0.0]"
if (-not $timeOffset) { $timeOffset = "0.0" }

$videoStretch = Read-Host "Enter output video playback stretch duration in real seconds [numeric, default 30.0]"
if (-not $videoStretch) { $videoStretch = "30.0" }

$calcDuration = python -c "print(float('$userUnits') * float('$scaleVal'))"
$fps = 30
$totalFrames = python -c "print(int(max(30, round(float($videoStretch) * float($fps)))))"

# 2. METRIC SPATIAL DOMAIN SCALE & XYZ OFFSETS
Write-Host "`n[2/8] Centimeter-Based Spatial Dimension Scale & Volumetric Offsets:" -ForegroundColor Yellow
Write-Host "Select Base Spatial Dimension Scale Unit:"
Write-Host "  [1] Gigameter (Gm = 10^11 cm)"
Write-Host "  [2] Megameter (Mm = 10^8 cm)"
Write-Host "  [3] Kilometer (km = 10^5 cm)"
Write-Host "  [4] Centimeter (cm = 10^0 cm) [DEFAULT]"
Write-Host "  [5] Micrometer (µm = 10^-4 cm)"
Write-Host "  [6] Nanometer (nm = 10^-7 cm)"
Write-Host "  [7] Picometer (pm = 10^-10 cm)"
$spatialChoice = Read-Host "Select spatial domain scale option [1-7, default 4]"
if (-not $spatialChoice) { $spatialChoice = "4" }

switch ($spatialChoice) {
    "1" { $spatialBaseVal = "1e11"; $spatialLabel = "Gm" }
    "2" { $spatialBaseVal = "1e8"; $spatialLabel = "Mm" }
    "3" { $spatialBaseVal = "1e5"; $spatialLabel = "km" }
    "4" { $spatialBaseVal = "1.0"; $spatialLabel = "cm" }
    "5" { $spatialBaseVal = "1e-4"; $spatialLabel = "µs" }
    "6" { $spatialBaseVal = "1e-7"; $spatialLabel = "nm" }
    "7" { $spatialBaseVal = "1e-10"; $spatialLabel = "pm" }
    default { $spatialBaseVal = "1.0"; $spatialLabel = "cm" }
}

$exactMeters = Read-Host "Enter exact field number of meters for graph scaling and index [numeric, default 1.0]"
if (-not $exactMeters) { $exactMeters = "1.0" }

$offsetX = Read-Host "Enter spatial X volumetric offset shift [numeric, default 0.0]"
if (-not $offsetX) { $offsetX = "0.0" }
$offsetY = Read-Host "Enter spatial Y volumetric offset shift [numeric, default 0.0]"
if (-not $offsetY) { $offsetY = "0.0" }
$offsetZ = Read-Host "Enter spatial Z vertical volumetric offset [numeric, default 0.0]"
if (-not $offsetZ) { $offsetZ = "0.0" }

# 3. TENSOR SCHEME & OPACITY INTERVALS
Write-Host "`n[3/8] True 3D Volumetric Tensor Scan Scheme & Opacity Intervals:" -ForegroundColor Yellow
Write-Host "  [1] full_voxel_matrix [DEFAULT]"
Write-Host "  [2] scatter_tensor"
Write-Host "  [3] shell_isosurface"
$volChoice = Read-Host "Select volumetric scheme option [1-3, default 1]"
if (-not $volChoice) { $volChoice = "1" }

switch ($volChoice) {
    "1" { $volScheme = "full_voxel_matrix" }
    "2" { $volScheme = "scatter_tensor" }
    "3" { $volScheme = "shell_isosurface" }
    default { $volScheme = "full_voxel_matrix" }
}

$volRes = Read-Host "Enter volumetric tensor grid resolution density [integer 15-45, default 25]"
if (-not $volRes) { $volRes = "25" }

$opacityInterval = Read-Host "Enter opacity grading interval as min_val,max_val [comma-separated float, default 0.2,0.8]"
if (-not $opacityInterval) { $opacityInterval = "0.2,0.8" }

# 4. CAMERA TRAJECTORY & TENSOR OPERATORS
Write-Host "`n[4/8] Advanced Camera Trajectory & Tensor Differential Operators:" -ForegroundColor Yellow
Write-Host "  [1] orbital_spin [DEFAULT]"
Write-Host "  [2] lissajous_drift"
Write-Host "  [3] helix_zoom"
$camTrajChoice = Read-Host "Select camera trajectory option [1-3, default 1]"
if (-not $camTrajChoice) { $camTrajChoice = "1" }

switch ($camTrajChoice) {
    "1" { $camTrajectory = "orbital_spin" }
    "2" { $camTrajectory = "lissajous_drift" }
    "3" { $camTrajectory = "helix_zoom" }
    default { $camTrajectory = "orbital_spin" }
}

Write-Host "Select Tensor Differential Operator Filter:"
Write-Host "  [1] standard_field [DEFAULT]"
Write-Host "  [2] laplacian_edge"
Write-Host "  [3] gradient_flux"
$opFilterChoice = Read-Host "Select operator filter option [1-3, default 1]"
if (-not $opFilterChoice) { $opFilterChoice = "1" }

switch ($opFilterChoice) {
    "1" { $tensorOperator = "standard_field" }
    "2" { $tensorOperator = "laplacian_edge" }
    "3" { $tensorOperator = "gradient_flux" }
    default { $tensorOperator = "standard_field" }
}

# 5. HEURISTICS & AUDIO
Write-Host "`n[5/8] Target Labeling Heuristic Profiles & Audio:" -ForegroundColor Yellow
$heuristicChoice = Read-Host "Select heuristic option [1: mattervision, 2: photovision, 3: hybrid_core, 4: synesthesia, default 3]"
if (-not $heuristicChoice) { $heuristicChoice = "3" }

switch ($heuristicChoice) {
    "1" { $targetHeuristic = "mattervision" }
    "2" { $targetHeuristic = "photovision" }
    "3" { $targetHeuristic = "hybrid_core" }
    "4" { $targetHeuristic = "synesthesia" }
    default { $targetHeuristic = "hybrid_core" }
}

$audioChoice = Read-Host "Select audio profile [1: harmonic_drone, 2: standing_wave, 3: photon_chime, 4: synesthesia_fx, default 3]"
if (-not $audioChoice) { $audioChoice = "3" }

switch ($audioChoice) {
    "1" { $audioProfile = "harmonic_drone" }
    "2" { $audioProfile = "standing_wave" }
    "3" { $audioProfile = "photon_chime" }
    "4" { $audioProfile = "synesthesia_fx" }
    default { $audioProfile = "photon_chime" }
}

# 6. PROCEDURAL EFFECTS & SEEDS
Write-Host "`n[6/8] Procedural Effects & Camera Constraints Configuration:" -ForegroundColor Yellow
$promptInput = Read-Host "Enter prompt configuration [default: soliton_core,soliton_shift,clip_03]"
if (-not $promptInput) { $promptInput = "soliton_core,soliton_shift,clip_03" }

$fullSeed = Read-Host "Enter full parametric seed float [numeric, default 1.1975807343]"
if (-not $fullSeed) { $fullSeed = "1.1975807343" }

$harmonicVec = Read-Host "Enter spatial harmonic vector scale as x,y,z [default 1.0,1.0,1.0]"
if (-not $harmonicVec) { $harmonicVec = "1.0,1.0,1.0" }

$fieldScaleMult = Read-Host "Enter custom free-parameter multiplier [numeric, default 1.1975807343385265188]"
if (-not $fieldScaleMult) { $fieldScaleMult = "1.1975807343385265188" }

$camDist = Read-Host "Enter initial camera distance [numeric, default 2.0]"
if (-not $camDist) { $camDist = "2.0" }
$camPitch = Read-Host "Enter initial Pitch angle in degrees [numeric, default 35]"
if (-not $camPitch) { $camPitch = "35" }
$camYaw = Read-Host "Enter initial Yaw angle in degrees [numeric, default 55]"
if (-not $camYaw) { $camYaw = "55" }

# 7. ADVANCED VISUALS
Write-Host "`n[7/8] Advanced Visual Heuristics & Filtering Profiles:" -ForegroundColor Yellow
$visualCmap = Read-Host "Enter custom colormap override [linear, gray, viridis, plasma, inferno, turbo, default linear]"
if (-not $visualCmap) { $visualCmap = "linear" }

$distortionAmp = Read-Host "Enter spatial distortion amplitude multiplier [numeric, default 1.0]"
if (-not $distortionAmp) { $distortionAmp = "1.0" }

# 8. CONSTRAINTS
Write-Host "`n[8/8] Parametry & Pipeline Matrix Constraints:" -ForegroundColor Yellow
$safetyClamp = Read-Host "Enter master pipeline safety clamp limit [float, default 1000.0]"
if (-not $safetyClamp) { $safetyClamp = "1000.0" }

$highPrecision = Read-Host "Enable high-precision tensor fallback mode [y/N, default n]"
if (-not $highPrecision) { $highPrecision = "n" }

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$outputFile = "$PSScriptRoot\tensor_volumetric_render_$timestamp.mkv"
$audioFile = "$PSScriptRoot\tensor_volumetric_audio_$timestamp.wav"

$env:SPATIAL_BASE_VAL = $spatialBaseVal
$env:SPATIAL_LABEL = $spatialLabel
$env:EXACT_METERS_SCALE = $exactMeters
$env:OFFSET_X = $offsetX
$env:OFFSET_Y = $offsetY
$env:OFFSET_Z = $offsetZ
$env:VOL_SCHEME = $volScheme
$env:VOL_RES = $volRes
$env:OPACITY_INTERVAL = $opacityInterval
$env:CAM_TRAJECTORY = $camTrajectory
$env:TENSOR_OPERATOR = $tensorOperator
$env:TARGET_HEURISTIC = $targetHeuristic
$env:AUDIO_PROFILE = $audioProfile
$env:PROMPT_INPUT = $promptInput
$env:FULL_SEED = $fullSeed
$env:HARMONIC_VEC = $harmonicVec
$env:FIELD_SCALE_MULT = $fieldScaleMult
$env:CAM_DIST = $camDist
$env:CAM_PITCH = $camPitch
$env:CAM_YAW = $camYaw
$env:VISUAL_CMAP = $visualCmap
$env:DISTORTION_AMP = $distortionAmp
$env:SAFETY_CLAMP = $safetyClamp
$env:HIGH_PRECISION = $highPrecision
$env:FPS = $fps
$env:TOTAL_FRAMES = $totalFrames
$env:CALC_DURATION_SEC = $calcDuration
$env:VIDEO_STRETCH_SEC = $videoStretch
$env:TIME_OFFSET = $timeOffset
$env:OUTPUT_FILE = $outputFile
$env:AUDIO_FILE = $audioFile

Write-Host "`n==============================================================================" -ForegroundColor Cyan
Write-Host "    WINMAC TENSOR VOLUMETRIC PIPELINE LOCKED & RENDERING                     " -ForegroundColor Green
Write-Host "==============================================================================" -ForegroundColor Cyan

python -c @"
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

if os.environ.get('HIGH_PRECISION', 'n').lower() == 'y':
    dtype = np.float64
else:
    dtype = np.float32

def signal_handler(sig, frame):
    print('\n[Python] Interrupted cleanly by user.')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

try:
    print('[Python] Initializing Cross-Platform Volumetric Engine...')
    c_base = 1.0
    spatial_base = float(os.environ.get('SPATIAL_BASE_VAL', '1.0'))
    exact_meters = float(os.environ.get('EXACT_METERS_SCALE', '1.0'))
    field_mult = float(os.environ.get('FIELD_SCALE_MULT', '1.1975807343'))
    spatial_label = os.environ.get('SPATIAL_LABEL', 'cm')
    heuristic = os.environ.get('TARGET_HEURISTIC', 'hybrid_core')
    audio_profile = os.environ.get('AUDIO_PROFILE', 'photon_chime')
    active_cmap = os.environ.get('VISUAL_CMAP', 'linear')
    distortion_amp = float(os.environ.get('DISTORTION_AMP', '1.0'))
    safety_clamp = float(os.environ.get('SAFETY_CLAMP', '1000.0'))

    vol_scheme = os.environ.get('VOL_SCHEME', 'full_voxel_matrix')
    vol_res = int(os.environ.get('VOL_RES', '25'))
    cam_trajectory = os.environ.get('CAM_TRAJECTORY', 'orbital_spin')
    tensor_operator = os.environ.get('TENSOR_OPERATOR', 'standard_field')

    raw_interval = os.environ.get('OPACITY_INTERVAL', '0.2,0.8').split(',')
    op_min = float(raw_interval[0].strip()) if len(raw_interval) > 0 else 0.2
    op_max = float(raw_interval[1].strip()) if len(raw_interval) > 1 else 0.8

    c = c_base * field_mult
    fps = int(os.environ.get('FPS', '30'))
    total_frames = int(os.environ.get('TOTAL_FRAMES', '900'))
    duration_sec = float(os.environ.get('CALC_DURATION_SEC', '1.0'))
    playback_sec = float(os.environ.get('VIDEO_STRETCH_SEC', '30.0'))
    time_offset = float(os.environ.get('TIME_OFFSET', '0.0'))

    offset_x = float(os.environ.get('OFFSET_X', '0.0'))
    offset_y = float(os.environ.get('OFFSET_Y', '0.0'))
    offset_z = float(os.environ.get('OFFSET_Z', '0.0'))

    full_seed = float(os.environ.get('FULL_SEED', '1.25'))
    cam_dist = float(os.environ.get('CAM_DIST', '2.0'))
    pitch_init = float(os.environ.get('CAM_PITCH', '35'))
    yaw_init = float(os.environ.get('CAM_YAW', '55'))

    prompt_input = os.environ.get('PROMPT_INPUT', 'soliton_core')
    prompts = [p.strip().lower() for p in prompt_input.split(',')]

    raw_hvec = os.environ.get('HARMONIC_VEC', '1.0,1.0,1.0').split(',')
    h_vec = [float(v.strip()) for v in raw_hvec if v.strip()]
    hx = h_vec[0] if len(h_vec) > 0 else 1.0
    hy = h_vec[1] if len(h_vec) > 1 else 1.0
    hz = h_vec[2] if len(h_vec) > 2 else 1.0

    plt.style.use('dark_background')
    fig = plt.figure(figsize=(10, 6), facecolor='#090d16')
    ax = fig.add_subplot(111, projection='3d')
    ax.set_facecolor('#090d16')

    grid_span = ((c * 1.0) * spatial_base) * exact_meters
    x = np.linspace(-grid_span, grid_span, vol_res, dtype=dtype) + offset_x
    y = np.linspace(-grid_span, grid_span, vol_res, dtype=dtype) + offset_y
    z = np.linspace(-grid_span, grid_span, vol_res, dtype=dtype) + offset_z
    X, Y, Z_grid = np.meshgrid(x, y, z, indexing='ij')

    output_file = os.environ.get('OUTPUT_FILE', 'tensor_render.mkv')
    audio_file_path = os.environ.get('AUDIO_FILE', 'tensor_audio.wav')

    fig.canvas.draw()
    w, h = int(fig.get_figwidth() * fig.dpi), int(fig.get_figheight() * fig.dpi)
    w = w if w % 2 == 0 else w + 1
    h = h if h % 2 == 0 else h + 1

    ffmpeg_cmd = [
        'ffmpeg', '-hide_banner', '-loglevel', 'info', '-y',
        '-f', 'rawvideo', '-vcodec', 'rawvideo',
        '-s', f'{w}x{h}',
        '-pix_fmt', 'rgba', '-r', str(fps), '-i', '-',
        '-i', audio_file_path,
        '-c:v', 'libx264', '-pix_fmt', 'yuv420p',
        '-c:a', 'aac', '-b:a', '128k',
        output_file
    ]

    sample_rate = 44100
    total_audio_frames = int(sample_rate * playback_sec)
    tensor_audio_samples = []

    for i in range(total_frames):
        progress = i / max(1, (total_frames - 1))
        t = (progress * duration_sec) + time_offset
        rot_angle = t * c * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        tensor_audio_samples.append(np.mean(np.sin((X_rot * c) / (hx * full_seed))))

    t_audio = np.linspace(0, playback_sec, total_audio_frames, dtype=dtype)
    interp_wave = np.interp(np.linspace(0, len(tensor_audio_samples) - 1, total_audio_frames), np.arange(len(tensor_audio_samples)), tensor_audio_samples)

    if audio_profile == 'harmonic_drone':
        audio_signal = interp_wave * np.sin(2 * np.pi * 110.0 * t_audio) + 0.5 * np.sin(2 * np.pi * 330.0 * t_audio)
    elif audio_profile == 'standing_wave':
        audio_signal = np.sin(2 * np.pi * 150.0 * t_audio + interp_wave * np.pi) * np.cos(2 * np.pi * 2.0 * t_audio)
    elif audio_profile == 'photon_chime':
        audio_signal = interp_wave * np.sin(2 * np.pi * 587.33 * t_audio)
    elif audio_profile == 'synesthesia_fx':
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

        if heuristic == 'mattervision': active_cmap = 'plasma'
        elif heuristic == 'photovision': active_cmap = 'turbo'
        elif heuristic == 'synesthesia': active_cmap = 'coolwarm'

        for p in prompts:
            if 'boost' in p: prompt_modifier += 1.5
            elif 'shift' in p: beta += np.sin(progress * np.pi)
            elif 'negative_mass' in p: use_negative_mass = True
            elif 'ir' in p or 'thermal' in p: active_cmap = 'inferno'
            elif 'uv' in p: active_cmap = 'cool'

        rot_angle = t * c * hx
        X_rot = X * np.cos(rot_angle) - Y * np.sin(rot_angle)
        Y_rot = X * np.sin(rot_angle) + Y * np.cos(rot_angle)

        P_vol = np.sin((X_rot * c) / (hx * (full_seed + prompt_modifier))) * np.cos((Y_rot * c) / (hy * full_seed) - beta)
        E_vol = 1.0 + hz * full_seed * np.exp(-((X_rot**2 + Y_rot**2 + Z_grid**2) / (2.0 * (grid_span**2) + 1e-9)))
        V_field = (P_vol * E_vol + np.sin(Z_grid * hx * 0.1 - c * t)) * distortion_amp

        if use_negative_mass:
            V_field = -np.log(np.abs(V_field) + 1e-5) * np.sign(V_field)

        if tensor_operator == 'laplacian_edge':
            V_field = np.abs(np.gradient(np.gradient(V_field)[0])[0])
        elif tensor_operator == 'gradient_flux':
            gx, gy, gz = np.gradient(V_field)
            V_field = np.sqrt(gx**2 + gy**2 + gz**2)

        V_field = np.clip(V_field, -safety_clamp, safety_clamp)
        V_field = np.nan_to_num(V_field, nan=0.0, posinf=1.0, neginf=-1.0)
        v_min, v_max = V_field.min(), V_field.max()
        V_norm = np.zeros_like(V_field) if np.isclose(v_min, v_max) else (V_field - v_min) / (v_max - v_min + 1e-9)

        ax.clear()
        ax.set_facecolor('#090d16')
        cmap_to_use = plt.get_cmap('gray') if active_cmap == 'linear' else plt.get_cmap(active_cmap)

        abs_norm = np.abs(V_norm)
        voxels = (abs_norm >= op_min) & (abs_norm <= op_max)

        alpha_map = np.zeros_like(V_norm)
        interval_span = max(1e-5, op_max - op_min)
        in_range_mask = voxels

        if np.any(in_range_mask):
            alpha_map[in_range_mask] = 0.15 + 0.70 * np.clip((abs_norm[in_range_mask] - op_min) / interval_span, 0.0, 1.0)

        colors = cmap_to_use(V_norm)
        colors[..., 3] = alpha_map

        if vol_scheme == 'full_voxel_matrix':
            ax.voxels(voxels, facecolors=colors, edgecolor='none')
        elif vol_scheme == 'scatter_tensor':
            ax.scatter(X_rot[in_range_mask], Y_rot[in_range_mask], Z_grid[in_range_mask], c=V_norm[in_range_mask], cmap=cmap_to_use, s=8, alpha=0.7, edgecolors='none')
        else:
            levels = np.linspace(op_min, op_max, 5)
            for lvl in levels:
                shell_mask = (abs_norm >= lvl) & (abs_norm < lvl + (interval_span / 5.0))
                if np.any(shell_mask):
                    ax.scatter(X_rot[shell_mask], Y_rot[shell_mask], Z_grid[shell_mask], c=V_norm[shell_mask], cmap=cmap_to_use, s=5, alpha=0.5, edgecolors='none')

        ax.set_title(f'TRUE 3D TENSOR SCAN [{vol_scheme.upper}] | Opacity: [{op_min}, {op_max}]', color='#00ffcc', fontsize=9, fontweight='bold')
        ax.set_xlabel(f'X ({spatial_label})', color='white')
        ax.set_ylabel(f'Y ({spatial_label})', color='white')
        ax.set_zlabel(f'Z ({spatial_label})', color='white')

        if cam_trajectory == 'lissajous_drift':
            current_dist = cam_dist * (10.0 + 2.0 * np.sin(progress * np.pi * 2.0))
            current_elev = pitch_init + 15.0 * np.cos(progress * np.pi * 4.0)
            current_azim = yaw_init + (i * 1.2)
        elif cam_trajectory == 'helix_zoom':
            current_dist = cam_dist * (10.0 + 4.0 * (0.5 - progress))
            current_elev = pitch_init + (progress * 45.0)
            current_azim = yaw_init + (i * 0.8)
        else:
            current_dist = cam_dist * 10.0
            current_elev = pitch_init + i * 0.2
            current_azim = yaw_init + (i * 0.8)

        ax.dist = current_dist
        ax.view_init(elev=current_elev, azim=current_azim)

        fig.set_size_inches(10, 6)
        plt.tight_layout()
        fig.canvas.draw()

        p_ffmpeg.stdin.write(bytes(fig.canvas.buffer_rgba()))
        p_ffmpeg.stdin.flush()

        if i % log_interval == 0 or i == total_frames - 1:
            print(f'[Python] Rendered true 3D tensor volumetric frame {i+1}/{total_frames} ({(i+1)/total_frames*100:.1f}%)')

    plt.close(fig)
    p_ffmpeg.communicate()
    if os.path.exists(audio_file_path):
        os.remove(audio_file_path)
    print('[Python] WinMac Render Completed Successfully.')

except Exception as e:
    print(f'[Python Error]: {e}')
    traceback.print_exc()
    sys.exit(1)
"@
