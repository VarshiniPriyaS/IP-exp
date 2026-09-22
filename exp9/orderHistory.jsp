<%@ page import="java.sql.*" %>
<%@ page import="com.quickcart.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>Order History</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f4f6f8;
        }

        .navbar {
            background: white;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .navbar a {
            text-decoration: none;
            color: #333;
            margin-left: 25px;
        }

        .container {
            width: 90%;
            margin: 50px auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        th {
            background: #222;
            color: white;
            padding: 15px;
        }

        td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f7f7f7;
        }

    </style>

</head>

<body>


<div class="navbar">

    <div class="logo">
        QuickCart
    </div>

    <div>

        <a href="home.jsp">Home</a>

        <a href="catalog.jsp">Shop</a>

        <a href="orderHistory.jsp">Orders</a>

    </div>

</div>


<div class="container">

    <h1>Order History</h1>


    <table>

        <tr>

            <th>Order ID</th>

            <th>Customer</th>

            <th>Product</th>

            <th>Quantity</th>

            <th>Total</th>

            <th>Delivery Date</th>

        </tr>


<%

try {

    Connection con =
        DBConnection.getConnection();


    String sql =
        "SELECT o.order_id, " +
        "o.customer_name, " +
        "p.product_name, " +
        "o.quantity, " +
        "o.total_amount, " +
        "o.delivery_date " +
        "FROM orders o " +
        "JOIN products p " +
        "ON o.product_id = p.product_id " +
        "ORDER BY o.order_id DESC";


    Statement st =
        con.createStatement();


    ResultSet rs =
        st.executeQuery(sql);


    while (rs.next()) {

%>

        <tr>

            <td>
                <%= rs.getInt("order_id") %>
            </td>

            <td>
                <%= rs.getString("customer_name") %>
            </td>

            <td>
                <%= rs.getString("product_name") %>
            </td>

            <td>
                <%= rs.getInt("quantity") %>
            </td>

            <td>
                Rs.<%= String.format(
                    "%.2f",
                    rs.getDouble("total_amount")
                ) %>
            </td>

            <td>
                <%= rs.getDate("delivery_date") %>
            </td>

        </tr>

<%

    }

    con.close();

} catch (Exception e) {

%>

        <tr>

            <td colspan="6">
                Error: <%= e.getMessage() %>
            </td>

        </tr>

<%
}
%>

    </table>

</div>

</body>

</html>