<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Profile</title>

    <style>
        body {
            font-family: Verdana, sans-serif;
            background-color: #e8eef7;
        }

        .profile-box {
            width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            box-shadow: 0px 4px 12px gray;
        }

        h2 {
            text-align: center;
            color: #243b55;
        }

        .detail {
            padding: 12px;
            margin: 8px 0;
            background-color: #f4f6f9;
        }

        .label {
            font-weight: bold;
            color: #243b55;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            color: white;
            background: #243b55;
            padding: 10px 20px;
        }
    </style>
</head>

<body>

<div class="profile-box">

    <h2>Employee Profile Details</h2>

    <div class="detail">
        <span class="label">Full Name:</span>
        <%= request.getParameter("fullName") %>
    </div>

    <div class="detail">
        <span class="label">User Name:</span>
        <%= request.getParameter("userName") %>
    </div>

    <div class="detail">
        <span class="label">Email Address:</span>
        <%= request.getParameter("emailAddress") %>
    </div>

    <div class="detail">
        <span class="label">Password:</span>
        <%= request.getParameter("userPassword") %>
    </div>

    <div class="detail">
        <span class="label">Mobile Number:</span>
        <%= request.getParameter("phoneNumber") %>
    </div>

    <div class="detail">
        <span class="label">Credit Card Number:</span>
        <%= request.getParameter("creditCard") %>
    </div>

    <div class="detail">
        <span class="label">Job Profile:</span>
        <%= request.getParameter("profileTitle") %>
    </div>

    <div class="detail">
        <span class="label">Experience:</span>
        <%= request.getParameter("experienceYears") %> Years
    </div>

    <div class="back">
        <a href="registration.html">Register Another User</a>
    </div>

</div>

</body>
</html>