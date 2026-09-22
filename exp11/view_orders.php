<?php
include "db_connect.php";

$sql = "SELECT * FROM orders ORDER BY order_date DESC";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Orders - Dashboard</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4f7f6;
      margin: 0;
      padding: 40px;
    }
    .table-container {
      max-width: 900px;
      margin: 0 auto;
      background: white;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    h2 {
      margin-top: 0;
      color: #333;
      border-bottom: 2px solid #2ecc71;
      padding-bottom: 10px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th {
      background-color: #2ecc71;
      color: white;
      text-align: left;
      padding: 12px;
      font-weight: 600;
    }
    td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      color: #555;
    }
    tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    tr:hover {
      background-color: #f1f1f1;
    }
    .btn-link {
      display: inline-block;
      margin-top: 20px;
      color: #2ecc71;
      text-decoration: none;
      font-weight: bold;
    }
    .btn-link:hover {
      text-decoration: underline;
    }
    .no-data {
      text-align: center;
      color: #999;
      padding: 20px;
    }
  </style>
</head>
<body>

  <div class="table-container">
    <h2>📋 Customer Order History</h2>
    <table>
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
            <td><strong>#<?php echo $row['order_id']; ?></strong></td>
            <td><?php echo htmlspecialchars($row['customer_name']); ?></td>
            <td><?php echo htmlspecialchars($row['product_name']); ?></td>
            <td><?php echo $row['quantity']; ?></td>
            <td>$<?php echo number_format($row['price'], 2); ?></td>
            <td><?php echo $row['order_date']; ?></td>
          </tr>
        <?php } ?>
      <?php } else { ?>
        <tr><td colspan="6" class="no-data">No orders found.</td></tr>
      <?php } ?>
    </table>
    <a href="index.html" class="btn-link">← Place Another Order</a>
  </div>

</body>
</html>
<?php $conn->close(); ?>
