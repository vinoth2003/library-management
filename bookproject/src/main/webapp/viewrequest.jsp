	<%@ page import="java.sql.*" %>
	<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Book Request</title>
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
	
	        .request-button {
	            background-color: #008CBA;
	            color: white;
	            padding: 5px 10px;
	            border: none;
	            border-radius: 4px;
	            cursor: pointer;
	        }
	
	        .request-button:hover {
	            background-color: #006799;
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
	
	        // Prepare the SQL query to get all books
	        String selectQuery = "SELECT * FROM book_requests JOIN register ON book_requests.user_id = register.id JOIN book ON book_requests.book_id = book.book_id";
	        PreparedStatement ps = conn.prepareStatement(selectQuery);
	        ResultSet rs = ps.executeQuery();
	%>
	
	<h2>Book Request</h2>
	<table>
	    <tr>
	    	<th>Student ID</th>
	    	<th>Student Name</th>
	        <th>Book ID</th>
	        <th>Title</th>
	        <th>Author</th>
	        <th>Action</th>
	    </tr>
	    <%
	        // Iterate through the result set and display the books in a table
	        while (rs.next()) {
	    %>
	    <tr>
		   <td><%= rs.getString("user_id") %></td>
		   <td><%= rs.getString("username") %></td>
	        <td><%= rs.getString("book_id") %></td>
	        <td><%= rs.getString("title") %></td>
	        <td><%= rs.getString("author") %></td>
	        <td>
	        <% if ("false".equals(rs.getString("status"))) { %>
	            <form action="processAccept.jsp" method="post">
	                <input type="hidden" name="bookId" value="<%= rs.getString("request_id") %>">
	                <button type="submit" class="request-button">Accept</button>
	            </form>
	            <form action="processCancel.jsp" method="post">
	                <input type="hidden" name="bookId" value="<%= rs.getString("request_id") %>">
	                <button type="submit" class="request-button">Cancel</button>
	            </form>
	         <%}else if ("true".equals(rs.getString("status"))) { %>
	         	<button type="button" class="request-button">You Have Accepted</button>
	         <%} %>
	        </td>
	    </tr>
	    <%
	        }
	
	        // Close resources
	        rs.close();
	        ps.close();
	        conn.close();
	    } catch (Exception e) {
	        out.println("<p>Error: " + e.getMessage() + "</p>");
	        e.printStackTrace(); // Print the stack trace for debugging purposes
	    }
	%>
	
	</table>
	
	</body>
	</html>
