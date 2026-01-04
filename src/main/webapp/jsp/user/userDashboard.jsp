<%@ page language="java" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("USER")) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
}
%>

<html>
<head>
<title>User Dashboard</title>
<style>
body {
  font-family: Arial, sans-serif;
  background: #f9f9f9;
  margin: 0;
}
.header {
  background: #8e44ad;
  color: white;
  padding: 20px;
}
.container {
  padding: 25px;
}
.card {
  background: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  width: 400px;
}
label {
  font-weight: bold;
}
input {
  width: 100%;
  padding: 8px;
  margin: 6px 0 12px 0;
}
button {
  background: #8e44ad;
  color: white;
  padding: 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
button:hover {
  background: #732d91;
}
</style>
</head>

<body>

<div class="header">
  <h2>User Dashboard</h2>
  <form action="<%= request.getContextPath() %>/logout" method="post">
    <button class="logout-btn">Sign Out</button>
  </form>
</div>

<div class="container">
  <div class="card">
    <h3>Track Fitness Progress</h3>

    <form action="<%= request.getContextPath() %>/user/progress" method="post">
      <label>Weight</label>
      <input type="text" name="weight" required>

      <label>Measurements</label>
      <input type="text" name="measurements" required>

      <button type="submit">Update Progress</button>
    </form>
  </div>
</div>

</body>
</html>
