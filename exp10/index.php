<!DOCTYPE html>
<html>
<head>
    <title>Job Registration Form</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .container {
            width: 500px;
            margin: 40px auto;
            padding: 25px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        h2 {
            text-align: center;
            color: green;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 70px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: green;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Job Registration Form</h2>

    <form action="details.php" method="post">

        <label>Full Name:</label>
        <input type="text" name="fullname" required>

        <label>Email ID:</label>
        <input type="email" name="email" required>

        <label>Address:</label>
        <textarea name="address" required></textarea>

        <label>Contact Phone Number:</label>
        <input type="tel" name="phone" required>

        <label>Account Password:</label>
        <input type="password" name="password" required>

        <label>Desired Job Profile Title:</label>
        <input type="text" name="jobtitle" required>

        <label>Total Experience (Years):</label>
        <input type="number" name="experience" min="0" step="0.1" required>

        <input type="submit" value="Submit">

    </form>

</div>

</body>
</html>
