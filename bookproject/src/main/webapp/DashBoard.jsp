<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: white;
        }
    </style>
</head>
<body>

<%
    // JDBC connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/bookproject";
    String dbUser = "root";
    String dbPassword = "";

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Retrieve all books from the book table
        String allBooksQuery = "SELECT * FROM book";
        try (PreparedStatement allBooksPs = conn.prepareStatement(allBooksQuery);
             ResultSet allBooksRs = allBooksPs.executeQuery()) {
%>
            <h2>All Books</h2>
            <table>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                </tr>
<%
                while (allBooksRs.next()) {
%>
                    <tr>
                        <td><%= allBooksRs.getString("book_id") %></td>
                        <td><%= allBooksRs.getString("title") %></td>
                        <td><%= allBooksRs.getString("author") %></td>
                    </tr>
<%
                }
            }
        // Close resources
        conn.close();
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace(); // Print the stack trace for debugging purposes
    }
%>

</body>
</html>
