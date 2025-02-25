<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*, javax.sql.*, java.util.*" %>
<%@ include file="includes/connect.jsp" %> <!-- Include the connect.jsp file here -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation | Property Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5 pt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Booking Confirmation</h2>

                <% 
                    // Get form data from the booking page
                    String packageName = request.getParameter("packageName");
                    String packageType = request.getParameter("packageType");
                    String packagePrice = request.getParameter("packagePrice");
                    String customerName = request.getParameter("name");
                    String phoneNumber = request.getParameter("phone");
                    String numberOfPeople = request.getParameter("people");

                    // Calculate the total price
                    double pricePerPerson = Double.parseDouble(packagePrice);
                    int people = Integer.parseInt(numberOfPeople);
                    double totalPrice = pricePerPerson * people;

                    // Database connection is already managed by the connect.jsp file, so we use the existing connection
                    PreparedStatement ps = null;

                    try {
                        // Prepare the SQL statement to insert booking data
                        String sql = "INSERT INTO bookings (package_name, package_type, package_price, total_price, customer_name, phone_number, number_of_people) "
                                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                        ps = conn.prepareStatement(sql);
                        ps.setString(1, packageName);
                        ps.setString(2, packageType);
                        ps.setBigDecimal(3, new java.math.BigDecimal(packagePrice));
                        ps.setBigDecimal(4, new java.math.BigDecimal(totalPrice));  // Total Price
                        ps.setString(5, customerName);
                        ps.setString(6, phoneNumber);
                        ps.setInt(7, people);

                        // Execute the query
                        int rowsAffected = ps.executeUpdate();

                        if (rowsAffected > 0) {
                %>
                            <div class="alert alert-success text-center">
                                Your booking has been confirmed! The total price is ₹ <%= totalPrice %>. Thank you, <%= customerName %>.
                            </div>
                <%
                        } else {
                %>
                            <div class="alert alert-danger text-center">
                                There was an error processing your booking. Please try again later.
                            </div>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (ps != null) ps.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>

                <div class="text-center mt-4">
                    <a href="index.jsp" class="btn btn-primary">Back to Home</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
