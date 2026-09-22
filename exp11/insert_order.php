<?php
include "db_connect.php";

// Fetch submitted form values
$customer_name = $_POST['customer_name'];
$product_name  = $_POST['product_name'];
$quantity      = $_POST['quantity'];
$price         = $_POST['price'];

// SQL template
$sql = "INSERT INTO orders (customer_name, product_name, quantity, price) VALUES (?, ?, ?, ?)";

// Prepare statement
$stmt = $conn->prepare($sql);
// Bind inputs: s = string, i = integer, d = decimal
$stmt->bind_param("ssid", $customer_name, $product_name, $quantity, $price);

// Execute query and check outcome
if ($stmt->execute()) {
    echo "Order placed successfully! <a href='view_orders.php'>View all orders</a>";
} else {
    echo "Error: " . $stmt->error;
}

// Close open streams
$stmt->close();
$conn->close();
?>
