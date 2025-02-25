<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="includes/connect.jsp" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Property Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('image/theme-park-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .nav-link {
            font-size: 1.2em;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .card-title {
            font-weight: bold;
            color: #333;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #343a40;">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="image/LOGO.jpg" alt="Property Management System Logo" style="width: 100px; border-radius: 50%;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="#rides">Rides</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                <li class="nav-item"><a class="nav-link" href="Gallery.jsp">Gallery</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Book Now</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4" style="width: 100%; max-width: 500px;">
        <h2 class="card-title text-center mb-4">Login to Property Management System</h2>
        <form method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
            <a href="register.jsp" class="btn btn-link w-100 text-center">New User? Register</a>
        </form>

        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username != null && password != null) {
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    ps = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = SHA2(?, 256)");
                    ps.setString(1, username);
                    ps.setString(2, password);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        session.setAttribute("username", username);
                        out.print("<div class='alert alert-success mt-3'>Login Successful! Redirecting...</div>");
                        response.setHeader("Refresh", "2; URL=index.jsp");
                    } else {
                        out.print("<div class='alert alert-danger mt-3'>Invalid Username or Password</div>");
                    }
                } catch (Exception e) {
                    out.print("<div class='alert alert-danger mt-3'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (SQLException e) {}
                    try { if (ps != null) ps.close(); } catch (SQLException e) {}
                }
            }
        %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
