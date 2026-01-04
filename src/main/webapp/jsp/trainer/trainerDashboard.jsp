<%@ page language="java" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("TRAINER")) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
}
%>

<html>
<head>
<title>Trainer Dashboard</title>
<style>
body { font-family: Arial; background:#eef2f3; margin:0; }
.header { background:#27ae60; color:white; padding:15px; }
.container { padding:20px; }
.card {
  background:white;
  padding:20px;
  border-radius:8px;
  box-shadow:0 2px 6px rgba(0,0,0,0.1);
  width:400px;
}
input, textarea {
  width:100%;
  padding:8px;
  margin:6px 0;
}
button {
  background:#27ae60;
  color:white;
  padding:10px;
  border:none;
  border-radius:5px;
}
</style>
</head>

<body>
<div class="header">
  <h2>Trainer Dashboard</h2>
  <form action="<%= request.getContextPath() %>/logout" method="post">
    <button class="logout-btn">Sign Out</button>
  </form>
</div>

<div class="container">

  <div class="card">
    <h3>Create Workout Plan</h3>
    <form action="<%= request.getContextPath() %>/trainer/createPlan" method="post">
      <label>Title</label>
      <input type="text" name="title" required>

      <label>Description</label>
      <textarea name="description" rows="4" required></textarea>

      <button type="submit">Create Plan</button>
    </form>
  </div>

</div>
</body>
</html>
