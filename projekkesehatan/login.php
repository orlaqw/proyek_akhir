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

$stmt = $conn->prepare("SELECT id, password FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    echo json_encode(["status" => "error", "message" => "Email belum terdaftar"]);
} else if (password_verify($password, $user['password'])) {
    echo json_encode(["status" => "success", "message" => "Login berhasil"]);
} else {
    echo json_encode(["status" => "error", "message" => "Password salah"]);
}
