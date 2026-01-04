<%@ page import="java.sql.*,com.fitness.dao.ProgressDAO" %>
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("USER")) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
}
%>

<html>
<head>
<title>Fitness Progress Chart</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
  font-family: Arial, sans-serif;
  background: #f4f6f8;
  margin: 0;
}
.header {
  background: #2ecc71;
  color: white;
  padding: 15px 25px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header h2 {
  margin: 0;
}
.logout-btn {
  background: #e74c3c;
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 14px;
}
.logout-btn:hover {
  background: #c0392b;
}
.container {
  padding: 30px;
  display: flex;
  justify-content: center;
}
.card {
  background: white;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 6px 15px rgba(0,0,0,0.1);
  width: 700px;
}
h3 {
  margin-top: 0;
  text-align: center;
}
canvas {
  margin-top: 20px;
}
</style>
</head>

<body>

<div class="header">
  <h2>Progress Analytics</h2>
  <form action="<%= request.getContextPath() %>/logout" method="post">
    <button class="logout-btn">Sign Out</button>
  </form>
</div>

<div class="container">
  <div class="card">
    <h3>Weight Progress Over Time</h3>

    <%
    int userId = (int) session.getAttribute("userId");
    ResultSet rs = ProgressDAO.getProgressByUser(userId);

    String dates = "";
    String weights = "";

    while (rs.next()) {
        dates += "'" + rs.getDate("date") + "',";
        weights += rs.getFloat("weight") + ",";
    }
    %>

    <canvas id="progressChart"></canvas>
  </div>
</div>

<script>
const ctx = document.getElementById('progressChart');

new Chart(ctx, {
    type: 'line',
    data: {
        labels: [<%= dates %>],
        datasets: [{
            label: 'Weight (kg)',
            data: [<%= weights %>],
            borderColor: '#8e44ad',
            backgroundColor: 'rgba(142,68,173,0.1)',
            borderWidth: 3,
            tension: 0.3,
            fill: true
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: true
            }
        },
        scales: {
            y: {
                beginAtZero: false
            }
        }
    }
});
</script>

</body>
</html>
