<?php
// Define the XML file path
$xmlFile = 'books.xml';

// Check if the file exists before loading
if (file_exists($xmlFile)) {
    // Load and parse the XML file safely
    $xml = simplexml_load_file($xmlFile);
    
    if ($xml === false) {
        die("Error: Failed to parse the XML file configuration.");
    }
} else {
    die("Error: The file {$xmlFile} does not exist.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Catalog Reader</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f7f6;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <h2> Book Catalog</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Genre</th>
                <th>Price ($)</th>
                <th>Publish Date</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Loop through each book item in the XML element tree
            foreach ($xml->book as $book) {
                // Accessing attributes requires array syntax, child nodes use object syntax
                echo "<tr>";
                echo "<td>" . htmlspecialchars($book['id']) . "</td>";
                echo "<td><strong>" . htmlspecialchars($book->title) . "</strong></td>";
                echo "<td>" . htmlspecialchars($book->author) . "</td>";
                echo "<td>" . htmlspecialchars($book->genre) . "</td>";
                echo "<td>" . htmlspecialchars($book->price) . "</td>";
                echo "<td>" . htmlspecialchars($book->publish_date) . "</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>

</body>
</html>
