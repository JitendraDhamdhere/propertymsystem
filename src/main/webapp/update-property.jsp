<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page
	import="java.sql.*, javax.servlet.http.*, javax.servlet.annotation.*"%>
<%@ include file="../includes/connect.jsp"%>
<%@ page
	import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.annotation.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String title = request.getParameter("title");
String description = request.getParameter("description");
String type = request.getParameter("type");
double price = Double.parseDouble(request.getParameter("price"));
String location = request.getParameter("location");
int size = Integer.parseInt(request.getParameter("size"));
int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
String status = request.getParameter("status");

// Handle file upload if a new image is provided
Part filePart = request.getPart("imageFile");
String imagePath = null;

if (filePart != null && filePart.getSize() > 0) {
    String fileName = filePart.getSubmittedFileName();
    String uploadDir = getServletContext().getRealPath("/") + "image";
    File uploadFolder = new File(uploadDir);
    if (!uploadFolder.exists()) {
        uploadFolder.mkdirs();
    }
    String filePath = uploadDir + File.separator + fileName;
    try (InputStream fileContent = filePart.getInputStream();
         FileOutputStream fos = new FileOutputStream(filePath)) {
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = fileContent.read(buffer)) != -1) {
            fos.write(buffer, 0, bytesRead);
        }
    }
    imagePath = "image/" + fileName;
}

try {
    String sql;
    PreparedStatement ps;
    if (imagePath != null) {
        sql = "UPDATE properties SET title=?, description=?, type=?, price=?, location=?, size=?, bedrooms=?, bathrooms=?, status=?, image=? WHERE id=?";
        ps = conn.prepareStatement(sql);
        ps.setString(10, imagePath);
        ps.setInt(11, id);
    } else {
        sql = "UPDATE properties SET title=?, description=?, type=?, price=?, location=?, size=?, bedrooms=?, bathrooms=?, status=? WHERE id=?";
        ps = conn.prepareStatement(sql);
        ps.setInt(10, id);
    }

    ps.setString(1, title);
    ps.setString(2, description);
    ps.setString(3, type);
    ps.setDouble(4, price);
    ps.setString(5, location);
    ps.setInt(6, size);
    ps.setInt(7, bedrooms);
    ps.setInt(8, bathrooms);
    ps.setString(9, status);

    int rowsUpdated = ps.executeUpdate();

    if (rowsUpdated > 0) {
        response.sendRedirect("manage-properties.jsp?msg=success");
    } else {
        response.sendRedirect("manage-properties.jsp?msg=error");
    }
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("manage-properties.jsp?msg=error");
}
%>