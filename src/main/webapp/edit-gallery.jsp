<%@ page import="java.sql.*"%>
<%@ include file="includes/connect.jsp"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
PreparedStatement ps = conn.prepareStatement("SELECT * FROM gallery WHERE id = ?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
%>
<form action="update-gallery.jsp" method="post">
	<input type="hidden" name="id" value="<%=id%>"> <label>Alt
		Text:</label> <input type="text" name="alt_text"
		value="<%=rs.getString("alt_text")%>">
	<button type="submit">Update</button>
</form>
