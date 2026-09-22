<!DOCTYPE html>
<html>
<head>

    <title>QuickCart</title>

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
            background: #ffffff;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .hero {
            text-align: center;
            padding: 100px 20px;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 15px;
        }

        .hero p {
            color: #666;
            font-size: 18px;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 13px 28px;
            background: #222;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }

        .btn:hover {
            background: #444;
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


<div class="hero">

    <h1>Shop Smart with QuickCart</h1>

    <p>
        Simple shopping, quick ordering and easy delivery.
    </p>

    <a class="btn" href="catalog.jsp">
        Explore Products
    </a>

</div>

</body>
</html>