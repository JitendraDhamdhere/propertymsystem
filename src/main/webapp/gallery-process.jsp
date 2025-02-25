<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
    import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, java.nio.file.*"
    isErrorPage="false"
%>

<%@ include file="../includes/connect.jsp"%>

<%
    // Ensure the form has enctype="multipart/form-data"
    if (request.getContentType() != null && request.getContentType().toLowerCase().startsWith("multipart/")) {

        String uploadPath = application.getRealPath("") + "uploads";  // Set upload directory
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Get the uploaded file
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = "uploads/" + fileName;

        // Save the uploaded file
        try (InputStream fileContent = filePart.getInputStream()) {
            File file = new File(uploadPath, fileName);
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        // Get form values
        String altText = request.getParameter("alt_text");

        // Insert into database
        PreparedStatement ps = conn.prepareStatement("INSERT INTO gallery (image_url, alt_text) VALUES (?, ?)");
        ps.setString(1, filePath);
        ps.setString(2, altText);
        ps.executeUpdate();
        conn.close();

        // Redirect to gallery page
        response.sendRedirect("gallery.jsp");
    } else {
        out.println("Error: Form is not using enctype='multipart/form-data'");
    }
%>
