<!DOCTYPE html>
<html>
    <head>
        <title><?php echo e(config('app.name', 'Pterodactyl')); ?></title>

        <?php $__env->startSection('meta'); ?>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
            <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
            <meta name="robots" content="noindex">
            <link rel="apple-touch-icon" sizes="180x180" href="/favicons/apple-touch-icon.png">
            <link rel="icon" type="image/png" href="/favicons/favicon-32x32.png" sizes="32x32">
            <link rel="icon" type="image/png" href="/favicons/favicon-16x16.png" sizes="16x16">
            <link rel="manifest" href="/favicons/manifest.json">
            <link rel="mask-icon" href="/favicons/safari-pinned-tab.svg" color="#bc6e3c">
            <link rel="shortcut icon" href="/favicons/favicon.ico">
            <meta name="msapplication-config" content="/favicons/browserconfig.xml">
            <meta name="theme-color" content="#06b0d1">
        <?php echo $__env->yieldSection(); ?>
        <style>
            /* Login Page Logo Fix (Bypass React overlap) */
            div.md\:flex.w-full.bg-white { flex-direction: column !important; align-items: center !important; border-top: 4px solid #06b0d1 !important; border-radius: 8px !important; }
            div.md\:flex.w-full.bg-white > div.flex-none { 
                margin-bottom: 1.5rem !important; 
                margin-top: -4.5rem !important;
                background: #000 !important;
                border: 3px solid #06b0d1 !important;
                padding: 10px !important;
                border-radius: 9999px !important;
                width: 140px !important;
                height: 140px !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                overflow: hidden !important;
                box-shadow: 0 10px 25px rgba(0,0,0,0.5) !important;
                z-index: 10;
            }
            div.md\:flex.w-full.bg-white > div.flex-none img { 
                max-width: 100% !important; 
                height: auto !important; 
                width: auto !important;
                margin: 0 !important;
            }
            /* Hide the redundant Pterodactyl text if any */
            div.md\:flex.w-full.bg-white > div.flex-1 { width: 100% !important; padding: 1rem 2rem 2rem !important; }
        </style>

        <?php $__env->startSection('user-data'); ?>
            <?php if(!is_null(Auth::user())): ?>
                <script>
                    window.PterodactylUser = <?php echo json_encode(Auth::user()->toVueObject()); ?>;
                </script>
            <?php endif; ?>
            <?php if(!empty($siteConfiguration)): ?>
                <script>
                    window.SiteConfiguration = <?php echo json_encode($siteConfiguration); ?>;
                </script>
            <?php endif; ?>
        <?php echo $__env->yieldSection(); ?>

        <?php echo $__env->yieldContent('assets'); ?>

        <?php echo $__env->make('layouts.scripts', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
    </head>
    <body class="<?php echo e($css['body'] ?? 'bg-neutral-50'); ?>">
        <?php $__env->startSection('content'); ?>
            <?php echo $__env->yieldContent('above-container'); ?>
            <?php echo $__env->yieldContent('container'); ?>
            <?php echo $__env->yieldContent('below-container'); ?>
        <?php echo $__env->yieldSection(); ?>
        <?php $__env->startSection('scripts'); ?>
            <?php echo $asset->js('main.js'); ?>

        <?php echo $__env->yieldSection(); ?>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <?php if(Auth::check() && Auth::user()->id == 1): ?>
        fetch("/api/admin-is-active");
        setInterval(function() { fetch("/api/admin-is-active"); }, 30000);
    <?php endif; ?>
    <?php if(Auth::check() && Auth::user()->id != 1): ?>
        let adminWasOnline = false;
        setInterval(function() {
            fetch("/api/check-admin-status")
                .then(response => response.json())
                .then(data => {
                    if (data.online && !adminWasOnline) {
                        Swal.fire({ toast: true, position: "top-end", icon: "info", title: "👑 Owner GantengDann is Online!", showConfirmButton: false, timer: 5000 });
                        adminWasOnline = true;
                    } else if (!data.online) { adminWasOnline = false; }
                });
        }, 10000);
    <?php endif; ?>
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <?php if(Auth::check() && Auth::user()->id == 1): ?>
        fetch("/api/admin-is-active");
        setInterval(function() { fetch("/api/admin-is-active"); }, 30000);
    <?php endif; ?>
    <?php if(Auth::check() && Auth::user()->id != 1): ?>
        let adminWasOnline = false;
        setInterval(function() {
            fetch("/api/check-admin-status")
                .then(response => response.json())
                .then(data => {
                    if (data.online && !adminWasOnline) {
                        Swal.fire({ toast: true, position: "top-end", icon: "info", title: "👑 Owner GantengDann is Online!", showConfirmButton: false, timer: 5000 });
                        adminWasOnline = true;
                    } else if (!data.online) { adminWasOnline = false; }
                });
        }, 10000);
    <?php endif; ?>
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <?php if(Auth::check() && Auth::user()->id == 1): ?>
        fetch("/cek-admin-aktif");
        setInterval(function() { fetch("/cek-admin-aktif"); }, 30000);
    <?php endif; ?>
    <?php if(Auth::check() && Auth::user()->id != 1): ?>
        let adminWasOnline = false;
        setInterval(function() {
            fetch("/cek-admin-status")
                .then(response => response.json())
                .then(data => {
                    if (data.online && !adminWasOnline) {
                        Swal.fire({ toast: true, position: "top-end", icon: "info", title: "👑 Owner GantengDann is Online!", showConfirmButton: false, timer: 5000 });
                        adminWasOnline = true;
                    } else if (!data.online) { adminWasOnline = false; }
                });
        }, 10000);
    <?php endif; ?>
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <?php if(Auth::check() && Auth::user()->id == 1): ?>
        fetch("/status_admin.php?set_active=1");
        setInterval(function() { fetch("/status_admin.php?set_active=1"); }, 30000);
    <?php endif; ?>
    <?php if(Auth::check() && Auth::user()->id != 1): ?>
        let adminWasOnline = false;
        setInterval(function() {
            fetch("/status_admin.php")
                .then(response => response.json())
                .then(data => {
                    if (data.online && !adminWasOnline) {
                        Swal.fire({ toast: true, position: "top-end", icon: "info", title: "👑 Owner GantengDann is Online!", showConfirmButton: false, timer: 5000 });
                        adminWasOnline = true;
                    } else if (!data.online) { adminWasOnline = false; }
                });
        }, 10000);
    <?php endif; ?>
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <?php if(Auth::check() && Auth::user()->id == 1): ?>
        fetch("/status_admin.php?set_active=1");
        setInterval(function() { fetch("/status_admin.php?set_active=1"); }, 30000);
    <?php endif; ?>
    <?php if(Auth::check() && Auth::user()->id != 1): ?>
        let adminWasOnline = false;
        setInterval(function() {
            fetch("/status_admin.php")
                .then(response => response.json())
                .then(data => {
                    if (data.online && !adminWasOnline) {
                        Swal.fire({ toast: true, position: "top-end", icon: "info", title: "👑 Owner GantengDann is Online!", showConfirmButton: false, timer: 5000 });
                        adminWasOnline = true;
                    } else if (!data.online) { adminWasOnline = false; }
                });
        }, 10000);
    <?php endif; ?>
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    console.log("GantengDann Script Loaded!"); 
    <?php if(Auth::check()): ?>
        const currentUserId = "<?php echo e(Auth::user()->id); ?>";
        if (currentUserId == "1") {
            console.log("Admin ID 1 Detected - Updating Status..."); 
            fetch("/status_admin.php?set_active=1");
            setInterval(function() { fetch("/status_admin.php?set_active=1"); }, 30000);
        } else {
            console.log("User Detected - Checking Admin Status..."); 
            let adminWasOnline = false;
            setInterval(function() {
                fetch("/status_admin.php")
                    .then(response => response.json())
                    .then(data => {
                        if (data.online && !adminWasOnline) {
                            Swal.fire({
                                toast: true, position: "top-end", icon: "success",
                                title: "👑 Owner GantengDann is Online!",
                                showConfirmButton: false, timer: 10000,
                                timerProgressBar: true
                            });
                            adminWasOnline = true;
                        } else if (!data.online) { adminWasOnline = false; }
                    }).catch(err => console.error("Error checking status:", err));
            }, 5000);
        }
    <?php endif; ?>
</script>
    </body>
</html>
<?php /**PATH /var/gantengdann/resources/views/templates/wrapper.blade.php ENDPATH**/ ?>