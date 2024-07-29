<?php
header("Content-Type: application/json");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "vet_clinic";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(['status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error]));
}

// Get the posted data
$petOwnerName = $_POST['petOwnerName'];
$email = $_POST['email'];
$contactNo = $_POST['contactNo'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

// Prepare and bind
$stmt = $conn->prepare("INSERT INTO users (pet_owner_name, email, contact_no, password) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $petOwnerName, $email, $contactNo, $password);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success', 'message' => 'User registered successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error: ' . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
