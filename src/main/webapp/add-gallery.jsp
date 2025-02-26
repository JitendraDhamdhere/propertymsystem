
<!-- ADMINGallary -->
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, java.nio.file.*"%>
<%@ include file="includes/connect.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gallery Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-center text-primary">Gallery Management</h2>

		<!-- Back to Dashboard Button -->
		<div class="mb-3">
			<a href="admin-dashboard.jsp" class="btn btn-primary">Back to
				Dashboard</a>
		</div>

		<!-- Upload Form -->
		<div class="card shadow-lg mt-4">
			<div class="card-header bg-primary text-white text-center">
				<h3>Add Gallery Image</h3>
			</div>
			<div class="card-body">
				<form id="uploadForm" enctype="multipart/form-data">
					<input type="hidden" name="action" value="add">
					<div class="mb-3">
						<label for="image" class="form-label">Choose Image</label> <input
							type="file" class="form-control" id="image" name="image" required>
					</div>
					<div class="mb-3">
						<label for="alt_text" class="form-label">Alt Text</label> <input
							type="text" class="form-control" id="alt_text" name="alt_text"
							required placeholder="Enter image description">
					</div>
					<button type="submit" class="btn btn-success w-100">Upload
						Image</button>
				</form>
			</div>
		</div>

		<!-- Display Uploaded Images -->
		<div class="mt-5">
			<h3 class="text-center">Gallery Images</h3>
			<table class="table table-bordered text-center mt-3">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Image</th>
						<th>Alt Text</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody id="galleryTable">
					<%
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT id, alt_text FROM gallery");
					while (rs.next()) {
					%>
					<tr id="row-<%=rs.getInt("id")%>">
						<td><%=rs.getInt("id")%></td>
						<td><img src="image.jsp?id=<%=rs.getInt("id")%>" width="100"
							height="100" alt="<%=rs.getString("alt_text")%>"></td>
						<td><input type="text" id="alt-<%=rs.getInt("id")%>"
							value="<%=rs.getString("alt_text")%>">
							<button onclick="updateAltText(<%=rs.getInt("id")%>)"
								class="btn btn-warning btn-sm">Update</button></td>
						<td>
							<button onclick="deleteImage(<%=rs.getInt("id")%>)"
								class="btn btn-danger btn-sm">Delete</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>
