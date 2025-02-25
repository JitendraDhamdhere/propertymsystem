<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String loggedInUser = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Package Details | Property Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('image/theme-park-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        /* Navbar Styles */
        .nav-link {
            font-size: 1.5em;
        }

        /* Card Styles */
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-title {
            color: #ff6f61;
            font-weight: bold;
        }

        /* Button Styles */
        .btn-primary {
            background: linear-gradient(45deg, #007bff, #00c6ff);
            border: none;
            border-radius: 50px;
            transition: transform 0.3s;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }
    </style>
</head>
<body>

   	<!-- Navigation Bar -->
<header>	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #212529;">
		<div class="container">
			<a class="navbar-brand" href="#"> 
				<img src="image/property-logo.png" alt="Property Management System Logo" style="width: 100px; border-radius: 50%;">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="#properties">Properties</a></li>
					<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="gallery.jsp">Gallery</a></li>

					<%-- Show the "Properties" link based on login status --%>
					<% 
						if (loggedInUser != null) {
					%>
						<li class="nav-item"><a class="nav-link" href="property-list.jsp">My Properties</a></li> <!-- Show for logged-in users -->
						<li class="nav-item"><a class="nav-link text-white fw-bold">Welcome, <%= loggedInUser %></a></li>
						<li class="nav-item"><a class="nav-link btn btn-danger text-white px-3" href="logout.jsp">Logout</a></li>
					<% 
						} else {
					%>
						<li class="nav-item"><a class="nav-link" href="template.jsp">Properties</a></li> <!-- Show for non-logged-in users -->
						<li class="nav-item"><a class="nav-link btn btn-primary text-white px-3" href="login.jsp">Login</a></li>
					<% 
						}
					%>

					<li class="nav-item"><a class="nav-link" href="adminlogin.jsp">Admin</a></li>
				</ul>
			</div>
		</div>
	</nav></header>
   
    <!-- Package Details Section -->
    <div class="container mt-5 pt-5">
        <h2 class="text-center mb-4" style="padding-top:50px;">Exciting Packages Just for You!</h2>
        <div class="row">
            <!-- Package 1 -->
            <div class="col-md-4">
                <div class="card">
                    <img src="image/CarnivalRide.jpg" class="card-img-top" alt="Family Fun Pack">
                    <div class="card-body">
                        <h5 class="card-title">Family Fun Pack</h5>
                        <p class="card-text">Unlimited rides and attractions for the whole family! Enjoy thrilling experiences and memorable moments.</p>
                        <h6 class="text-primary">Price: ₹ 2000</h6>
                    </div>
                </div>
            </div>

            <!-- Package 2 -->
            <div class="col-md-4">
                <div class="card">
                    <img src="image/ttower.jpg" class="card-img-top" alt="Adventure Seeker">
                    <div class="card-body">
                        <h5 class="card-title">Adventure Seeker</h5>
                        <p class="card-text">Perfect for adrenaline junkies! Access to all thrill rides and adventure zones.</p>
                        <h6 class="text-primary">Price: ₹ 1500</h6>
                    </div>
                </div>
            </div>

            <!-- Package 3 -->
            <div class="col-md-4">
                <div class="card">
                    <img src="image/BalloonRace.jpg" class="card-img-top" alt="Kids Special">
                    <div class="card-body">
                        <h5 class="card-title">Kids Special</h5>
                        <p class="card-text">A special package designed for kids with fun rides and playful activities.</p>
                        <h6 class="text-primary">Price: ₹ 1000</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
