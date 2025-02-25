<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="includes/connect.jsp"%>
<%
    String loggedInUser = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Property Management System</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    
    <!-- Custom Styles -->
    <style>
        body {
            padding-top: 80px;
        }
        .navbar-brand img {
            width: 80px;
            border-radius: 50%;
        }
        .contact-card {
            border: none;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .footer-links a {
            color: white;
            text-decoration: none;
            transition: 0.3s;
        }
        .footer-links a:hover {
            color: #f8d210;
        }
        .social-icons a {
            font-size: 1.5rem;
            margin-right: 15px;
            color: white;
            transition: 0.3s;
        }
        .social-icons a:hover {
            color: #f8d210;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="image/property-logo.png" alt="Property Management Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="#properties">Properties</a></li>
                    <li class="nav-item"><a class="nav-link active" href="contact.jsp">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>

                    <% if (loggedInUser != null) { %>
                        <li class="nav-item"><a class="nav-link" href="property-list.jsp">My Properties</a></li>
                        <li class="nav-item"><span class="nav-link text-white fw-bold">Welcome, <%= loggedInUser %></span></li>
                        <li class="nav-item"><a class="btn btn-danger text-white px-3" href="logout.jsp">Logout</a></li>
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="template.jsp">Properties</a></li>
                        <li class="nav-item"><a class="btn btn-primary text-white px-3" href="login.jsp">Login</a></li>
                    <% } %>

                    <li class="nav-item"><a class="nav-link" href="adminlogin.jsp">Admin</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contact Us Section -->
    <section class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card contact-card p-4">
                    <h3 class="text-center mb-4">Get in Touch</h3>
                    <form action="contact_process.jsp" method="post">
                        <div class="mb-3">
                            <label class="form-label">Your Name</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Phone Number</label>
                            <input type="text" class="form-control" name="phone" placeholder="Enter your phone number" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Message</label>
                            <textarea class="form-control" name="message" rows="5" placeholder="Enter your message" required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

  	<!-- Footer Section -->
	<footer class="bg-dark text-white pt-5 pb-4">
		<div class="container text-center text-md-start">
			<div class="row">
				<!-- About Section -->
				<div class="col-md-4 col-lg-4 col-xl-4 mx-auto mb-4">
					<h5 class="text-uppercase fw-bold mb-4">
						<img src="image/property-logo.png" alt="Logo"
							style="width: 100px; height: 100px; align: center; margin-right: 10px;">
					</h5>
					<p style="font-size: 1.1em;">Your trusted partner in finding the perfect property.</p>
				</div>

				<!-- Quick Links -->
				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
					<h5 class="text-uppercase fw-bold mb-4">Quick Links</h5>
					<ul class="list-unstyled" style="font-size: 1.1em;">
						<li><a href="index.jsp" class="text-white text-decoration-none">Home</a></li>
						<li><a href="#about" class="text-white text-decoration-none">About Us</a></li>
						<li><a href="#properties" class="text-white text-decoration-none">Properties</a></li>
						<li><a href="gallery.jsp" class="text-white text-decoration-none">Gallery</a></li>
						<li><a href="contact.jsp" class="text-white text-decoration-none">Contact Us</a></li>
					</ul>
				</div>

				<!-- Contact Information -->
				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-4">
					<h5 class="text-uppercase fw-bold mb-4">Get In Touch</h5>
					<p style="font-size: 1.1em;">
						123 Property Street,<br> City Center,<br> Country - 12345
					</p>
					<p style="font-size: 1.1em;">
						<i class="bi bi-telephone-fill"></i> +91-1020304050
					</p>
					<p style="font-size: 1.1em;">
						<i class="bi bi-envelope-fill"></i> info@propertymanagement.com
					</p>
				</div>

				<!-- Social Links -->
				<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mb-4">
					<h5 class="text-uppercase fw-bold mb-4">Follow Us</h5>
					<div class="mt-3">
						<a href="#" class="text-white me-3 fs-4"><i class="bi bi-facebook"></i></a>
						<a href="#" class="text-white me-3 fs-4"><i class="bi bi-instagram"></i></a>
						<a href="#" class="text-white me-3 fs-4"><i class="bi bi-linkedin"></i></a>
						<a href="#" class="text-white fs-4"><i class="bi bi-youtube"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2); font-size: 1.1em;">
			© 2025 Property Management System | All Rights Reserved</div>
	</footer>


    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
