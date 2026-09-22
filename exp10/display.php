<!DOCTYPE html>
<html>
<head>
    <title>Registration Details</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .container {
            width: 600px;
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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        td:first-child {
            font-weight: bold;
            background-color: #eeeeee;
        }

        a {
            color: blue;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Job Registration Details</h2>

    <table>
        <tr>
            <td>Full Name</td>
            <td><?php echo $_POST['fullname']; ?></td>
        </tr>

        <tr>
            <td>Email ID</td>
            <td><?php echo $_POST['email']; ?></td>
        </tr>

        <tr>
            <td>Address</td>
            <td><?php echo $_POST['address']; ?></td>
        </tr>

        <tr>
            <td>Contact Phone Number</td>
            <td><?php echo $_POST['phone']; ?></td>
        </tr>

        <tr>
            <td>Account Password</td>
            <td><?php echo $_POST['password']; ?></td>
        </tr>

        <tr>
            <td>Desired Job Profile</td>
            <td><?php echo $_POST['jobtitle']; ?></td>
        </tr>

        <tr>
            <td>Total Experience</td>
            <td><?php echo $_POST['experience']; ?> Years</td>
        </tr>
    </table>

</div>

</body>
</html>
