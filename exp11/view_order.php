<?php
include "db_connect.php";

// Fetch entries, ordering from newest to oldest
$sql = "SELECT * FROM orders ORDER BY order_date DESC";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html>
<head>
  <title>All Orders</title>
</head>
<body>
  <h2>All Orders</h2>
  <table border="1" cellpadding="6">
    <tr>
      <th>Order ID</th>
      <th>Customer</th>
      <th>Product</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Order Date</th>
    </tr>
    <?php if ($result->num_rows > 0) { ?>
      <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
          <td><?php echo $row['order_id']; ?></td>
          <td><?php echo $row['customer_name']; ?></td>
          <td><?php echo $row['product_name']; ?></td>
          <td><?php echo $row['quantity']; ?></td>
          <td><?php echo $row['price']; ?></td>
          <td><?php echo $row['order_date']; ?></td>
        </tr>
      <?php } ?>
    <?php } else { ?>
      <tr><td colspan="6">No orders found.</td></tr>
    <?php } ?>
  </table>
  <br><a href="index.html">Place another order</a>
</body>
</html>
<?php $conn->close(); ?>
