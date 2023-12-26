<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
    </style>
</head>
<body>
<%

// JDBC connection parameters
String jdbcUrl = "jdbc:mysql://localhost:3306/bookproject";
String dbUser = "root";
String dbPassword = "";

// Load the JDBC driver
Class.forName("com.mysql.cj.jdbc.Driver");

// Establish the connection
Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

// Get the book ID and action from the request
String userId = (String) session.getAttribute("userId");
String bookId = request.getParameter("bookId");
String action = "false";

// Check if the request already exists in the database
String selectQuery = "SELECT * FROM book_requests WHERE book_id=? AND user_id=?";
PreparedStatement selectPs = conn.prepareStatement(selectQuery);
selectPs.setString(1, bookId);
selectPs.setString(2, userId);

ResultSet resultSet = selectPs.executeQuery();

if (resultSet.next()) {
    // The request already exists
%>
    <script>
        alert("You have already requested this book.");
        window.location.href = "BookList.jsp";
    </script>
<%
} else {
    // The request doesn't exist, proceed with the insertion
    String insertQuery = "INSERT INTO book_requests (book_id, user_id, status) VALUES (?, ?, ?)";
    PreparedStatement insertPs = conn.prepareStatement(insertQuery);
    insertPs.setString(1, bookId);
    insertPs.setString(2, userId);
    insertPs.setString(3, action);

    // Execute the query
    int rowsInserted = insertPs.executeUpdate();

    if (rowsInserted > 0) {
%>
        <script>
            alert("Book Requested Successfully!");
            window.location.href = "BookList.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("Failed to Request Book. Please try again.");
            window.location.href = "BookList.jsp";
        </script>
<%
    }
}


%>

</body>
</html>
