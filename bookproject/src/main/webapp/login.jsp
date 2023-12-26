<%@ page import ="java.sql.*" %>
<% 
String action = request.getParameter("action");

if ("register".equals(action)) {
    // Registration code
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject", "root", "");
        PreparedStatement ps =  conn.prepareStatement("insert into register(username, password) values (?, ?)");
        ps.setString(1, username);
        ps.setString(2, password);
        int x = ps.executeUpdate();
        if (x > 0) {
            out.println("registered");
        } else {
            out.println("not registered");
        }
    } catch (Exception e) {
        out.print(e);
    }
} else if ("login".equals(action)) {
    // Login code
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookproject", "root", "");
        PreparedStatement ps =  conn.prepareStatement("select * from register where username=? and password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
        	session.setAttribute("userId", rs.getString("id"));
            // Login successful, display alert and redirect to index.jsp
%>
            <script>
            	alert("Login Successful!!!");
                window.location.href = "srequest.html";
            </script>
<%
        } else {
%>
            <script>
                alert("Login failed");
                window.location.href = "studentlogin.jsp";
            </script>
<%
        }
    } catch (Exception e) {
        out.print(e);
    }
}
%>
