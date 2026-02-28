<?php
header('Content-Type: application/json');
$file = __DIR__ . '/../storage/admin_status.txt';

if (isset($_GET['set_active'])) {
    if (file_put_contents($file, time())) {
        echo json_encode(['status' => 'online']);
    } else {
        echo json_encode(['status' => 'error', 'msg' => 'cannot write to storage']);
    }
    exit;
}

if (file_exists($file)) {
    $last_active = file_get_contents($file);
    if (time() - (int)$last_active < 65) {
        echo json_encode(['online' => true]);
        exit;
    }
}

echo json_encode(['online' => false]);
exit;
