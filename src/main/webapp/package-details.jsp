<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ include file="includes/connect.jsp" %>
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
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }
           .nav-link
        {
         font-size: 1.5em;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-title {
            color: #ff6f61;
            font-weight: bold;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar a {
            color: white !important;
        }
        .logout-btn {
            background-color: #ff4b3a;
            border: none;
        }
        .gallery-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s;
            margin-bottom: 30px;
            width: 100%;
            height: 500px;
        }
        .gallery-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        .gallery-card .card-body {
            text-align: center;
            font-size: 1.2em;
        }
        .gallery-card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="image/LOGO.jpg" alt="Property Management System Logo" style="width: 100px; border-radius: 50%;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#rides">Rides</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Gallery.jsp">Gallery</a>
                </li>
                <li class="nav-item">
                    <form method="post" class="d-inline">
                        <button type="submit" name="logout" class="btn logout-btn text-white nav-link">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>


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
                              <a href="book-details.jsp?type=family&price=2000&name=Family Fun Pack" class="btn btn-primary">Book Now</a>
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
                    
						<a href="book-details.jsp?type=adventure&price=1500&name=Adventure Seeker" class="btn btn-primary">Book Now</a>
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
                   
						<a href="book-details.jsp?type=kids&price=1000&name=Kids Special" class="btn btn-primary">Book Now</a>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        // Session Handling
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.jsp");
        }

        // Logout Functionality
        if (request.getParameter("logout") != null) {
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
