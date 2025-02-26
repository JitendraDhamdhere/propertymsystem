<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.*, java.io.*, java.text.SimpleDateFormat"%>
<%@ include file="includes/connect.jsp"%>
<%@ page import="com.example.utils.InvoicePDFGenerator"%>
<!-- Import helper class -->

<%
    String invoiceMessage = "";
    String invoiceFileName = "";

    if (request.getMethod().equalsIgnoreCase("POST")) {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String invoiceDate = request.getParameter("invoiceDate");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = "Completed";

        String propertyTitle = "";
        String userName = "";
        String userEmail = "";

        try {
            // Fetch booking details
            String query = "SELECT p.title, u.name, u.email FROM bookings b " +
                           "JOIN properties p ON b.property_id = p.id " +
                           "JOIN users u ON b.user_id = u.id WHERE b.id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                propertyTitle = rs.getString("title");
                userName = rs.getString("name");
                userEmail = rs.getString("email");
            }

            // Update booking status
            String updateSql = "UPDATE bookings SET status = ? WHERE id = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
            updateStmt.setString(1, status);
            updateStmt.setInt(2, bookingId);
            updateStmt.executeUpdate();

            // Insert invoice record
            String insertSql = "INSERT INTO invoices (booking_id, invoice_date, amount) VALUES (?, ?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setInt(1, bookingId);
            insertStmt.setString(2, invoiceDate);
            insertStmt.setDouble(3, amount);
            insertStmt.executeUpdate();
            
            // Generate PDF invoice
            invoiceFileName = "invoice_" + bookingId + ".pdf";
            String invoicePath = application.getRealPath("/") + "invoices/" + invoiceFileName;

            // Call Java helper to generate the PDF
            boolean pdfCreated = InvoicePDFGenerator.createInvoicePDF(invoicePath, bookingId, userName, userEmail, propertyTitle, invoiceDate, amount);

            if (pdfCreated) {
                invoiceMessage = "Invoice generated successfully! <a href='invoices/" + invoiceFileName + "' target='_blank'>Download Invoice</a>";
            } else {
                invoiceMessage = "Error generating PDF!";
            }
        } catch (Exception e) {
            invoiceMessage = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Generate Invoice</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2 class="mb-4">Generate Invoice</h2>
		<% if (!invoiceMessage.isEmpty()) { %>
		<div class="alert alert-info"><%= invoiceMessage %></div>
		<% } %>
		<form method="POST">
			<div class="mb-3">
				<label for="bookingId" class="form-label">Select Booking:</label> <select
					class="form-control" name="bookingId" required>
					<option value="">-- Select Booking --</option>
					<% 
                        String sql = "SELECT b.id, p.title FROM bookings b JOIN properties p ON b.property_id = p.id WHERE b.status = 'Pending'";
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        ResultSet rs = pstmt.executeQuery();
                        while (rs.next()) {
                    %>
					<option value="<%= rs.getInt("id") %>"><%= rs.getString("title") %>
						(Booking ID:
						<%= rs.getInt("id") %>)
					</option>
					<% } %>
				</select>
			</div>
			<div class="mb-3">
				<label for="invoiceDate" class="form-label">Invoice Date:</label> <input
					type="date" class="form-control" name="invoiceDate" required>
			</div>
			<div class="mb-3">
				<label for="amount" class="form-label">Amount:</label> <input
					type="number" step="0.01" class="form-control" name="amount"
					required>
			</div>
			<button type="submit" class="btn btn-primary">Generate
				Invoice</button>
		</form>
	</div>
</body>
</html>
