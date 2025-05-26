<?php
header("Content-Type: application/json");
require 'config.php';

$data = json_decode(file_get_contents("php://input"));

$email = $data->email ?? null;
$password = $data->password ?? null;

if (!$email || !$password) {
    echo json_encode(["status" => "error", "message" => "Email dan password wajib diisi"]);
    exit;
}

$passwordHash = password_hash($password, PASSWORD_DEFAULT);

// Cek jika email sudah ada
$stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "Email sudah terdaftar"]);
} else {
    $stmt = $conn->prepare("INSERT INTO users (email, password) VALUES (?, ?)");
    $stmt->bind_param("ss", $email, $passwordHash);
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Registrasi berhasil"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Registrasi gagal"]);
    }
}
