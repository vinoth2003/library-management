<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <!-- Add your styles and other head elements here -->
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject", "root", "");
        PreparedStatement ps = conn.prepareStatement("insert into register(username,password) values (?,?)");
        ps.setString(1, username);
        ps.setString(2, password);
        int x = ps.executeUpdate();

        if (x > 0) {
%>
            <script>
                alert("Registration successful!");
                window.location.href = 'studentlogin.jsp';
            </script>
<%
        } else {
            out.println("Not registered");
        }

    } catch (Exception e) {
        out.print(e);
    }
%>
</body>
</html>
