<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="DatabaseConnection.DataConnection"%>
<%@page import="java.sql.*"%>
<%@page import="com.DAO.ProductDAOImplement"%>
<%@page import="UserInterface.Product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<title>Home</title>
<style>
    body {
  font-family: "Open Sans", sans-serif;
  line-height: 1.25;
  background-color: #0080FF;
}

a
{
	text-decoration: none;
}
.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
}
 .btn{
                margin-top: 1rem;
                display: inline-block;
                padding: 1.2rem 3.4rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid var(--black);
                color: var(--black);
                cursor: pointer;
                background: none;
            }
            .btn:hover{
                background: var(--orange);
                color: #fff;
            }
table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  /margin-left: 5%;/
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}

/Header Css/
* {box-sizing: border-box;}
    
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    

/footer/
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color:#ccc;
   color:black;
   text-align: center;
}





.input-style {
  width: 90%;
  padding: 12px 20px;
  margin-left:5%;
  box-sizing: border-box;
  border: none;
  background-color:white;
  color: black;
  font-size: 16px;
}

input[type=text]:focus, textarea:focus,button:focus{
  outline: 4px solid orange;
  background-color:rgb(224, 255, 219);     /* oranges! yey */
}

.button {
  background-color: aqua;
  border: none;
  color: black;
  padding: 12px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-left:5%;
  font-size: 16px;
  width: 90%;
   border-radius: 25px;
}

.button:hover {
  background-color: #555555;
  color: white;
}

hr
{
	width: 90%
}
h3
{
	text-align: center;
	color: white;
}
.alert
{
	color:yellow;
}

.profile-style
{
	border-style: dotted;
	
}

.left-div
{
	width: 50%;
	display:inline-block;
}

.right-div
{
	float:right;
	width: 50%;
	display:inline-block;
}
</style>
</head>
<body>
<br>
<table>
<thead>
<%String user=(String)session.getAttribute("username"); 
int total=0;
int productId=0;
try{
	Connection connection=DataConnection.databaseConnection();
	Statement statement=connection.createStatement();
	ResultSet resultset=statement.executeQuery("select sum(TotalPrice) from cart");
	while(resultset.next()){
		total=resultset.getInt(1);
	}
%>
          <tr>
          <th scope="col"><a href="Checkout.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.println(total); %></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">Product Id</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Total</th>
          </tr>
        </thead>
        <tbody>
        <%
        ResultSet resultSet=statement.executeQuery("select * from cart");
        while(resultSet.next()){%>
          <tr>
          <%productId=productId+1; %>
           <td><%out.println(productId); %></td>
            <td><%=resultSet.getString(4) %></td>
            <td><%=resultSet.getString(5) %></td>
            <td><%=resultSet.getString(6) %></td>
            <td><%=resultSet.getString(7) %></td>
            </tr>
         <%} 
        ResultSet result=statement.executeQuery("select * from user where username='"+user+"'");
        while(result.next()){
         %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="order" method="post">
<input type="hidden" id="id" value="<%=result.getString(1) %>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" id="name" placeholder="Name" value="<%=result.getString(2) %>">
 </div>
 <div class="right-div">
 <h3>Enter Email</h3>
<input class="input-style" type="text" id="email" placeholder="Email" value="<%=result.getString(3) %>">
 </div>
 <div class="left-div">
 <h3>Enter Phone Number</h3>
<input class="input-style" type="number" id="phonenumber" placeholder="Phonenumber" value="<%=result.getString(6) %>">
 </div>
 <div class="right-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" id="address" placeholder="Address" value="<%=result.getString(7) %>">
 </div>

<div class="left-div">
<h3>Enter City</h3>
<input class="input-style" type="text" id="city" placeholder="City" value="<%=result.getString(8) %>">
</div> 

<div class="right-div">
<h3>Enter State</h3>
<input class="input-style" type="text" id="state" placeholder="State" value="<%=result.getString(9) %>">
</div>

<div class="left-div">
<h3>Enter Pincode</h3>
<input class="input-style" type="number" id="pincode" placeholder="Pincode" value="<%=result.getString(10) %>">
</div>
<div class="right-div">
<h3>Payment Mode</h3>
<select class="input-style" name="payment">
<option value="select">Select</option>
<option value="Cash On Delivery">Cash on delivery</option>
</select>
</div>
<div class="left-div">
<h3>Card Name</h3>
<input class="input-style" type="text" id="cardName" placeholder="Card Name">
</div>
<div class="right-div">
<h3>Card Number</h3>
<input class="input-style" type="number" id="cardNumber" placeholder="Card Number">
</div>
<div class="left-div">
<h3>Expiry Month</h3>
<input class="input-style" type="number" id="month" placeholder="Month" >
</div>
<div class="right-div">
<h3>Expiry Year</h3>
<input class="input-style" type="number" id="year" placeholder="Year" >
</div>
<div class="left-div">
<h3>CVV</h3>
<input class="input-style" type="number" id="cvv" placeholder="CVV">
</div>
<div class="right-div">
<button class="button" type="submit">Submit</button>
</div>
<%} %>
<%}
		catch(Exception e){
			System.out.println(e);
		}%>
      <br>
      <br>
      <br>
</form>
</body>
</html>