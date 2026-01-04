<%@ page language="java" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("ADMIN")) {
    //response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
}
%>

<html>
<head>
<title>Admin Dashboard</title>
<style>
body {
  font-family: Arial, sans-serif;
  background: #f4f6f8;
  margin: 0;
}
.header {
  background: #2c3e50;
  color: white;
  padding: 20px;
}
.container {
  padding: 25px;
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}
.card {
  background: white;
  width: 280px;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
.card h3 {
  margin-top: 0;
  color: #2c3e50;
}
.card p {
  color: #555;
}
a.button {
  display: inline-block;
  margin-top: 10px;
  padding: 10px 15px;
  background: #3498db;
  color: white;
  text-decoration: none;
  border-radius: 5px;
}
a.button:hover {
  background: #2980b9;
}
</style>
</head>

<body>

<div class="header">
  <h2>Admin Dashboard</h2>
  <form action="<%= request.getContextPath() %>/logout" method="post">
    <button class="logout-btn">Sign Out</button>
  </form>
</div>

<div class="container">

  <div class="card">
    <h3>User Management</h3>
    <p>Manage platform users and assign roles.</p>
    <a class="button" href="manageUsers.jsp">Go</a>
  </div>

  <div class="card">
    <h3>Workout Approvals</h3>
    <p>Review workout plans submitted by trainers.</p>
    <a class="button" href="manageWorkouts.jsp">Open</a>
  </div>

  <div class="card">
    <h3>System Overview</h3>
    <p>View and control system-level settings.</p>
    <a class="button" href="#">View</a>
  </div>

</div>

</body>
</html>
