<%@ page import="java.sql.*" %>
<%@ page import="com.quickcart.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>Buy Product</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #eef1f5;
        }

        .box {
            width: 450px;
            margin: 60px auto;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .product {
            text-align: center;
            background: #f4f4f4;
            padding: 18px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 7px;
        }

        .btn {
            width: 100%;
            margin-top: 25px;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: #222;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

    </style>

</head>

<body>

<div class="box">

    <h1>Place Your Order</h1>

<%
    String id = request.getParameter("product_id");

    int productId = Integer.parseInt(id);

    String productName = "";
    double price = 0;

    try {

        Connection con =
            DBConnection.getConnection();

        PreparedStatement ps =
            con.prepareStatement(
                "SELECT product_name, price " +
                "FROM products WHERE product_id=?"
            );

        ps.setInt(1, productId);

        ResultSet rs =
            ps.executeQuery();

        if (rs.next()) {

            productName =
                rs.getString("product_name");

            price =
                rs.getDouble("price");
        }

        con.close();

    } catch (Exception e) {

        out.println(
            "<p>Error: " + e.getMessage() + "</p>"
        );
    }
%>


    <div class="product">

        <strong>
            <%= productName %>
        </strong>

        <br><br>

        Rs.<%= String.format("%.2f", price) %>

    </div>


    <form method="post">

        <input type="hidden"
               name="product_id"
               value="<%= productId %>">


        <label>Customer Name</label>

        <input type="text"
               name="customer_name"
               placeholder="Enter your name"
               required>


        <label>Quantity</label>

        <input type="number"
               name="quantity"
               value="1"
               min="1"
               required>


        <label>Delivery Date</label>

        <input type="date"
               name="delivery_date"
               required>


        <button class="btn" type="submit">
            Confirm Order
        </button>

    </form>

</div>


<%

if ("POST".equalsIgnoreCase(request.getMethod())) {

    String customerName =
        request.getParameter("customer_name");

    int quantity =
        Integer.parseInt(
            request.getParameter("quantity")
        );

    String deliveryDate =
        request.getParameter("delivery_date");


    try {

        Connection con =
            DBConnection.getConnection();


        PreparedStatement ps1 =
            con.prepareStatement(
                "SELECT price FROM products WHERE product_id=?"
            );

        ps1.setInt(1, productId);

        ResultSet rs =
            ps1.executeQuery();


        if (rs.next()) {

            double productPrice =
                rs.getDouble("price");

            double totalAmount =
                productPrice * quantity;


            PreparedStatement ps2 =
                con.prepareStatement(
                    "INSERT INTO orders " +
                    "(customer_name, product_id, quantity, " +
                    "total_amount, delivery_date) " +
                    "VALUES (?, ?, ?, ?, ?)"
                );


            ps2.setString(1, customerName);
            ps2.setInt(2, productId);
            ps2.setInt(3, quantity);
            ps2.setDouble(4, totalAmount);
            ps2.setDate(
                5,
                java.sql.Date.valueOf(deliveryDate)
            );


            ps2.executeUpdate();

            con.close();


            response.sendRedirect(
                "confirmation.jsp"
            );
        }

    } catch (Exception e) {

        out.println(
            "<p style='color:red;text-align:center;'>"
        );

        out.println(
            "Error: " + e.getMessage()
        );

        out.println("</p>");
    }

}

%>

</body>
</html>