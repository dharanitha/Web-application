<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<style type="text/css">
body{
                background-image: url("images/login\ background.jpg");
                background-repeat: no-repeat;
                background-size: 100% 100%;
                font-family: Arial, Helvetica, sans-serif;
                background-color: white;
                display: flex;
                min-height: 100vh;
                justify-content: center;
            }

#container {
  width: 840px;
  margin: 25px auto;
  margin-top: 100px;
  margin-left:500px;
}
.signup {
  float: left;
  width: 250px;
  padding: 30px 20px;
  background-color: white;
  text-align: center;
  border-radius: 5px 0 0 5px;
}
[type=text],[type=email],[type=number],[type=password],select,option {
  display: block;
  margin: 0 auto;
  width: 80%;
  border: 0;
  border-bottom: 1px solid rgba(0,0,0,.2);
  height: 45px;
  line-height: 45px;  
  margin-bottom: 10px;
  font-size: 1em;
  color: black;
}
[type=submit] {
  margin-top: 25px;
  width: 80%;
  border: 0;
  background-color: #0080FF;
  border-radius: 5px;
  height: 50px;
  color: white;
  font-weight: 400;
  font-size: 1em;
}
[type='text']:focus {
  outline: none;
  border-color: #53CACE;
}
h1{
  color: red;
  font-weight: 900;
  font-size: 2.5em;
}
p{
  color: rgba(0,0,0,.6);
  font-size: 1.2em;
  margin: 50px 0 50px 0;
}

p:nth-of-type(2) {
  font-size: 1em;
}
</style>
<script type="text/javascript" src="valid.js"></script>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <h2>Login</h2>
  <form action="Login" method="post">
  <%
  String message=request.getParameter("message");
  if("notexist".equals(message)){
  %>
  <h3 class="alert"> Incorrect Username or Password </h3>
  <%} %>
  <%
  if("invalid".equals(message)){
  %>
  <h3 class="alert">Some thing Went Wrong! Try Again !</h3>
  <%} %>
  <%
	String alertMessage=request.getParameter("alertMessage");
	if("success".equals(alertMessage)){
	%>
	<h3 class="alert">Logout Successfully!</h3>
	<%} %>
  <input type="text" id="username" name="username" placeholder="Enter username here">
  <input type="password" id="password" name="password" placeholder="Enter password here">
  <input type="submit" value="Login" onclick="loginvalidation()">
  </form>
      <h2><a href="SignUp.jsp">SignUp</a></h2>
       <h2><a href="forget password.jsp">Forgot Password?</a></h2>
  </div>
</div>
</body>
</html>