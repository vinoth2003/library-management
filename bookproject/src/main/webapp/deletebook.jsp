<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #f44336;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

<%
    // JDBC connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/bookproject";
    String dbUser = "root";
    String dbPassword = "";

    // Handle form submission for deleting a book
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Get form data
        String bookIdToDelete = request.getParameter("bookIdToDelete");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare the SQL query for deleting a book
            String deleteQuery = "DELETE FROM book WHERE book_id=?";
            PreparedStatement ps = conn.prepareStatement(deleteQuery);
            ps.setString(1, bookIdToDelete);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Check if the deletion was successful
            if (rowsAffected > 0) {
%>
                <script>
                    alert("Book deleted successfully!");
                    window.location.href = "admindash.jsp";
                </script>
<%
            } else {
                out.println("<p>Error deleting book.</p>");
            }

            // Close resources
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>

    <form action="#" method="post">
        <label for="bookIdToDelete">Book ID to Delete:</label>
        <input type="text" id="bookIdToDelete" name="bookIdToDelete" required>
        <button type="submit">Delete Book</button>
    </form>

</body>
</html>
