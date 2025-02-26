<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../includes/connect.jsp"%>

<%
    // Fetch all properties
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM properties");
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Properties</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-4">
		<h2 class="text-center mb-4">Manage Properties</h2>


		<%-- Success/Error Message --%>
		<% if (request.getParameter("msg") != null) { %>
		<div
			class="alert <%= request.getParameter("msg").equals("deleted") || request.getParameter("msg").equals("success") ? "alert-success" : "alert-danger" %>">
			<%= request.getParameter("msg").equals("deleted") ? "Property deleted successfully!" : request.getParameter("msg").equals("success") ? "Operation completed successfully!" : "Something went wrong!" %>
		</div>
		<% } %>

		<table class="table table-bordered table-striped">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Type</th>
					<th>Price (₹)</th>
					<th>Location</th>
					<th>Size (sqft)</th>
					<th>Bedrooms</th>
					<th>Bathrooms</th>
					<th>Status</th>
					<th>Image</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% while (rs.next()) { %>
				<tr>
					<td><%= rs.getInt("id") %></td>
					<td><%= rs.getString("title") %></td>
					<td><%= rs.getString("description") %></td>
					<td><%= rs.getString("type") %></td>
					<td><%= rs.getDouble("price") %></td>
					<td><%= rs.getString("location") %></td>
					<td><%= rs.getInt("size") %></td>
					<td><%= rs.getInt("bedrooms") %></td>
					<td><%= rs.getInt("bathrooms") %></td>
					<td><%= rs.getString("status") %></td>
					<td><img src="<%= rs.getString("image") %>"
						alt="Property Image" width="100"></td>
					<td><a href="#" class="btn btn-warning btn-sm"
						onclick="loadPage('edit-property.jsp?id=<%= rs.getInt("id") %>', 'Edit Property')">
							<i class="fas fa-edit"></i> Edit
					</a> <%-- <a href="delete-property.jsp?id=<%= rs.getInt("id") %>"
						class="btn btn-danger btn-sm"
						onclick="return confirm('Are you sure you want to delete this property?');">
							<i class="fas fa-trash"></i> Delete
					</a> --%>
						<button class="btn btn-danger btn-sm"
							onclick="deleteProperty(<%= rs.getInt("id") %>)">
							<i class="fas fa-trash"></i> Delete
						</button></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>
