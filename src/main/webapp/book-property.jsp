<%@ page import="java.sql.*, java.io.*"%>
<%@ include file="includes/connect.jsp"%>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    int propertyId = Integer.parseInt(request.getParameter("property_id"));
    int userId = Integer.parseInt(request.getParameter("user_id"));
    String bookingDate = request.getParameter("booking_date");
    String status = request.getParameter("status");

    PreparedStatement pstmt = null;
    try {
        // Ensure connection is retrieved

        if (conn == null) {
            throw new Exception("Database connection is null.");
        }

        String sql = "INSERT INTO booking (property_id, user_id, booking_date, status) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, propertyId);
        pstmt.setInt(2, userId);
        pstmt.setString(3, bookingDate);
        pstmt.setString(4, status);

        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("gallery.jsp?msg=Booking Successful!");
        } else {
            response.sendRedirect("gallery.jsp?msg=Booking Failed!");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("gallery.jsp?msg=Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
    }
} else {
    response.sendRedirect("gallery.jsp?msg=Invalid request method.");
}
%>

