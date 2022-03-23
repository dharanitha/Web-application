<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.CartDAOImplement"%>
<%@page import="UserInterface.User"%>
<%@page import="UserInterface.Cart"%>
<%@page import="DatabaseConnection.DataConnection"%>
<%@page import="java.net.http.HttpClient.Redirect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: Arial;
                font-size: 17px;
                padding: 8px;
            }
            h2{
                text-align:center;
            }
            *{
                box-sizing: border-box;
            }
            .container-cart{
            	width:100%;
            	margin-bottom:2%;
            	background-color: #FFFFFF;
                padding: 3px 18px 13px 18px;
                border: 1px solid lightgrey;
                border-radius: 3px;
                box-shadow: 0 0 2rem 0 rgba(168, 180, 194, 0.37);
            }
            table{
            	font-family:Arial;
            	border-collapse:collapse;
            	width:100%;
            }
            td,th{
            	align-items:center;
            	border:1px solid #ddd;
            	margin-left:2%;
            	padding:8px;
            }
            tbody:nth-child(even){
            	background-color:#fff;
            }
            .cart-total {
                text-align: end;
                margin-top: 10px;
                margin-right: 10px;
            }
            .cart-total-title {
                font-weight: bold;
                font-size: 1rem;
                color: black;
                margin-right: 20px;
            }
            .cart-total-price {
                color: #333;
                font-size: 1rem;
            }
            .error {
                color: red;
                border-color: red;
            }
            .row {
                display: -ms-flexbox;
                display: flex;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin: 0 -10px;
            }
            .col-50 {
                -ms-flex: 50%;
                flex: 50%;
            }
            .col-75 {
                -ms-flex: 75%;
                flex: 75%;
            }
            .col-50,.col-75 {
                padding: 0 16px;
            }
            .container {
                background-color: #FFFFFF;
                padding: 3px 18px 13px 18px;
                border: 1px solid lightgrey;
                border-radius: 3px;
                box-shadow: 0 0 2rem 0 rgba(168, 180, 194, 0.37);
            }
            input[type=text],[type=number] {
                width: 100%;
                margin-bottom: 20px;
                padding: 12px;
                border: 1px solid rgb(130, 26, 26);
                border-radius: 1px;
            }
            label {
                margin-bottom: 10px;
                display: block;
            }
            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
            }
            .btn{
                margin-top: 1rem;
                margin-left:45%;
                display: inline-block;
                padding: 1rem 1.9rem;
                font-size: 1rem;
                align-items: center;
                border-radius: .1rem;
                border: .2rem solid black;
                color: black;
                cursor: pointer;
                background: none;
            }
            .btn:hover{
                background: orange;
                color: #fff;
            }
            .btn-remove{
                margin-top:2%;
                padding:.90rem 1.5rem;
                display: inline-block;
                margin-left:38%;
                font-size: 1rem;
                align-items: center;
                border-radius: .5rem;
                border: .1rem;
                color: white;
                cursor: pointer;
                background: red;
            }
            .btn:hover{
                background: orange;
                color: #fff;
            }
            .alert
			{
				color:black;
				font-size:25px;
				margin-left:40%;
				margin-top:2%;
			}

            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .col-25 {
                    margin-bottom: 20px;
                }
            }
        </style>
        <script type="text/javascript" src="checkout validation.js"></script>
</head>
<body>
<%String user=(String)session.getAttribute("username"); %>
<%if(user==null){ %>
<%response.sendRedirect("Login.jsp"); %>
<%} %>
				<div class="container-cart">
                    <h2 class="section-header">Your selected item</h2>
                    <%
				  String message=request.getParameter("message");
				  if("valid".equals(message)){
				  %>
				  <h3 class="alert"> Product removed from cart </h3>
				  <%} %>
				  <%
				  if("invalid".equals(message)){
				  %>
				  <h3 class="alert">Some thing Went Wrong! Try Again !</h3>
				  <%} %>
                    <div class="cart-row">
                        <table>
                        <thead>
                        	<tr>
                        	<th>Product Name</th>
                        	<th>Category</th>
                        	<th>Price</th>
                        	<th>Action</th>
                        	</tr>
                        </thead>
                        <tbody>
                        <%
                        User u=new User();
                        u.setId(1);
                        CartDAOImplement cartDAO=new CartDAOImplement(DataConnection.databaseConnection());
                        List<Cart> listCart=cartDAO.getProductByUser(u.getId());
                        Double totalPrice=0.000;
                        for(Cart cart:listCart){
                        	totalPrice=cart.getTotalPrice();
                        %>
                        	<tr>
                        	<td><%=cart.getProductName() %></td>
                        	<td><%=cart.getCategory() %></td>
                        	<td>Rs.<%=cart.getPrice() %></td>
                        	<td><a href="remove_product?productId=<%=cart.getProductId() %>" class="btn-remove">Remove</a></td>
                        	</tr>
                        <%} %>
                        	
                        </tbody>
                        </table>
                    </div>
                    <div class="cart-items"></div>
                    <div class="cart-total">
                        <strong class="cart-total-title">Total</strong>
                        <span class="cart-total-price">Rs.<%=totalPrice%></span>
                    </div>
                    <a href="Payment.jsp" class="btn btn-primary btn-purchase" type="button">checkout</a>
               </div>
</body>
</html>