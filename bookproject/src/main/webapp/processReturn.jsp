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

//JDBC connection parameters
String jdbcUrl = "jdbc:mysql://localhost:3306/bookproject";
String dbUser = "root";
String dbPassword = "";

//Load the JDBC driver
Class.forName("com.mysql.cj.jdbc.Driver");

//Establish the connection
Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

// Get the book ID and action from the request
String bookId = request.getParameter("bookId");
// Update the status in the database
String updateQuery = "DELETE FROM book_requests WHERE request_id = ?";
PreparedStatement updatePs = conn.prepareStatement(updateQuery);
updatePs.setString(1, bookId);

// Execute the update query
int rowsUpdated = updatePs.executeUpdate();

// Check if the update was successful
if (rowsUpdated > 0) {
%>
    <script>
        alert("You have Return the Book");
        window.location.href = "returnbook.jsp";
    </script>
<%
} else {
%>
    <script>
        alert("Failed to Cancel Book. Please try again.");
        window.location.href = "returnbook.jsp";
    </script>
<%
}


%>

</body>
</html>
