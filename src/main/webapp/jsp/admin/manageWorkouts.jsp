<%@ page import="java.sql.*,com.fitness.dao.WorkoutPlanDAO" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("ADMIN")) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
}
%>

<html>
<head>
<title>Workout Approvals</title>
<style>
body {
  font-family: Arial, sans-serif;
  background: #f4f6f8;
  margin: 0;
}
.header {
  background: #34495e;
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
}
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 15px;
}
th, td {
  padding: 12px;
  text-align: left;
}
th {
  background: #ecf0f1;
}
tr:nth-child(even) {
  background: #f9f9f9;
}
button {
  padding: 6px 12px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
.approve {
  background: #2ecc71;
  color: white;
}
.reject {
  background: #e74c3c;
  color: white;
}
button:hover {
  opacity: 0.85;
}
</style>
</head>

<body>

<div class="header">
  <h2>Pending Workout Plans</h2>
  <form action="<%= request.getContextPath() %>/logout" method="post">
    <button class="logout-btn">Sign Out</button>
  </form>
</div>

<div class="container">
  <div class="card">

    <table>
      <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Action</th>
      </tr>

      <%
      ResultSet rs = WorkoutPlanDAO.getPendingPlans();
      while (rs.next()) {
      %>
      <tr>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("description") %></td>
        <td>
          <form action="<%= request.getContextPath() %>/admin/approveWorkout" method="post" style="display:inline;">
            <input type="hidden" name="planId" value="<%= rs.getInt("plan_id") %>">
            <button class="approve" name="action" value="APPROVED">Approve</button>
            <button class="reject" name="action" value="REJECTED">Reject</button>
          </form>
        </td>
      </tr>
      <% } %>
    </table>

  </div>
</div>

</body>
</html>
