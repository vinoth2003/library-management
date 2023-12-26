<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
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
    // Handle form submission
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Get form data
        String title = request.getParameter("name");
        String author = request.getParameter("username");
        String bookId = request.getParameter("Bookid");

        // JDBC connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/bookproject";
        String dbUser = "root";
        String dbPassword = "";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare the SQL query
            String insertQuery = "INSERT INTO book (title, author, book_id) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertQuery);
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, bookId);

            // Execute the query
            int rowsAffected = ps.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
%>
                <script>
                    alert("Book added successfully!");
                    window.location.href = "admindash.jsp";
                </script>
<%
            } else {
                out.println("<p>Error inserting data.</p>");
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
    <label for="Bookid">Book ID:</label>
        <input type="text" id="Bookid" name="Bookid" required>
        <label for="name">Title:</label>
        <input type="text" id="name" name="name" required>

        <label for="username">Author:</label>
        <input type="text" id="username" name="username" required>

        

        <button type="submit">Add</button>
    </form>

</body>
</html>
