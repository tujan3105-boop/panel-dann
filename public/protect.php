<?php
require_once __DIR__ . '/../vendor/autoload.php';
$app = require_once __DIR__ . '/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Http\Kernel::class);
$response = $kernel->handle($request = Illuminate\Http\Request::capture());

if (!Auth::check() || Auth::user()->id != 1) {
    header('HTTP/1.0 403 Forbidden');
    echo "<h1>Access Denied!</h1>"; exit;
}

// Logika On/Off (Systemctl control)
if (isset($_POST['action'])) {
    $action = $_POST['action']; // start atau stop
    shell_exec("sudo systemctl $action dann_guard");
}

$status = shell_exec("systemctl is-active dann_guard");
$is_running = (trim($status) == 'active');
$logs = shell_exec("tail -n 20 /var/log/dann_guard.log");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DANN GUARD | PROTECT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --neon-blue: #00f2ff; --dark-bg: #0a0a0a; --card-bg: #121212; }
        body { background-color: var(--dark-bg); color: #e0e0e0; font-family: 'Segoe UI', Roboto, sans-serif; }
        
        /* Floating Glassmorphism Effect */
        .glass-card {
            background: var(--card-bg);
            border: 1px solid rgba(0, 242, 255, 0.2);
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(4px);
            margin-top: 50px;
            padding: 30px;
            transition: 0.3s;
        }
        .glass-card:hover { border-color: var(--neon-blue); box-shadow: 0 0 20px rgba(0, 242, 255, 0.2); }

        h1, h5 { color: var(--neon-blue); text-transform: uppercase; letter-spacing: 2px; text-shadow: 0 0 10px rgba(0, 242, 255, 0.5); }
        
        /* Terminal Style Log */
        pre {
            background: #000;
            color: #00f2ff;
            padding: 20px;
            border-radius: 10px;
            border-left: 5px solid var(--neon-blue);
            font-size: 0.85rem;
            max-height: 300px;
        }

        /* Status Badges */
        .status-badge {
            padding: 5px 15px;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: bold;
        }
        .bg-active { background: rgba(0, 255, 127, 0.2); color: #00ff7f; border: 1px solid #00ff7f; }
        .bg-off { background: rgba(255, 0, 0, 0.2); color: #ff4d4d; border: 1px solid #ff4d4d; }

        /* Floating Toggle Switch */
        .switch { position: relative; display: inline-block; width: 60px; height: 34px; }
        .switch input { opacity: 0; width: 0; height: 0; }
        .slider {
            position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0;
            background-color: #333; transition: .4s; border-radius: 34px;
        }
        .slider:before {
            position: absolute; content: ""; height: 26px; width: 26px; left: 4px; bottom: 4px;
            background-color: white; transition: .4s; border-radius: 50%;
        }
        input:checked + .slider { background-color: var(--neon-blue); }
        input:checked + .slider:before { transform: translateX(26px); }

        .btn-cyan {
            background: transparent; border: 1px solid var(--neon-blue); color: var(--neon-blue);
            border-radius: 10px; transition: 0.3s;
        }
        .btn-cyan:hover { background: var(--neon-blue); color: #000; box-shadow: 0 0 15px var(--neon-blue); }
    </style>
</head>
<body>

<div class="container">
    <div class="glass-card">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1>🛡️ DANN GUARD</h1>
                <p class="text-secondary">Advanced Security Interface v2.0</p>
            </div>
            <div class="text-end">
                <span class="status-badge <?php echo $is_running ? 'bg-active' : 'bg-off'; ?>">
                    ● SYSTEM <?php echo $is_running ? 'ACTIVE' : 'OFFLINE'; ?>
                </span>
            </div>
        </div>

        <div class="row text-center mb-4">
            <div class="col-md-4">
                <div class="p-3 border border-secondary rounded">
                    <h5>DISK PROTECT</h5>
                    <form method="POST">
                        <label class="switch">
                            <input type="checkbox" onChange="this.form.submit()" <?php echo $is_running ? 'checked' : ''; ?>>
                            <span class="slider"></span>
                        </label>
                        <input type="hidden" name="action" value="<?php echo $is_running ? 'stop' : 'start'; ?>">
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 border border-secondary rounded">
                    <h5>RAM GUARD</h5>
                    <label class="switch"><input type="checkbox" checked disabled><span class="slider"></span></label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="p-3 border border-secondary rounded">
                    <h5>DDOS FILTER</h5>
                    <label class="switch"><input type="checkbox" checked disabled><span class="slider"></span></label>
                </div>
            </div>
        </div>

        <h5><i class="bi bi-terminal"></i> Security Logs</h5>
        <pre><?php echo htmlspecialchars($logs); ?></pre>

        <div class="mt-4">
            <a href="/" class="btn btn-cyan">Return Home</a>
            <button onclick="location.reload()" class="btn btn-outline-secondary float-end">Sync Data</button>
        </div>
    </div>
</div>

</body>
</html>
