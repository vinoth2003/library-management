<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login.jsp?action=login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>

            <div class="alogin">
                <input type="submit">
            </div>
        </form>
    </div>
</body>
</html>

<%
String action = request.getParameter("action");

if ("login".equals(action)) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject", "root", "");
        PreparedStatement ps =  conn.prepareStatement("select * from register where username=? and password=?");
        ps.setString(1, username);
        ps.setString(2, password); // Note: Hash the password in a real application

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // Login successful, redirect to srequest.html
            response.sendRedirect("srequest.html");
        } else {
            // Login failed, redirect to studentlogin.jsp
            response.sendRedirect("studentlogin.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
