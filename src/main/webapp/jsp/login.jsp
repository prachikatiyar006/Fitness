<%@ page language="java" %>

<html>
<head>
<title>Login | Fitness Training Platform</title>

<style>
body {
  font-family: Arial, sans-serif;
  background: linear-gradient(135deg, #8e44ad, #3498db);
  height: 100vh;
  margin: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.card {
  background: white;
  padding: 30px;
  width: 350px;
  border-radius: 12px;
  box-shadow: 0 8px 20px rgba(0,0,0,0.2);
}

.card h2 {
  text-align: center;
  margin-bottom: 20px;
  color: #2c3e50;
}

label {
  font-weight: bold;
  display: block;
  margin-bottom: 5px;
}

input {
  width: 100%;
  padding: 10px;
  margin-bottom: 15px;
  border-radius: 6px;
  border: 1px solid #ccc;
}

button {
  width: 100%;
  padding: 10px;
  background: #8e44ad;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-size: 15px;
}

button:hover {
  background: #732d91;
}

.error {
  color: #e74c3c;
  text-align: center;
  margin-bottom: 10px;
}
</style>
</head>

<body>

<div class="card">
  <h2>Fitness Platform Login</h2>

  <%-- Show error message if login fails --%>
  <%
  if (request.getParameter("error") != null) {
  %>
    <div class="error">Invalid email or password</div>
  <%
  }
  %>

  <form action="<%= request.getContextPath() %>/login" method="post">
    <label>Email</label>
    <input type="email" name="email" required>

    <label>Password</label>
    <input type="password" name="password" required>

    <button type="submit">Login</button>
  </form>
</div>

</body>
</html>
