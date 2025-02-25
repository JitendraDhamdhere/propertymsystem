<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="includes/connect.jsp"%>
<%@ page
	import="java.sql.*, java.security.MessageDigest, java.math.BigInteger"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | Property Management System</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<style>
body {
	background: url('image/theme-park-bg.jpg') no-repeat center center fixed;
	background-size: cover;
}

.card {
	border-radius: 15px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.eye-icon {
	cursor: pointer;
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
}
</style>
<script>
	function togglePassword() {
		var passField = document.getElementById("password");
		passField.type = passField.type === "password" ? "text" : "password";
	}
</script>
</head>
<body>
	<div
		class="container d-flex justify-content-center align-items-center vh-100">
		<div class="card p-4" style="width: 100%; max-width: 500px;">
			<h2 class="text-center mb-4">Create Your Account</h2>
			<form method="post">
				<div class="mb-3">
					<label class="form-label">Full Name</label> <input type="text"
						class="form-control" name="fullname" required>
				</div>
				<div class="mb-3">
					<label class="form-label">Email</label> <input type="email"
						class="form-control" name="email" required>
				</div>
				<div class="mb-3">
					<label class="form-label">Phone Number</label> <input type="text"
						class="form-control" name="phone" required>
				</div>
				<div class="mb-3">
					<label class="form-label">Username</label> <input type="text"
						class="form-control" name="username" required>
				</div>
				<div class="mb-3 position-relative">
					<label class="form-label">Password</label> <input type="password"
						class="form-control" name="password" id="password" required>
					<span class="eye-icon" onclick="togglePassword()">👁️</span>
				</div>
				<button type="submit" class="btn btn-success w-100">Register</button>
				<a href="login.jsp" class="btn btn-link w-100 text-center">Already
					Registered? Login</a>
			</form>

			<%-- Server-side processing --%>
			<%
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if (fullname != null && email != null && phone != null && username != null && password != null) {
				try {
					MessageDigest md = MessageDigest.getInstance("SHA-256");
					byte[] hash = md.digest(password.getBytes());
					String hashedPassword = new BigInteger(1, hash).toString(16);

					PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO users (fullname, email, phone, username, password) VALUES (?, ?, ?, ?, ?)");
					ps.setString(1, fullname);
					ps.setString(2, email);
					ps.setString(3, phone);
					ps.setString(4, username);
					ps.setString(5, hashedPassword);

					int result = ps.executeUpdate();
					if (result > 0) {
				out.print("<div class='alert alert-success mt-3'>Registration Successful! Redirecting...</div>");
				response.setHeader("Refresh", "3; URL=login.jsp");
					} else {
				out.print("<div class='alert alert-danger mt-3'>Registration Failed. Try Again.</div>");
					}
					ps.close();
				} catch (Exception e) {
					out.print("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
				}
			}
			%>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
