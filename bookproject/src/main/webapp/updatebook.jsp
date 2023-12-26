<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book</title>
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
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    // JDBC connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3306/bookproject";
    String dbUser = "root";
    String dbPassword = "";

    // Handle form submission for updating a book
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Get form data
        String bookIdToUpdate = request.getParameter("bookIdToUpdate");
        String updatedTitle = request.getParameter("updatedTitle");
        String updatedAuthor = request.getParameter("updatedAuthor");

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare the SQL query for updating a book
            String updateQuery = "UPDATE book SET title=?, author=? WHERE book_id=?";
            PreparedStatement ps = conn.prepareStatement(updateQuery);
            ps.setString(1, updatedTitle);
            ps.setString(2, updatedAuthor);
            ps.setString(3, bookIdToUpdate);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Check if the update was successful
            if (rowsAffected > 0) {
%>
                <script>
                    alert("Book updated successfully!");
                    window.location.href = "admindash.jsp";
                </script>
<%
            } else {
                out.println("<p>Error updating book.</p>");
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
        <label for="bookIdToUpdate">Book ID to Update:</label>
        <input type="text" id="bookIdToUpdate" name="bookIdToUpdate" required>
        <label for="updatedTitle">Updated Title:</label>
        <input type="text" id="updatedTitle" name="updatedTitle" required>
        <label for="updatedAuthor">Updated Author:</label>
        <input type="text" id="updatedAuthor" name="updatedAuthor" required>
        <button type="submit">Update Book</button>
    </form>

</body>
</html>
