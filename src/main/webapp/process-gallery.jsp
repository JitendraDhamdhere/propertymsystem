<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="../includes/connect.jsp"%>

<%@ page session="true"%>
<%
String isAdminLoggedIn = (String) session.getAttribute("adminLoggedIn");
if (isAdminLoggedIn == null) {
	response.sendRedirect("index.jsp");
}

// Fetch the form data
String imageUrl = request.getParameter("image_url");
String altText = request.getParameter("alt_text");

// Handling file upload (gallery image)
String imagePath = "uploads/gallery_" + System.currentTimeMillis() + ".jpg"; // Save with a unique filename (timestamp)
Part filePart = request.getPart("image_file");

// Save the file to the server
String uploadDir = getServletContext().getRealPath("/") + "uploads/";
filePart.write(uploadDir + imagePath);

// Database code (example, using JDBC)
try {

	String sql = "INSERT INTO gallery (image_url, alt_text) VALUES (?, ?)";
	PreparedStatement preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, imagePath); // Save the image path (from upload directory)
	preparedStatement.setString(2, altText); // Save alt text

	int result = preparedStatement.executeUpdate();
	if (result > 0) {
		// Redirect to the gallery page or admin dashboard
		response.sendRedirect("admin-dashboard.jsp"); // Or redirect to a specific gallery page
	} else {
		// Handle failure, maybe show an error message
		out.println("Failed to add the image.");
	}
} catch (Exception e) {
	e.printStackTrace();
	out.println("Error: " + e.getMessage());
}
%>
