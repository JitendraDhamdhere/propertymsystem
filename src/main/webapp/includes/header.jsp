<%-- <%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #343a40;">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="image/LOGO.jpg" alt="Property Management System Logo" style="width: 100px; border-radius: 50%;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#about">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#rides">Rides</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Gallery.jsp">Gallery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Book Now</a>
                </li>
               <%
    String username = (session != null) ? (String) session.getAttribute("username") : null;
    if (username != null) {
%>
    <!-- Dropdown for logged-in user -->
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Welcome, <%= username %>
        </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
            <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
        </ul>
    </li>
<%
    } else {
%>
    <!-- Login and Register for guests -->
    <li class="nav-item">
        <a class="nav-link" href="login.jsp">Login</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="register.jsp">Register</a>
    </li>
<%
    }
%>

            </ul>
        </div>
    </div>
</nav>
 --%>
 
 
 
 