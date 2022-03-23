<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="UserInterface.User"%>
<%@page import="DatabaseConnection.DataConnection"%>
<%@page import="com.DAO.ProductDAOImplement"%>
<%@page import="com.DAO.UserDAOImplement"%>
<%@page import="UserInterface.Product" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
            :root{
                --green:green;
                --orange:orange;
                --pink:pink;
                --skyblue:skyblue;
                --black:#130f40;
                --light-color:#666;
                --box-shadow:0 .5rem 1rem rgba(0,0,0,.1);
                --border:2rem solid rgba(0,0,0,.1);
                --outline:.1rem solid rgba(0,0,0,.1);
                --outline-hover:.2rem solid var(--black);
            }
            *{
                font-family: sans-serif;
                margin: 0; padding: 0;
                box-sizing: border-box;
                text-transform: capitalize;
                outline: none;
                border: none;
                text-decoration:none;
                transition: all .2s linear;
            }
            *::selection{
                background: var(--green);
                color: #fff;
            }
            .section-header {
                color: black;
                font-weight: bolder;
                text-align: center;
                font-size: 3rem;
            }
            .section-header span{
                background: var(--orange);
                color: #fff;
                display: inline-block;
                padding: .5rem 3rem;
                clip-path: polygon(100% 0,93% 50%,100% 99%,0% 100%,7% 50%,0% 0%);
            }
            html{
                font-size: 62.5%;
                overflow-x: hidden;
                scroll-behavior: smooth;
                scroll-padding-top: 7rem;
            }
            section{
                padding: 2rem 9%;
            }
            .heading{
                text-align: center;
                font-size: 3rem;
                padding-bottom: 3rem;
                color: black;
            }
            .heading span{
                background: var(--orange);
                color: #fff;
                display: inline-block;
                padding: .5rem 3rem;
                clip-path: polygon(100% 0,93% 50%,100% 99%,0% 100%,7% 50%,0% 0%);
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
            .btn-login{
                margin-top: 1rem;
                display: inline-block;
                padding: 1rem 2rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid black;
                color: black;
                cursor: pointer;
                background: white;
            }
            .btn-login:hover{
                background: #666;
                color: #fff;
            }
            .btn-signup{
                margin-top: 1rem;
                display: inline-block;
                padding: 1.2rem 2rem;
                font-size: 1.7rem;
                align-items: center;
                border-radius: .5rem;
                border: .2rem solid black;
                color: white;
                cursor: pointer;
                background: orange;
            }
            .btn-signup:hover{
                background: #666;
                color: #fff;
            }
            
            .header,.header1{
                display: flex;
                font-size: 1.5rem;
                align-items: center;
                justify-content: space-between;
                padding: 2rem 9%;
                background: var(--green);
            }
            .header1{
                background: var(--orange);
                box-shadow: 0 .4rem 1rem rgba(0, 0, 0, .1);
                position: relative;
                z-index: 10000;
            }
            .header .logo{
                font-weight:bolder;
                font-size: 3rem;
                color: black;
            }
            .header .logo p{
                color: black;
                font-size: 3rem;
                font-family: sans-serif;
            }
            .header .search-bar-container{
                display: flex;
                align-items: center;
                width: 40rem;
                padding: 1.5rem;
                background: rgb(180, 178, 178);
                border-radius: .5rem;
                
            }
            .header .search-bar-container #search-bar{
                width: 100%;
                background: none;
                text-transform: none;
                color: black;
                font-size: 1.7rem;
            }
            .header .search-bar-container #search-bar::placeholder{
                text-transform: capitalize;
                color: wheat;
            }
            .header .search-bar-container label{
                color: black;
                cursor: pointer;
                font-size: 2rem;
                padding: 0 .5rem;
            }
            .header .search-bar-container label:hover{
                color:yellow;
            }
            .header1 .navbar a{
                color:#333;
                font-size: 2rem;
                margin-right: 2rem;
            }
            .header1 .icons a{
                color: #666;
                font-size: 2.5rem;
                margin-left: 2rem;
            }
            .header1 a:hover{
                color: var(--skyblue);
            }
            .form-popup {
                display: none;
                position: fixed;
                top: 200px;
                right: 15px;
                border: 3px solid #f1f1f1;
                z-index: 9;
            }
            .form-container {
                max-width: 300px;
                padding: 10px;
                background-color: white;
            }
            .form-container input[type=text], .form-container input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }
            .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }
            .form-container .btn {
                height: 5.5rem;
                display: inline-block;
                align-items: center;
                margin-top: 1rem;
                border: .2rem solid var(--black);
                background: none;
                color: var(--black);
                padding: 2rem 3rem;
                cursor: pointer;
                font-size: 1.7rem;
            }
            .form-container .btn:hover{
                background: var(--orange);
                color: #fff;
            }
            .form-container .cancel {
                background-color: none;
            }
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
            #menu-bar{
                font-size:3rem;
                color:#666;
                border:.1rem solid #666;
                border-radius: .5rem;
                padding: .5rem 1.5rem;
                cursor: pointer;
                display: none;
            }
            .modal-logout {
                display: none;
                position: fixed;
                z-index: 1; 
                left: 0;
                top: 0;
                width: 100%;
                height: 100%; 
                overflow: auto;
                background-color: rgb(0,0,0); 
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content-logout {
                background-color: #fefefe;
                margin: 15% auto; 
                padding: 100px;
                border: 1px solid #888;
                width: 50%;
            }
            .modal-content-logout h2{
            	text-align:center;
            	font-size:40px;
            	margin-top:-2%;
            }
            .modal-content-logout .btn{
            	align-items: center;
            	margin: 40px auto 80px auto;
            }
            .close-logout {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close-logout:hover,.close-logout:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .btn-close{
            	margin-top: 1%;
            	margin-left:24%;
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
            .btn-close:hover{
                background: var(--orange);
                color: #fff;
            }
            .btn-logout{
            	margin-top: 1%;
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
            .btn-logout:hover{
                background: var(--orange);
                color: #fff;
            }
            .home{
                display: flex;
                align-items: center;
                justify-content: left;
                background: url(images/home.jpg) no-repeat;
                background-position: center;
                background-size: cover;
                padding-top: 15rem;
                padding-bottom: -10rem;
            }
            .home .content{
                text-align: left;
                width: 60rem;
            }
            .home .content h3{
                color: black;
                font-size: 3rem;
            }
            .home .content p{
                color: black;
                font-size: 1.7rem;
                padding: 1rem 0;
                line-height: 1.8;
            }
            .about .row{
                display: flex;
                align-items: center;
                gap:2rem;
                flex-wrap: wrap;
                padding: 2rem 0;
                padding-bottom: 3rem;
            }
            .about .row .video-container{
                flex:1 1 40rem;
                position: relative;
                
            }
            .about .row .video-container video{
                width: 100%;
                border: 1.5rem solid #fff;
                border-radius: .5rem;
                box-shadow: 0.5rem 1rem rgba(0,0,0,.1,);
                background-image: url("images/flower.mp4");
            }
            .about .row .video-container h3{
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                font-size: 3rem;
                background: gray;
                width: 100%;
                padding: 1rem 2rem;
                text-align: center;
                mix-blend-mode: screen;
            }
            .about .row .content{
                flex: 1 1 40rem;
            }
            .about .row .content h3{
                font-size: 3rem;
                color: #333;
            }
            .about .row .content p{
                font-size: 1.5rem;
                color: #999;
                padding: 5rem 0;
                padding-top: 1rem;
                line-height: 1.5;
            }
            .about .row .content .icons-container{
                display: flex;
                gap: 1rem;
                flex-wrap: wrap;
                padding: 1rem 0;
                margin-top: .5rem;
            }
            .about .row .content .icons-container .icons{
                background: #eee;
                border-radius: .5rem;
                border: .1rem solid rgba(0, 0, 0, .2);
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 1rem;
                flex: 1 1 17rem;
                padding: 1rem 1rem;
            }
            .about .row .content .icons-container .icons i{
                font-size: 3.5rem;
                color: var(--green);
            }
            .about .row .content .icons-container .icons span{
                font-size: 1.5rem;
                font-weight: bolder;
                color: black;
            }
            
            .banner-container{
                display: flex;
                flex-wrap: wrap;
                gap: 1.5rem;
                align-items:center;
            }
            .banner-container .banner{
                flex: 1 1 30rem;
                height: 25rem;
                border: .1rem solid rgba(0, 0, 0, .3);
                box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .1);
                overflow: hidden;
                position: relative;
            }
            .banner-container .banner .content{
                position: absolute;
                top: 50%; left: 4%;
                transform: translateY(-50%);
            }
            .banner-container .banner img{
                height: 100%;
                width: 100%;
                object-fit: cover;
            }
            .banner-container .banner .content span{
                color: #666;
                font-size: 1.7rem;                
            }
            .banner-container .banner .content h3{
                color: #333;
                font-size: 3rem;
            }
            .banner-container .banner:hover img{
                transform: scale(1.2);
            }
            .category .box-container{
                display: flex;
                flex-wrap: wrap;
                gap: 1.5rem;
            }
            .category .box-container .box{
                flex:1 1 30rem;
                box-shadow: 0.5rem 1.5rem rgba(0,0,0,.1,);
                border-radius: .5rem;
                border: .1rem solid rgba(0,0,0,.1,);
                height: 35rem;
                position: relative;
                overflow: hidden;
            }
            .category .box-container .box img{
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .category .box-container .box .content{
                position: absolute;
                bottom: -5 rem;
                background: #fff;
                border-top: 0 solid rgba(0, 0, 0, .3);
                text-align: center;
                padding: .5rem 0;
                width: 100%;
            }
            .category .box-container .box:hover .content{
                bottom: 0;
            }
            .category .box-container .box .content h3{
                color: black;
                font-weight:bolder;
                font-size: 2rem;,
                padding: .5rem 0;
            }
            .shop-item {
                margin: 30px;
            }
            .shop-item-title {
                display: block;
                width: 100%;
                text-align: center;
                font-weight: bold;
                font-size: 2.3rem;
                color: #333;
                margin-bottom: 15px;
            }
            .shop-item-image {
                height: 250px;
            }
            .shop-item-details {
                display: flex;
                align-items: center;
                padding: 5px;
            }
            .shop-item-category{
            	display: block;
                width: 100%;
                text-align: center;
                font-size: 1.5rem;
                color: #333;
                margin-bottom: 15px;
            }
            .shop-item-price {
                flex-grow: 1;
                font-size: 2rem;
                color: #333;
            }
            .shop-item-price span{
                font-size: 1.1rem;
            }
            .shop-items {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
            }
            .cart-header {
                font-weight: bold;
                font-size: 1.25em;
                color: #333;
            }
            .cart-column {
                display: flex;
                align-items: center;
                border-bottom: 1px solid black;
                margin-right: 1.5em;
                padding-bottom: 10px;
                margin-top: 10px;
            }
            .cart-row {
                display: flex;
            }
            .cart-row span i{
                font-size: 3rem;
                color: crimson;
            }
            .cart-row span{
                font-size: 2.3rem;
                color: darkcyan;
            }
            .cart-item {
                font-size: 2rem;
                width: 45%;
            }
            .cart-price {
                width: 20%;
                font-size: 2rem;
                color: #333;
            }
            .cart-quantity {
                font-size: 2rem;
                width: 35%;
            }
            .cart-item-title {
                color: #333;
                margin-left: .5em;
                font-size: 1.2em;
            }
            .cart-item-image {
                width: 75px;
                height: auto;
                border-radius: 10px;
            }
            .btn-danger {
                color: white;
                background-color: #EB5757;
                border: none;
                border-radius: .3em;
                font-weight: bold;
            }
            .btn-danger:hover {
                background-color: #CC4C4C;
            }
            .cart-quantity-input {
                height: 34px;
                width: 50px;
                border-radius: 5px;
                border: 1px solid #56CCF2;
                background-color: #eee;
                color: #333;
                padding: 0;
                text-align: center;
                font-size: 1.4rem;
                margin-right: 25px;
            }
            .cart-row:last-child {
                border-bottom: 1px solid black;
            }
            .cart-row:last-child .cart-column {
                border: none;
            }
            .cart-total {
                text-align: end;
                margin-top: 10px;
                margin-right: 10px;
            }
            .cart-total-title {
                font-weight: bold;
                font-size: 2rem;
                color: black;
                margin-right: 20px;
            }
            .cart-total-price {
                color: #333;
                font-size: 2rem;
            }
            .btn-purchase {
                display: block;
                margin: 40px auto 80px auto;
                font-size: 1.75em;
            }
            .cart {
                display: none;
                position: fixed;
                z-index: 1; 
                left: 0;
                top: 0;
                width: 100%;
                height: 100%; 
                overflow: auto;
                background-color: rgb(0,0,0); 
                background-color: rgba(0,0,0,0.4);
            }
            .cart-content {
                background-color: #fefefe;
                margin: 15% auto; 
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }
            .cart-close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .cart-close:hover,.cart-close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .contact .row{
                display: flex;
                flex-wrap: wrap;
                gap: 1.5rem;
            }
            .contact .row form{
                flex: 1 1 40rem;
                padding: 2rem 2.5rem;
                box-shadow: 0.5rem 1.5rem rgba(0,0,0,.1,);
                border: .1rem solid rgba(0,0,0,.1,);
                background: #fff;
                border-radius: .5rem;
            }
            .contact .row .image{
                flex: 1 1 40rem;
            }
            .contact .row ,image img{
                width: 100%;
            }
            .contact .row form .box{
                padding: 1rem;
                font-size: 1.7rem;
                color: #333;
                text-transform: none;
                border: .1rem solid gray;
                border-radius: .5rem;
                margin: .7rem 0;
                width: 100%;
            }
            .contact .row form .box:focus{
                border-color: var(--skyblue);
            }
            .contact .row form textarea{
                height: 15rem;
                resize: none;
            }
            .footer .box-container{
                display: flex;
                flex-wrap: wrap;
                gap: 1rem;
            }
            .footer .box-container .box{
                flex: 1 1 25rem;
            }
            .footer .box-container .box h3{
                color: black;
                font-size: 2.5rem;
                padding: 1rem 0;
            }
            .footer .box-container .box a{
                display: block;
                color: black;
                font-size: 1.5rem;
                padding: 1rem 0;
            }
            .footer .box-container .box a:hover{
                color: var(--green);
                text-decoration: underline;
            }
            .footer .icon-container {
                margin-bottom: 25px;
                padding: 8px 0;
                font-size: 24px;
            }
            .footer .credit{
                text-align: center;
                padding: 1.5rem;
                margin-top: 1.5rem;
                padding-top: 2.5rem;
                font-size: 2rem;
                color: black;
                border-top: .1rem solid rgba(0,0,0,.1,);
            }
            .footer .credit span{
                color: var(--orange);
            }            
            
            
            
            
            
            /* media queries */
            @media(max-width:1200px){
                html{
                    font-size: 55%;
                }
            }
            @media(max-width:991px){
                .header,.header1{
                    padding: 2rem;
                }
                section{
                    padding: 2rem 9%;
                }
            }
            @media(max-width:768px) {
                #menu-bar{
                    display: initial;
                }
                .header1 .navbar{
                    position: absolute;
                    top: 100%; left: 0; right: 0;
                    background: #eee;
                    padding: 1rem 2rem;
                    border-top: .1rem solid rgba(0, 0, 0, .3);
                    clip-path: polygon(0 0, 100% 0,100% 0,0 0);
                }
                .header .navbar .active{
                    clip-path: polygon(0 0, 100% 0,100% 100%,0% 100%);
                }
                .header1 .navbar a{
                    display: block;
                    margin: 1.5rem 0;
                    padding: 1.5rem;
                    border-radius: .5rem;
                    border: .1rem solid rgba(0, 0, 0, .3);
                    background: #fff;
                    text-align: center;
                }
                .header{
                    flex-flow: column;
                }
                .header .search-bar-container{
                    width: 100%;
                    margin-top: 2rem;
                }
            }
            @media(max-width:450px){
                html{
                    font-size: 50%;
                }
                .heading{
                    font-size: 2.5rem;
                }
            }
</style>
<script type="text/javascript" src="valid.js"></script>
</head>
<body> 
<header>
<%String user=(String)session.getAttribute("username"); %>
            <div class="header">                       
                <a href="#" class="logo"><i class="fas fa-user" id="demo"></i> Welcome <%out.println(user); %>!</a>
                <form action="" class="search-bar-container">
                    <input type="search" id="search-bar" placeholder="search here...">
                    <label for="search-bar" class="fas fa-search"></label>
                </form>
                <%
					if(user!=null){
					%>
					<a href="#" class="btn-login"><i class="fas fa-user"></i> <%out.println(user); %></a>
					<a href="#" class="btn-signup" id="myBtn" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Logout</a>
					<% }%>
					<%
					if(user==null){
						%>
						<a href="Login.jsp" class="btn-login"><i class="fas fa-sign-in-alt"></i> Login</a>
						<a href="SignUp.jsp" class="btn-signup"><i class="fas fa-user-plus"></i> SignUp</a>
						<% }%>
               </div>
               <div id="modal-logout" class="modal-logout">
	            <div class="modal-content-logout">
	                <span class="close-logout">&times;</span>
	                    <h2>You want to Logout</h2>
	                    <button class="btn-close" type="button">Close</button>
	                    <a href="logout" type="button" class="btn-logout">Logout</a>
	            </div>
	            </div>
            <div class="header1">
                <div id="menu-bar" class="fas fa-bars"></div>
                <nav class="navbar">
                    <a href="#home">home</a>
                    <a href="#about">about</a>
                    <a href="#category">category</a>
                    <a href="#product">product</a>
                    <a href="#contact">contact</a>
                </nav>
                <div class="icons">
                	<a href="#" class="fas fa-heart"></a>
                    <a href="Checkout.jsp" class="fas fa-shopping-cart" id="cartBtn" onclick="cart()"></a>
                    <a href="#" class="fas fa-user" onclick="openForm()"></a>
                </div>
                <div class="form-popup" id="myForm">
                    <form action="" class="form-container">
                        <h1>Login</h1>
                        <label for="email"><b>Email</b></label>
                        <input type="text" placeholder="Enter Email" name="email" required>
                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" required>
                        <button type="submit" class="btn">Login</button>
                        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                    </form>
                </div>
            </div>
        </header>
        <section class="home" id="home">
            <div class="content">
                <h3>Fresh and <span>colourful</span> flowers and pots</h3>
                <p>A flower bouquet is a collection of flowers in a creative arrangement. Flower bouquets can be arranged for the decor of homes or public buildings, or may be handheld. Handheld bouquets are classified by several different popular shapes and styles.Flower bouquets are often given for special occasions such as birthdays, anniversaries or funerals.</p>
                <a href="#product" class="btn">shop now</a>
            </div>
        </section>
        <section class="about" id="about">
            <h1 class="heading"><span>about</span></h1>
            <div class="row">
                <div class="video-container">
                    <video src="images/flower.mp4" loop autoplay muted></video>
                    <h3>best flower sellers</h3>
                </div>
                <div class="content">
                    <h3>why choose us?</h3>
                    <p>Flowers have many powers beyond beauty and emotions. Withholding many meanings and sentiments, they have been known to help cure medical diseases for many centuries now. Some flowers are known to fight against nausea and provide pain relief. This unique skill has lead to the creation of many health medicines.</p>
                    <div class="icons-container">
                        <div class="icons">
                            <i class="fas fa-shipping-fast"></i>
                            <span>free delivery</span>
                        </div>
                        <div class="icons">
                            <i class="fas fa-money-check-dollar"></i>
                            <span>easy payments</span>
                        </div>
                        <div class="icons">
                            <i class="fas fa-headset"></i>
                            <span>24/7 service</span>
                        </div>
                    </div>
                    <a href="#" class="btn">learn more</a>
                </div>
            </div>
        </section>

        <section class="banner-container" id="banner">
            <h1 class="heading">New <span>Arrivals</span></h1>
            <div class="banner">
                <img src="images\banner.jpg">
                <div class="content">
                    <span>new arrivals</span>
                    <h3>designer pot</h3>
                    <a href="#product" class="btn">read more</a>
                </div>
            </div>

            <div class="banner">
                <img src="images\bouquet.jpg" alt="">
                <div class="content">
                    <span>new arrivals</span>
                    <h3>Flowers bouquet</h3>
                    <a href="#product" class="btn">read more</a>
                </div>
            </div>

        </section>

        <section class="category" id="category">
            <h1 class="heading">shop by<span> category</span></h1>
            <div class="box-container">
                <div class="box">
                    <img src="images\red bouquet.jpeg" alt="">
                    <div class="content">
                        <h3>Rose bouquets</h3>
                        <a href="Bouquet.jsp" class="btn">shop now</a>
                    </div>
                </div>

                <div class="box">
                    <img src="images\banner pot.jpg" alt="">
                    <div class="content">
                        <h3>Flower pots</h3>
                        <a href="Pot.jsp" class="btn">shop now</a>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="container content-section" id="product">
            <h2 class="section-header">bouquet <span>Products</span></h2>
            <div class="shop-items">
                <%
                int id=1;
        	ProductDAOImplement productDAO=new ProductDAOImplement(DataConnection.databaseConnection());
            List<Product> list=productDAO.getBouquetProduct();
            User userId=new User();
            userId.setId(id);
            for(Product product:list){%>
            <div class="shop-item">
                    <span class="shop-item-title"><%=product.getProductName()%></span>
                    <img class="shop-item-image" src="images/<%=product.getProductImage() %>" alt="">
                    <span class="shop-item-category">Category:<%=product.getCategory()%></span>
                    <div class="shop-item-details">
                        <span class="shop-item-price">Rs.<%=product.getProductPrice() %> </span>
                        <%if(user==null){ %>
                        <a href="Login.jsp" ><button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button></a>
                        <%}else{ %>
                        <a href="cart?productId=<%=product.getProductId() %>&&userId=<%=userId.getId() %>" class="btn btn-primary shop-item-button" type="button">ADD TO CART</a>
                        <%} %>
                    </div>
             </div>
          <%} %>
            </div>
        </section>
        <section class="container content-section" id="product">
            <h2 class="section-header">pot <span>Products</span></h2>
            <div class="shop-items">
                <%
        	ProductDAOImplement productDao=new ProductDAOImplement(DataConnection.databaseConnection());
            List<Product> productList=productDao.getPotProduct();
            for(Product product:productList){%>
            <div class="shop-item">
                    <span class="shop-item-title"><%=product.getProductName()%></span>
                    <img class="shop-item-image" src="images/<%=product.getProductImage() %>" alt="">
                    <span class="shop-item-category">Category:<%=product.getCategory()%></span>
                    <div class="shop-item-details">
                        <span class="shop-item-price">Rs.<%=product.getProductPrice() %> </span>
                        <%if(user==null){ %>
                        <a href="Login.jsp" ><button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button></a>
                        <%}else{ %>
                        <a href="cart?productId=<%=product.getProductId() %>&&userId=<%=userId.getId() %>" class="btn btn-primary shop-item-button" type="button">ADD TO CART</a>
                        <%} %>
                    </div>
             </div>
          <%} %>
            </div>
        </section>
        <section class="contact" id="contact">
        <h1 class="heading"><span>contact</span></h1>
        <div class="row">
            <form action="">
                <input type="text" placeholder="name" class="box">
                <input type="email" placeholder="email" class="box">
                <input type="number" placeholder="number" class="box">
                <textarea name="" class="box" placeholder="message" id="" cols="30" rows="10"></textarea>
                <input type="submit" value="send message" class="btn">
            </form>
            <div class="image">
                <img src="images\flower shop.jpeg" alt="">
            </div>
        </div>
    </section>

    <section class="footer">
        <div class="box-container">
            <div class="box">
                <h3>quick-links</h3>
                <a href="#home">home</a>
                <a href="#about">about</a>
                <a href="#category">category</a>
                <a href="#product">product</a>
                <a href="#contact">contact</a>
            </div>
            <div class="box">
                <h3>extra-links</h3>
                <a href="#contact">my account</a>
                <a href="#product">my order</a>
                <a href="#product">my favorite</a>
                <a href="#contact">my contact</a>
            </div>
            <div class="box">
                <h3>locations</h3>
                <a href="#">india</a>
                <a href="#">chennai</a>
                <a href="#">coimbatore</a>
                <a href="#">bangalore</a>
            </div>
            <div class="box">
                <h3>contact-info</h3>
                <a href="#">+123-456-7890</a>
                <a href="#">flowershop@gmail.com</a>
                <a href="#">chennai.india-641602</a>
                <div class="icon-container">
                    <i class="fab fa-cc-visa" style="color:navy;"></i>
                    <i class="fab fa-cc-amex" style="color:blue;"></i>
                    <i class="fab fa-cc-mastercard" style="color:red;"></i>
                    <i class="fab fa-cc-discover" style="color:orange;"></i>
                </div>
            </div>
        </div>
        <div class="credit">created by<span> dhanu flowershop designer</span> | all rights reserved </div>
    </section>
</body>
</html>