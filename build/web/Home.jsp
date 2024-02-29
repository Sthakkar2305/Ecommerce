<%-- 
    Document   : Index
    Created on : 11 Jul, 2023, 4:55:15 PM
    Author     : 91848
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@page import="java.sql.*"%>
        <%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu1</title>
        <link rel="stylesheet" href="mysite.css">
        <link rel="stylesheet" href="grid940.css">

        <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    </head>
    <%

        String value = "";

        if (session.getAttribute("ps0") != null) {
            value = session.getAttribute("ps0").toString();
        } else {
            value = "Login";
        }


    %>

    <%        if (request.getParameter("btt1") != null) {
            String ch1 = request.getParameter("search");

            if (ch1.equals("mobile")) {

                response.sendRedirect("mobile.jsp");
            }
            if (ch1.equals("android") || ch1.equals("Android") || ch1.equals("redmi") || ch1.equals("samsung") || ch1.equals("realme") || ch1.equals("Samsung") || ch1.equals("Realme") || ch1.equals("Redmi")) {

                response.sendRedirect("android.jsp");
            }
        }
    %>

    <body>

        <div class="container">
            <div class="menu">

                <div class="logo">
                    <img src="logo.png" alt="E-Shopper">
                </div>

                <div class="nav">
                    <ul>
                        <li> <a href="#"><i class="fa fa-star ic"></i> Wishlist</a></li>
                        <li><a href="cart.jsp"><i class="fa fa-shopping-cart ic"></i>cart</a></li>
                        <li><a href="#"><i class="fa fa-crosshairs ic"></i>Checkout</a></li>
                        <li><a href="Register.jsp"><i class="fa fa-lock ic"></i>
                                <%out.print(value);%>
                            </a></li>
                    </ul>
                </div>
            </div>

            <hr>

            <div class="menu2">
                <div class="nav2">
                    <ul>
                        <li><a href="Home.jsp"><i class="fa fa-home ic"></i>Home</a></li>
                        <li class="dropdown"><a href="#">Shop &nbsp;<i class="fa fa-arrow-down ic"></i></a>
                            <ul id="subMenu">
                                <li><a href="#items">Products</a></li>
                                <li><a href="#">Product Details</a></li> 
                                <li><a href="#">Checkout</a></li> 
                                <li><a href="#">Cart</a></li> 
                                <li><a href="Register.jsp">Login</a></li> 
                            </ul>
                        </li>
                        <li><a href="contact.jsp"><i class="fa fa-phone ic"></i>Contact</a></li>
                    </ul>
                </div>
                <form method="post">
                    <div class="search-box">
                        <input type="text" name="search" placeholder="Search"><button name="btt1"><i class="fa fa-search" id="search" > </i></button>
                    </div>

                    <!--                <input type="submit" name="btt1">-->
                </form>
            </div>

            <div class="slider-container">
                <div class="slider-track">
                    <div class="slider-item">
                        <div class="text">
                            <h1><span>E</span>-SHOPPER</h1>
                            <h2>100% Responsive Design</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                            <button type="button" class="btn btn-default get">Get it now</button>
                        </div>
                        <div class="image">
                            <img src="girl1.jpg" alt="advertise">
                            <img class="price" src="pricing.png" alt="price">
                        </div>
                    </div>
                    <div class="slider-item">
                        <div class="text">
                            <h1><span>E</span>-SHOPPER</h1>
                            <h2>100% Responsive Design</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                            <button type="button" class="btn btn-default get">Get it now</button>
                        </div>
                        <div class="image">
                            <img src="girl2.jpg" alt="advertise">
                            <img class="price" src="pricing.png" alt="price">
                        </div>
                    </div>

                    <div class="slider-item">
                        <div class="text">
                            <h1><span>E</span>-SHOPPER</h1>
                            <h2>Free Ecommerce Template</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                            <button type="button" class="btn btn-default get">Get it now</button>
                        </div>
                        <div class="image">
                            <img src="girl3.jpg" alt="advertise">
                            <img class="price" src="pricing.png" alt="price">
                        </div>
                    </div>
                    <!-- Add more slider items as needed -->
                </div>
            </div>
            <div class="item-container" id="items">
                <div class="feature-item">
                    <h2 class="title text-center">Category Items</h2>

                    <%
                          List<String> imageFileNames = new ArrayList<>();
    
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce register", "root", "");
                        PreparedStatement st = con.prepareStatement("Select * from addcategory ");
                        ResultSet rs = st.executeQuery();

                                               


                        while (rs.next()) {
                    String cimg = rs.getString("cimg");
                    imageFileNames.add(cimg);
                    %>
                    
        
<div class="product-image-wrapper">
    <div class="single-products">
        <div class="productinfo text-center">
         
                <img src="<%= cimg %>">
         
                            
                      <a href="mobile.jsp?category=<%=rs.getString("cname")%>" class="btn btn-default add-to-cart"><%=rs.getString("cname")%></a>
                            </div>
                        </div>

                        <div class="choose">
                            <ul class="nav nav-pills nav-justified">
                                <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                            </ul>
                        </div>
                    </div>


                    <%
                        }
                    %>
                </div>

            </div>
        </div>

        <footer class="site-footer">
            <div class="container">
                <div class="footer-top">
                    <div class="company-info">
                        <img src="logo.png" alt="Company Logo">
                        <h2><span>E</span>-shopper</h2>
                        <p>Lorem ipsum dolor sit amet <br> consectetur adipisicing elit. <br>  Laborum amet molestias </p>
                    </div>
                    <div class="video-gallery">
                        <div class="vg">
                            <img src="iframe1.png" >
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>
                        </div>

                        <div class="vg">
                            <img src="iframe2.png" >
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>

                        </div>
                        <div class="vg">
                            <img src="iframe3.png" >
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>

                        </div>
                        <div class="vg">
                            <img src="iframe4.png" >
                            <p>Circle of Hands</p>
                            <h2>24 DEC 2014</h2>
                        </div>

                    </div>
                    <div class="address-map">
                        <img src="map.png" alt="">
                        <p>123 Main Street, City, Country</p>

                    </div>
                </div>

                <div class="footer-mid">
                    <div class="colum">
                        <div class="footer-section">
                            <h2>Services</h2>
                            <ul class="ul">
                                <li><a href="#">Online Help</a></li>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Order Status</a></li>
                                <li><a href="#">Change Location</a></li>
                                <li><a href="#">FAQ’s</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="colum">
                        <div class="footer-section">
                            <h2>Upcomig Items</h2>
                            <ul class="ul">
                                <li><a href="#">T-Shirt</a></li>
                                <li><a href="#">Mens</a></li>
                                <li><a href="#">Womens</a></li>
                                <li><a href="#">Gift Cards</a></li>
                                <li><a href="#">Shoes</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="colum">
                        <div class="footer-section">
                            <h2>Policies</h2>
                            <ul class="ul">
                                <li><a href="#">Terms of Use</a></li>
                                <li><a href="#">Privecy Policy</a></li>
                                <li><a href="#">Refund Policy</a></li>
                                <li><a href="#">Billing System</a></li>
                                <li><a href="#">Ticket System</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="colum">
                        <div class="footer-section">
                            <h2>About shopper</h2>
                            <ul class="ul">
                                <li><a href="#">Company Information</a></li>
                                <li><a href="#">Careers</a></li>
                                <li><a href="#">Store Location</a></li>
                                <li><a href="#">Affillate Program</a></li>
                                <li><a href="#">Copyright</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="colum">
                        <div class="footer-section">
                            <h2>Newslett</h2>4>

                            <input type="email" placeholder="Enter your email">
                            <button>Subscribe</button>
                            <p>Get the most recent updates from <br>our site and be updated your self...</p>
                        </div>
                    </div>
                </div>
            </div>         


        </footer>
        <div class="footer-bottom">
            <p>&copy; 2023 <span>E</span>-shopper. All rights reserved.</p>
        </div>


    </body>
    <style>
        * {
            margin: 0%;
            padding: 0%;
            box-sizing: border-box;
        }   


        .container {
            width: 1170px;
            margin: auto;
        }
        /*menubar style*/
        .menu,
        .menu2 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0 10px 0;
        }

        .menu .nav ul {
            display: flex;

        }

        .menu ul li {
            list-style: none;
        }


        .menu ul li a {
            color: grey;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
        }

        .menu2 .nav2 ul {
            display: flex;

        }

        .menu2 ul li {
            list-style: none;
        }

        .menu2 ul li a {
            color: grey;
            text-decoration: none;
            display: inline-block;
            padding: 10px 10px;
        }

        .ic {
            margin-right: 6px;
        }

        .menu ul li:hover {
            background-color: #FE980F;
            border-radius: 50px;
        }

        .menu2 ul li:hover {
            background-color: #FE980F;
            border-radius: 50px;
        }

        .menu2 ul li a:hover {
            color: white;
        }


        .menu ul li a:hover {
            color: white;
        }
        .dropdown::after
        {
            display: block;
            clear: both;
            content: "";

        }
        #subMenu{
            display: none;
            position: absolute;

        }

        .dropdown:hover #subMenu 
        {
            display: block;
            width: 180px;
        }
        .dropdown:hover #subMenu li 
        {
            background-color: black;
            opacity: 0.5;
            border-radius: 0;

        }
        #subMenu li a:hover
        {
            color: orange;
        }
        .search-box {
            position: relative;
        }

        #search {

            position: absolute;
            top: 25%;
            right: 7%;
        }

        .search-box input {
            background: #F0F0E9;
            border: medium none;
            color: #B2B2B2;
            font-family: 'roboto';
            font-size: 12px;
            font-weight: 300;
            height: 35px;
            outline: medium none;
            padding-left: 10px;
            width: 155px;
        }
       

        /* Style the slider container */
        .text{
            width: 50%; 
            padding: 10px;
        }
        .text h1
        {
            color: #B4B1AB;
            font-family: abel;
            font-size: 48px;

        }
        .text h1 span
        {
            color: #FE980F;
        }
        .text h2
        {
            color: #363432;
            font-family: 'Roboto', sans-serif;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 22px;
            margin-top: 10px;
        }
        .text p
        {
            color: #363432;
            font-family: 'Roboto', sans-serif;

            margin-bottom: 22px;
            margin-top: 10px;
        }
        .get {
            background: #FE980F;
            border: 0 none;
            border-radius: 0;
            color: #FFFFFF;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            margin-top: 23px;
        }
        .slider-container {
            width: 100%;
            overflow: hidden;
            position: relative;
        }

        /* Style the slider track */
        .slider-track {
            display: flex;
            animation: slide 10s linear infinite;
            margin: 0 0 0 20px;
        }

        /* Define CSS animation */
        @keyframes slide {
            0% {
                transform: translateX(0);
            }
            33.33% {
                transform: translateX(0);
            }
            38.33% {
                transform: translateX(-100%);
            }
            66.66% {
                transform: translateX(-100%);
            }
            71.66% {
                transform: translateX(-200%);
            }
            95% {
                transform: translateX(-200%);
            }
            100%{
                transform: translateX(200%);
            }

        }

        /* Style individual slider items */
        .slider-item {
            flex: 0 0 100%;
            display: flex;
            align-items: center;
            width: 100%;
            padding: 20px;
        }

        /* Style text on the left side */

        /* Style images on the right side */
        .image {
            flex: 1;
            text-align: center;
            position: relative;
        }

        .image img {
            max-width: 100%;
            height: auto;
            padding-left: 100px;
        }
        .price
        {
            position: absolute;
            top: 50%;
            right: 20%;
        }
        /*category items style css*/
        .item-container{
            width: 100%;
        }
        .feature-item
        {
            overflow: hidden;
        }

        h2.title {
            color: #FE980F;
            font-family: 'Roboto', sans-serif;
            font-size: 18px;
            font-weight: 700;
            margin: 0 15px;
            text-transform: uppercase;
            margin-bottom: 30px;
            position: relative;
        }

        .text-center {
            text-align: center;
        }

        .product-image-wrapper {
            border: 1px solid #F7F7F5;
            overflow: hidden;
            margin-bottom: 30px;
            width: 30.33%;
            float: left;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
            margin: 15px;
        }


        .single-products {
            position: relative;
        }
        .productinfo {
            position: relative;
        }
        .text-center {
            text-align: center;
        }
        .productinfo img {
            width: 86%;
            padding: 10px;
            height: 250px;
        }
        img {
            border: 0;
        }

        .add-to-cart {
            background: #F5F5ED;
            border: 0 none;
            border-radius: 0;
            color: #696763;
            font-family: 'Roboto', sans-serif;
            font-size: 15px;
            margin-bottom: 25px;
        }
        .btn {
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.428571429;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
            user-select: none;
            text-decoration: none;
        }
        .btn:hover
        {
            background-color: orange;
            color: white;
        }
        .choose {
            border-top: 1px solid #F7F7F0;
        }
        .nav-justified {
            width: 100%;
        }

        .nav {
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }
        ul, ol {
            margin-top: 0;
            margin-bottom: 10px;
        }
        .choose ul li a i {
            margin-right: 5px;
        }
        .fa {
            display: inline-block;
            font-family: FontAwesome;
            font-style: normal;
            font-weight: normal;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        .choose ul li a {
            color: #B3AFA8;
            font-family: 'Roboto', sans-serif;
            font-size: 13px;
            padding-left: 0;
            padding-right: 0;
        }
        .choose ul li a:hover
        {
            color: orange;
        }
        .nav-justified>li>a {
            margin-bottom: 5px;
            text-align: center;
        }
        .nav-pills>li>a {
            border-radius: 4px;
        }
        .nav>li>a {
            position: relative;
            display: block;
            padding: 10px 15px;
        }

        /* Styling for the footer */

        .site-footer {
            background-color: #F0F0E9; /* Footer bottom background color */
            color: #333; /* Text color for the footer */
            padding: 20px 0;
        }

        .site-footer .footer-top,
        .site-footer .footer-mid {
            background-color: #F0F0E9; /* Footer top and mid background color */

        }
        .footer-top
        {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 20px 0 0 0 ;
        }
        .company-info h2 span {
            color: #FE980F;
        }
        .company-info h2 {
            color: #B4B1AB;
            font-family: abel;
            font-size: 27px;
            text-transform: uppercase;
        }
        .company-info p {
            color: #B3B3AD;
            font-family: 'Roboto', sans-serif;
            font-size: 12px;
            font-weight: 300;
            margin: 0 0 10px;

        }

        .video-gallery
        {
            width: 40%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .video-gallery .vg{
            margin: 0 5px;
        }

        .video-gallery img{
            height: 61px;
        }

        .video-gallery p {
            color: #8C8C88;
            font-family: 'Roboto', sans-serif;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 0px;
        }
        .video-gallery h2 {
            color: #8c8c88;
            font-family: 'Roboto', sans-serif;
            font-size: 12px;
            font-weight: 300;
            text-transform: uppercase;
            margin-top: 0px;
        }
        .video-gallery img
        {
            height: 100%;
            width:100%;
            object-fit: cover;
            border: 2px solid #CCCCC6;
        }

        .site-footer .footer-top
        {
            text-align: center;
        }

        .site-footer .company-info p {
            margin: 5px 0;
        }

        .site-footer  {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .site-footer .video-gallery video {
            width: 100px;
            height: auto;
        }

        .site-footer .address-map iframe {
            width: 100%;
            height: 200px;
            border: none;
        }

        .site-footer .footer-section {
            margin: 20px;
            display: inline-block;
            vertical-align: top;
        }

        .site-footer h4 {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .site-footer ul {
            list-style: none;
            padding: 0;
        }

        .site-footer ul li {
            margin-bottom: 5px;
        }

        .site-footer .footer-bottom p {
            color: #363432;
            font-family: 'Roboto', sans-serif;
            font-weight: 300;
            margin-left: 15px;
        }
        .footer-bottom
        {
            height: 50px;
            background: #D6D6D0;
            padding-top: 10px;
        }

        li a
        {
            text-decoration: none;
        }
        .footer-section h2
        {
            color: #666663;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 22px;
            text-transform: uppercase;
        }
        .ul
        {
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }
        .footer-section ul li a
        {
            color: #8C8C88;
            font-family: 'Roboto', sans-serif;
            font-size: 14px;
            font-weight: 300;
            padding: 5px 0;
        }
        input, button, select, textarea {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
        }
        .colum
        {
            margin: auto;

        }
        .footer-mid
        {
            display: flex;
            padding: 30px 0 0 0;
            justify-content: space-around;
        }
        /*.......................................................Responsive......................................................*/
        @media screen and (max-width:1240px) {
            .container {
                width: 1140px;
            }
            @media screen and (max-width:1227px) {
                .container {
                    width: 980px;
                }
                .product-image-wrapper
                {
                    width: 44.33%;
                }
                .image img
                {
                    padding-left: 0;
                }
            }
            @media screen and (max-width:1000px) {
                .container {
                    width: 750px;
                }
                .product-image-wrapper
                {
                    width: 44.33%;
                }
                .image img
                {
                    padding-left: 0;
                }
                .footer-mid{
                    display: block;
                }
            }
            @media screen and (max-width:780px) {
                .container{
                    width: 650px;
                }
                .site-footer{
                    width: 100%;
                }
                .image img
                {
                    padding-left: 0;
                }
                .product-image-wrapper
                {
                    width: 44.33%;
                }
                .text h1
                {
                    font-size: 40px;
                }
                .company-info h2
                {
                    font-size: 24px;
                }
                .footer-bottom{
                    width: 100%;
                }
            }
            @media screen and (max-width:680px) {
                .footer-mid
                {
                    display: block;
                }
                .footer-section .site-footer .footer-top
                .footer-bottom  .footer-bottom 

                {
                    width: 100%;
                }
            }
            .site-footer .footer-top
            {
                display: block;
                margin: auto;
            }
            .site-footer
            {
                display:block;
            }
            .video-gallery
            {
                display: block;
                width: 100%;
            }
            .video-gallery p
            {
                font-size: 40px;
            }
            .video-gallery h2{
                font-size: 30px;
            }
            .footer-section h2{
                font-size: 35px;
            }
            .footer-section ul li a 
            {
                font-size: 25px;
            }
            .footer-section p
            {
                font-size: 30px;
            }
            .company-info h2
            {
                font-size: 60px;
            }
            .company-info p
            {
                font-size: 30px;
            }
            .product-image-wrapper
            {
                width: 44.33%;
            }
            .image img
            {
                padding-left: 0;
            }
        </style>
