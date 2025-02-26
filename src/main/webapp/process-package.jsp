<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, java.nio.file.*"%>
<%@ include file="includes/connect.jsp"%>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Fetch form data
        String packageName = request.getParameter("package_namee");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");

        // Debugging output to check the received parameters
        System.out.println("Package Name: " + packageName);  // Check package_name value
        System.out.println("Description: " + description);  // Check description value
        System.out.println("Price: " + priceStr);  // Check price value

        // Validation checks
        if (packageName == null || packageName.trim().isEmpty()) {
            out.println("Package name is required.");
            return;
        }

        if (description == null || description.trim().isEmpty()) {
            out.println("Description is required.");
            return;
        }

        if (priceStr == null || priceStr.trim().isEmpty()) {
            out.println("Price is required.");
            return;
        }

        // Check if the price is a valid number
        double price = 0.0;
        try {
            price = Double.parseDouble(priceStr.trim());
        } catch (NumberFormatException e) {
            out.println("Invalid price format.");
            return;
        }

        // Handling file upload (package image)
        String imagePath = null;
        try {
            Part filePart = request.getPart("package_image");
            if (filePart != null && filePart.getSize() > 0) {
                // Create a unique filename with timestamp
                imagePath = "uploads/packages_" + System.currentTimeMillis() + ".jpg";
                
                // Get the path where images will be stored on the server
                String uploadDir = getServletContext().getRealPath("/") + "uploads/";
                
                // Ensure the uploads directory exists
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                
                // Save the file to the server
                filePart.write(uploadDir + imagePath);
            } else {
                out.println("Image file is required.");
                return;
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            out.println("Error uploading image: " + e.getMessage());
            return;
        }

        // Database insertion code (save package data to the database)
        try {
            String sql = "INSERT INTO packages (package_name, description, price, package_image) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, packageName);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setString(4, imagePath); // Store the image path in the database

            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("admin-dashboard.jsp"); // Redirect to dashboard or show success message
            } else {
                out.println("Failed to add package.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
%>
