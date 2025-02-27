<%@ page import="java.sql.*, java.io.*, java.text.SimpleDateFormat"%> 
<%@ include file="includes/connect.jsp"%>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        int propertyId = Integer.parseInt(request.getParameter("property_id"));
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String bookingDateStr = request.getParameter("booking_date");
        String status = request.getParameter("status");

        // Convert booking date to proper SQL timestamp
        java.sql.Timestamp bookingDate = java.sql.Timestamp.valueOf(bookingDateStr + " 00:00:00");

        String sql = "INSERT INTO booking (property_id, user_id, booking_date, status) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, propertyId);
        pstmt.setInt(2, userId);
        pstmt.setTimestamp(3, bookingDate);
        pstmt.setString(4, status);

        int rowsInserted = pstmt.executeUpdate();
        pstmt.close();
        conn.close();

        if (rowsInserted > 0) {
            response.sendRedirect("gallery.jsp?msg=Booking Successful!");
        } else {
            response.sendRedirect("gallery.jsp?msg=Booking Failed!");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("gallery.jsp?msg=Error: " + e.getMessage());
    }
} else {
    response.sendRedirect("gallery.jsp?msg=Invalid request method.");
}
%>
