<%-- <%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page session="true"%>
<%
String isAdminLoggedIn = (String) session.getAttribute("adminLoggedIn");
if (isAdminLoggedIn == null) {
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Package | Admin Panel</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="adminsytle.css">
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Admin Panel</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						href="admin-dashboard.jsp">Dashboard</a></li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-5">
		<h2 class="text-center mb-4">Add New Package</h2>

		<!-- Add Package Form -->
		<form action="process-package.jsp" method="post"
			enctype="multipart/form-data">
			<div class="mb-3">
				<label for="package_name" class="form-label">Package Name</label> <input
					type="text" class="form-control" id="package_name"
					name="package_namee" required placeholder="Enter package name">
			</div>

			<div class="mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" id="description" name="description"
					rows="4" required placeholder="Enter package description"></textarea>
			</div>

			<div class="mb-3">
				<label for="price" class="form-label">Price</label> <input
					type="number" class="form-control" id="price" name="price" required
					placeholder="Enter price" min="1">
			</div>

			<div class="mb-3">
				<label for="package_image" class="form-label">Package Image</label>
				<input type="file" class="form-control" id="package_image"
					name="package_image" accept="image/*" required>
			</div>

			<button type="submit" class="btn btn-success w-100">Add
				Package</button>
		</form>

		<!-- Back to Admin Dashboard Button -->
		<a href="admin-dashboard.jsp" class="btn btn-secondary w-100 mt-3">Back
			to Admin Dashboard</a>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 --%>