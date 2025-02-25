<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Package | Property Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('image/theme-park-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        
        .navbar {
    background-color: #343a40; /* Semi-transparent black */
}

body {
    padding-top: 80px; /* Adjust based on navbar height */
}
        
        .booking-form {
           ;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .btn-custom {
            background-color: #ff6f61;
            color: white;
        }
        .btn-custom:hover {
            background-color: #ff4b3a;
        }
          .nav-link
        {
         font-size: 1.6em;
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
    <div class="container mt-5 pt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="booking-form">
                    <h2 class="text-center mb-4">Book Your Package</h2>
                    
                    <%
                        // Get Package Details from URL
                        String packageType = request.getParameter("type");
                        String packageName = request.getParameter("name");
                        String packagePrice = request.getParameter("price");
                    %>

                    <h4>Package Details:</h4>
                    <ul>
                        <li><strong>Package Name:</strong> <%= packageName %></li>
                        <li><strong>Package Type:</strong> <%= packageType %></li>
                        <li><strong>Price:</strong> ₹ <%= packagePrice %></li>
                    </ul>

                    <!-- Booking Form -->
                    <form action="confirm-booking.jsp" method="post">
                        <input type="hidden" name="packageName" value="<%= packageName %>">
                        <input type="hidden" name="packageType" value="<%= packageType %>">
                        <input type="hidden" name="packagePrice" value="<%= packagePrice %>">

                        <div class="mb-3">
                            <label for="name" class="form-label">Your Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number:</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="people" class="form-label">Number of People:</label>
                            <input type="number" class="form-control" id="people" name="people" min="1" required>
                        </div>
                        <button type="submit" class="btn btn-custom w-100">Confirm Booking</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
