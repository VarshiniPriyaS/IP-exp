<%@ page import="java.sql.*" %>
<%@ page import="com.quickcart.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>Shop Products</title>

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
            margin: 45px auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 35px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
        }

        .card h2 {
            font-size: 20px;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            margin: 15px;
        }

        .buy {
            display: inline-block;
            padding: 10px 22px;
            background: #222;
            color: white;
            text-decoration: none;
            border-radius: 7px;
        }

        .buy:hover {
            background: #444;
        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">QuickCart</div>

    <div>
        <a href="home.jsp">Home</a>
        <a href="catalog.jsp">Shop</a>
        <a href="orderHistory.jsp">Orders</a>
    </div>

</div>


<div class="container">

    <h1>Our Products</h1>

    <div class="products">

        <%
            try {

                Connection con =
                    DBConnection.getConnection();

                Statement st =
                    con.createStatement();

                ResultSet rs =
                    st.executeQuery(
                        "SELECT * FROM products"
                    );

                while (rs.next()) {
        %>

        <div class="card">

            <h2>
                <%= rs.getString("product_name") %>
            </h2>

            <div class="price">
                Rs.<%= String.format("%.2f",
                    rs.getDouble("price")) %>
            </div>

            <a class="buy"
               href="buy.jsp?product_id=<%= rs.getInt("product_id") %>">
                Buy Now
            </a>

        </div>

        <%
                }

                con.close();

            } catch (Exception e) {
        %>

        <p>
            Error: <%= e.getMessage() %>
        </p>

        <%
            }
        %>

    </div>

</div>

</body>
</html>