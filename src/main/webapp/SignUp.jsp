<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<style>
body{
                background-image: url("images/signup\ background.jpg");
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
  margin-top: 50px;
}
.whysign {
  float: left;
  background-color: none;
  width: 480px;
  height: 473px;
  border-radius: 0 5px 5px 0;
  padding-top: 20px;
  padding-right: 20px;
}
.whysignLogin
{
	float: left;
	background-color: white;
	width: 480px;
	height: 347px;
	border-radius: 0 5px 5px 0;
	padding-top: 20px;
	padding-right: 20px;
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
<script type="text/javascript" src="Valid.js"></script>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="SignUp" method="post">
  <input type="text" name="username" id="name" placeholder="Enter username here">
  <input type="text" name="email" id="email" placeholder="Enter emailid here">
  <input type="password" name="password" id="password" placeholder="Enter password here">
  <input type="password" name="re-password" id="re-password" placeholder="Enter re-password here">
  <input type="text" name="phonenumber" id="phonenumber" placeholder="Enter phonenumber here">
  <input type="submit" value="Signup" onclick="validation()">
  </form>
      <h2><a href="Login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
  String message=request.getParameter("message");
  if("valid".equals(message)){
  %>
  <h1>Successfully account created!</h1>
  <%} %>
  <%
  if("invalid".equals(message)){
  %>
  <h1>Some thing Went Wrong! Try Again !</h1>
  <%} %>
  </div>
</div>

</body>
</html>