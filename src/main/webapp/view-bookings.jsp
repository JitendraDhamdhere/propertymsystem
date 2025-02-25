<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="../includes/connect.jsp"%> <!-- Include DB connection -->

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
    <title>View Total Bookings | Admin Panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('image/theme-park-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar a {
            color: white !important;
        }
        .card-header {
            background-color: #343a40;
            color: white;
        }
        .table th, .table td {
            text-align: center;
        }
        .back-btn {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin-dashboard.jsp">
                <img src="image/LOGO.jpg" alt="Property Management System Logo" style="width: 100px; border-radius: 50%;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="admin-dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="view-bookings.jsp">View Bookings</a></li>
                    <li class="nav-item">
                        <form method="post" class="d-inline">
                            <button type="submit" name="logout" class="btn btn-danger text-white nav-link">Logout</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Total Bookings Section -->
    <div class="container mt-5 pt-5">
        <div class="card">
            <div class="card-header">
                <h4>View Total Bookings</h4>
            </div>
            <div class="card-body">
                <!-- Back Button -->
                <a href="admin-dashboard.jsp" class="btn btn-primary back-btn">Back to Dashboard</a>

                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Package Name</th>
                            <th>Package Type</th>
                            <th>Package Price</th>
                            <th>Total Price</th>
                            <th>Customer Name</th>
                            <th>Phone Number</th>
                            <th>Number of People</th>
                            <th>Booking Date</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        // Fetching booking data from the database
                        try {
                            String sql = "SELECT * FROM bookings"; // Assuming "bookings" table
                            PreparedStatement preparedStatement = conn.prepareStatement(sql);
                            ResultSet resultSet = preparedStatement.executeQuery();

                            while (resultSet.next()) {
                                int bookingId = resultSet.getInt("booking_id");
                                String packageName = resultSet.getString("package_name");
                                String packageType = resultSet.getString("package_type");
                                double packagePrice = resultSet.getDouble("package_price");
                                double totalPrice = resultSet.getDouble("total_price");
                                String customerName = resultSet.getString("customer_name");
                                String phoneNumber = resultSet.getString("phone_number");
                                int numberOfPeople = resultSet.getInt("number_of_people");
                                String bookingDate = resultSet.getString("booking_date");
                               
                        %>
                        <tr>
                            <td><%= bookingId %></td>
                            <td><%= packageName %></td>
                            <td><%= packageType %></td>
                            <td>₹ <%= packagePrice %></td>
                            <td>₹ <%= totalPrice %></td>
                            <td><%= customerName %></td>
                            <td><%= phoneNumber %></td>
                            <td><%= numberOfPeople %></td>
                            <td><%= bookingDate %></td>
                            
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%
    // Logout functionality
    if (request.getParameter("logout") != null) {
        session.invalidate();
        response.sendRedirect("adminlogin.jsp");
    }
    %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
