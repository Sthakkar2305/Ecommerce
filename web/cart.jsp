<%-- 
    Document   : cart
    Created on : 16 Jan, 2024, 11:56:53 PM
    Author     : 91848
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@page import="java.sql.*"%>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menu1</title>
        <link rel="stylesheet" href="mysite.css">
        <link rel="stylesheet" href="grid940.css">

        <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    </head>




    <body>
        <%

            String value1 = "";

            if (session.getAttribute("ps0") != null) {
                value1 = session.getAttribute("ps0").toString();
            } else {
                value1 = "Login";
            }


        %>

        <%    String value = "";

            if (session.getAttribute("ps1") != null) {
                value = session.getAttribute("ps1").toString();
            } else {
                value = "Login";
            }


        %>
        <div class="container">
            <div class="menu">

                <div class="logo">
                    <img src="logo.png" alt="E-Shopper">
                </div>

                <div class="nav">
                    <ul>
                        <li> <a href="#"><i class="fa fa-star ic"></i> Wishlist</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart ic"></i>cart</a></li>
                        <li><a href="#"><i class="fa fa-crosshairs ic"></i>Checkout</a></li>
                        <li><a href="Register.jsp"><%= value1%></i>

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

            <section id="cart_items">

                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>


                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description">description</td>
                                <td class="price">price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<String> imageFileNames = new ArrayList<>();
                                String product = request.getParameter("product");
                                int quantity = 1; // Default quantity or handle as necessary

                                // Check if "quantity" parameter is not null before parsing
                                String quantityParam = request.getParameter("quantity");
                                if (quantityParam != null && !quantityParam.isEmpty()) {
                                    quantity = Integer.parseInt(quantityParam);
                                } // Get quantity from request

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce register", "root", "");
                                PreparedStatement st = con.prepareStatement("SELECT image FROM addproduct WHERE pname=?");
                                st.setString(1, product);
                                ResultSet rs = st.executeQuery();

                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce register", "root", "");

                                    while (rs.next()) {
                                        String image = rs.getString("image");
                                        imageFileNames.add(image);

                                        PreparedStatement ps = conn.prepareStatement("INSERT INTO addtocartcart (userid, product, image, price, quantity, total_price) "
                                                + "SELECT s.userid, ?, ?, p.price, ?, p.price * ? " // Calculate total price
                                                + "FROM signup s JOIN addproduct p "
                                                + "ON s.userid = ? "
                                                + "WHERE p.pname = ?");
                                        ps.setString(1, product);
                                        ps.setString(2, image); // Insert the retrieved image value
                                        ps.setInt(3, quantity);
                                        ps.setInt(4, quantity);
                                        ps.setString(5, value); // Assuming 'value' is the userid
                                        ps.setString(6, product);

                                        // Execute the insert statement
                                        ps.executeUpdate();
                                        ps.close();
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }


                            %>

                            <%                                List<String> imageFileNames1 = new ArrayList<>();

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce register", "root", "");
                                PreparedStatement st1 = con1.prepareStatement("SELECT * FROM addtocartcart WHERE userid='" + value + "'");

                                ResultSet rs1 = st1.executeQuery();
                                while (rs1.next()) {
                                    String image1 = rs1.getString("image");
                                    imageFileNames1.add(image1);

                                    int price = rs1.getInt("price");
                                    String cartid = rs1.getString("cartid");

                            %>

                            <tr>
                                <td class="cart_product">
                                    <img id="ContentPlaceHolder1_cartproductdetail_cartimg_0" src="<%=image1%>" style="height:100px">
                                </td>



                                <td class="cart_description">
                                    <h4> <span><%= price%></span> </h4>
                                    <p> cart id : <span><%=cartid%></span> </p>
                                </td>
                                <td class="cart_price">
                                    <p> <span><%=price%></span> </p>
                                </td>

                                <td class="cart_quantity">
                                    <div class="cart_quantity_button">
                                        <input name="quantity" class="cart_quantity_input" type="number" value="<%=quantity%>" min="1">
                                    </div>
                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price">  <span><%=price * quantity%></span> </p>
                                </td>



                                <td class="cart_delete">
                                    <form action="DeleteCartItemServlet" method="post">
                                        <input type="hidden" name="cartid" value="<%= cartid%>">
                                        <button type="submit" class="cart_quantity_delete" name="dlt"><i class="fa fa-times"></i></button>
                                    </form>
                                </td>

                            </tr>
                            <%
                                }
                            %>






                        </tbody>
                    </table>
                </div>

                <div class="shopper-informations">
                    <div class="row">

                        <div class="register-req">  

                            Shipping Information

                        </div>

                        <div class="col-sm-12 clearfix">
                            <div class="bill-to">
                                <p>Bill To</p>
                                <div class="form-one">

                                    <div class="form">
                                        <input name="ctl00$ContentPlaceHolder1$firstname" type="text" readonly="readonly" id="firstname" placeholder="First Name *">
                                        <input name="ctl00$ContentPlaceHolder1$lastname" type="text" readonly="readonly" id="lastname" placeholder="Last Name *">
                                        <input name="ctl00$ContentPlaceHolder1$email" type="text" readonly="readonly" id="email" placeholder="Email *">
                                        <textarea name="ctl00$ContentPlaceHolder1$add1" rows="2" cols="20" readonly="readonly" id="add1" placeholder="Address  *"></textarea>
                                    </div>

                                </div>
                                <div class="form-two">

                                    <div class="form">
                                        <input name="ctl00$ContentPlaceHolder1$zip" type="text" readonly="readonly" id="zip" placeholder="Zip / Postal Code *">

                                        <select name="ctl00$ContentPlaceHolder1$country" id="country" disabled="disabled" class="aspNetDisabled">
                                            <option selected="selected" value="-- Country --">-- Country --</option>
                                            <option value="United States">United States</option>
                                            <option value="Bangladesh">Bangladesh</option>
                                            <option value="India">India</option>
                                            <option value="Pakistan">Pakistan</option>
                                            <option value="Canada">Canada</option>
                                            <option value="Dubai">Dubai</option>

                                        </select>

                                        <select name="ctl00$ContentPlaceHolder1$state" id="state" disabled="disabled" class="aspNetDisabled">
                                            <option selected="selected" value="-- State --">-- State --</option>
                                            <option value="Gujarat">Gujarat</option>
                                            <option value="Maharastra">Maharastra</option>
                                            <option value="Rajastan">Rajastan</option>
                                            <option value="Tamilnadu">Tamilnadu</option>
                                            <option value="Utterpradesh">Utterpradesh</option>

                                        </select>


                                        <input name="ctl00$ContentPlaceHolder1$mobile" type="text" readonly="readonly" id="mobile" placeholder="Mobile Number *">
                                        <input name="ctl00$ContentPlaceHolder1$altmobile" type="text" readonly="readonly" id="altmobile" placeholder="Alternative Number *">
                                    </div>

                                </div>
                                <input type="submit" name="ctl00$ContentPlaceHolder1$shippingbtn" value="Save Shipping Information" id="ContentPlaceHolder1_shippingbtn" class="shippingbtn">
                                <input type="submit" name="ctl00$ContentPlaceHolder1$changebtn" value="Change Shipping Information" id="ContentPlaceHolder1_changebtn" class="shippingbtn" onclick="enableEditing()">

                            </div>
                        </div>

                    </div>
                </div>
                <script>
                    function enableEditing() {
                        var firstNameInput = document.getElementById("firstname");
                        var lastNameInput = document.getElementById("lastname");
                        var emailInput = document.getElementById("email");
                        var add1Input = document.getElementById("add1");
                        var zipInput = document.getElementById("zip");
                        var countrySelect = document.getElementById("country");
                        var stateSelect = document.getElementById("state");
                        var mobileInput = document.getElementById("mobile");
                        var altMobileInput = document.getElementById("altmobile");

                        if (firstNameInput) {
                            firstNameInput.readOnly = false;
                        } else {
                            console.error("Element with ID 'firstname' not found.");
                        }
                        if (lastNameInput) {
                            lastNameInput.readOnly = false;
                        } else {
                            console.error("Element with ID 'lastname' not found.");
                        }
                        if (emailInput) {
                            emailInput.readOnly = false;
                        } else {
                            console.error("Element with ID 'email' not found.");
                        }
                        if (add1Input) {
                            add1Input.readOnly = false;
                        } else {
                            console.error("Element with ID 'add1' not found.");
                        }
                        if (zipInput) {
                            zipInput.readOnly = false;
                        } else {
                            console.error("Element with ID 'zip' not found.");
                        }
                        if (countrySelect) {
                            countrySelect.disabled = false;
                        } else {
                            console.error("Element with ID 'country' not found.");
                        }
                        if (stateSelect) {
                            stateSelect.disabled = false;
                        } else {
                            console.error("Element with ID 'state' not found.");
                        }
                        if (mobileInput) {
                            mobileInput.readOnly = false;
                        } else {
                            console.error("Element with ID 'mobile' not found.");
                        }
                        if (altMobileInput) {
                            altMobileInput.readOnly = false;
                        } else {
                            console.error("Element with ID 'altmobile' not found.");
                        }
                    }
                  

                </script>

            </section>
            <section id="do_action">

                <div class="heading">
                    <h3>What would you like to do next?</h3>
                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="chose_area">



                            <div id="ContentPlaceHolder1_UpdatePanel1">


                                <input id="ContentPlaceHolder1_cod" type="radio" name="ctl00$ContentPlaceHolder1$radio" value="cod" onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$cod\',\'\')', 0)"><label for="ContentPlaceHolder1_cod">COD</label>
                                <input id="ContentPlaceHolder1_upi" type="radio" name="ctl00$ContentPlaceHolder1$radio" value="upi" onclick="javascript:setTimeout('__doPostBack(\'ctl00$ContentPlaceHolder1$upi\',\'\')', 0)"><label for="ContentPlaceHolder1_upi">Upi Payment</label>


                                <br>



                            </div>

                            <span id="ContentPlaceHolder1_lab2">*Must Upload Payment Receipt*</span>
                            <br>
                            <input type="file" name="ctl00$ContentPlaceHolder1$FileUpload1" id="ContentPlaceHolder1_FileUpload1">
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>

                                <li>Cart Sub Total <span id="ContentPlaceHolder1_total">120000</span></li>

                                <li>Total Quantity <span id="ContentPlaceHolder1_qty">1</span></li>

                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span id="ContentPlaceHolder1_grandtotal">120000</span></li>
                            </ul>
                            <input type="submit" name="ctl00$ContentPlaceHolder1$checkoutbtn" value="Check Out" id="ContentPlaceHolder1_checkoutbtn" class="btn btn-default update">

                        </div>
                    </div>
                </div>
            </section>
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

        <style>
            * {
                margin: 0%;
                padding: 0%;
                box-sizing: border-box;
            }   


            .container {
                width: 1170px;
                margin: auto;
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
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
            /*.................. main style ...............*/
            .breadcrumbs .breadcrumb {
                background: transparent;
                margin-bottom: 75px;
                padding-left: 0;
            }
            .breadcrumb {
                padding: 8px 15px;
                list-style:none;
                border-radius: 4px;
            }
            ul, ol {
                margin-top: 0;
                display: block;
            }
            .breadcrumb>li {
                display: inline-block;
            }
            .breadcrumbs .breadcrumb li a {
                background: #FE980F;
                color: #FFFFFF;
                padding: 3px 7px;
                text-decoration: none;
            }
            .breadcrumb>.active {
                color: #999;
            }
            #cart_items .cart_info {
                border: 1px solid #E6E4DF;
                margin-bottom: 50px;
            }
            .table {
                width: 100%;
                margin-bottom: 20px;
            }

            table {
                max-width: 100%;
                background-color: transparent;
            }
            table {
                border-collapse: collapse;
                border-spacing: 0;
            }
            thead {
                display: table-header-group;
                vertical-align: middle;
                border-color: inherit;
            }
            #cart_items .cart_info .table.table-condensed tr:last-child {
                border-bottom: 0;
            }

            #cart_items .cart_info .table.table-condensed thead tr {
                height: 51px;
            }
            #cart_items .cart_info .table.table-condensed tr {
                border-bottom: 1px solid#F7F7F0;
            }
            #cart_items .cart_info .cart_menu {
                background: #FE980F;
                color: #fff;
                font-size: 16px;
                font-family: 'Roboto', sans-serif;
                font-weight: normal;
            }
            tr {
                display: table-row;
                vertical-align: inherit;
                border-color: inherit;
            }
            child>tr:first-child>td {
                border-top: 0;
            }
            .cart_info table tr td {
                border-top: 0 none;
                vertical-align: inherit;
            }
            condensed>thead>tr>td{
                padding: 5px;
            }
            .table>thead>tr>td
            {
                line-height: 1.428571429;
            }
            .row {
                margin-right: -15px;
                margin-left: -15px;
            }
            .register-req {
                font-size: 14px;
                font-weight: 300;
                padding: 15px 20px;
                margin-top: 35px;
            }
            .register-req, .step-one .heading {
                background: none repeat scroll 0 0 #F0F0E9;
                color: #363432;
                margin-bottom: 35px;
                font-family: 'Roboto', sans-serif;
            }
            .col-sm-12{
                width: 100%;
                float: left;
                position: relative;
                min-height: 1px;
                padding-right: 15px;
                padding-left: 15px;
            }
            .shopper-info p, .bill-to p, .order-message p {
                color: #696763;
                font-size: 20px;
                font-weight: 300;
            }

            p {
                margin: 0 0 10px;
            }
            .form-two, .form-one {
                float: left;
                width: 47%;
            }
            .shopper-info > .form > input, .form-two > .form > select, .form-two > .form > input, .form-one > .form > input {
                background: #F0F0E9;
                border: 0 none;
                margin-bottom: 10px;
                padding: 10px;
                width: 100%;
                font-weight: 300;
            }

            input, button, select, textarea {
                font-family: inherit;
                font-size: inherit;
                line-height: inherit;
            }
            .user_info input, select, textarea {
                background: #F0F0E9;
                border: 0;
                color: #696763;
                padding: 5px;
                width: 100%;
                border-radius: 0;
                resize: none;
            }
            .form-two {
                margin-left: 5%;
            }
            .shopper-info > .form > input, .form-two > .form > select, .form-two > .form > input, .form-one > .form > input {
                background: #F0F0E9;
                border: 0 none;
                margin-bottom: 10px;
                padding: 10px;
                width: 100%;
                font-weight: 300;
            }
            .shippingbtn {
                background: #FE980F;
                border-radius: 0;
                color: #FFFFFF;
                border: none;
                padding: 5px 15px;
            }
            button, html input[type="button"], input[type="reset"], input[type="submit"] {
                cursor: pointer;
                -webkit-appearance: button;
            }
            section
            {
                display: block;
            }
            #do_action {
                margin-top: 380px;
            }
            .heading h3 {
                color: #363432;
                font-size: 20px;
                font-family: 'Roboto', sans-serif;
            }
            h1, h2, h3 {
                margin-top: 20px;
                margin-bottom: 10px;
                font-weight: 500;
                line-height: 1.1;
            }
            .heading p {
                color: #434343;
                font-size: 16px;
                font-weight: 300;
            }
            .col-sm-6 {
                width: 50%;
                float: left;
                position: relative;
                min-height: 1px;
                padding-right: 15px;
                padding-left: 15px;
            }
            #do_action .chose_area {
                border: 1px solid #E6E4DF;
                color: #696763;
                padding: 30px 25px 30px 0;
                margin-bottom: 80px;
                text-align: center;
            }
            input[type="radio"], input[type="checkbox"] {
                margin: 4px 0 0;
                margin-top: 1px \9;
                line-height: normal;
            }

            input[type="checkbox"], input[type="radio"] {
                padding: 0;
                box-sizing: border-box;
            }
            label {
                display: inline-block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input[type="file"] {
                display: block;
            }
            #do_action .total_area {
                border: 1px solid #E6E4DF;
                color: #696763;
                padding: 30px 25px 30px 0;
                margin-bottom: 80px;
            }

            #do_action .total_area {
                padding-bottom: 18px !important;
            }
            .total_area ul li {
                background: #E6E4DF;
                color: #696763;
                margin-top: 10px;
                padding: 7px 20px;
            }
            ul li {
                list-style: none;
            }
            .total_area span {
                float: right;
            }
            input[type="submit"] {
                cursor: pointer;
                -webkit-appearance: button;
            }

            .update {
                margin-left: 40px;
            }
            .update, .check_out {
                background: #FE980F;
                border-radius: 0;
                color: #FFFFFF;
                margin-top: 18px;
                border: none;
                padding: 5px 15px;
            }
            .btn {
                display: inline-block;
                /*    padding: 6px 12px;*/
                margin-bottom: 0;
                font-size: 14px;
                font-weight: normal;
                line-height: 1.428571429;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
            }
            /*.......................................footer................................................*/

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
            .video-gallery img
            {
                height: 100%;
                width:100%;
                object-fit: cover;
                border: 2px solid #CCCCC6;
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
            .site-footer .footer-top
            {
                text-align: center;
            }

            .site-footer .company-info p {
                margin: 5px 0;
            }

            .site-footer  {
                /*                display: flex;
                                justify-content: space-around;*/
                margin-top: 340px;
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
                padding: 60px 0;
                justify-content: space-around;
            }
        </style>