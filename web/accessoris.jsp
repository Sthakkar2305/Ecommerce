

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
if (request.getParameter("btn1") != null) {
      // out.print("<script>alert('hello...')</script>");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce register", "root", "");
            PreparedStatement ps = con.prepareStatement("Insert into signup values(NULL,?,?,?,?,curdate(),?)");
            ps.setString(1, request.getParameter("Message"));
            ps.setString(2, request.getParameter("FirstName"));
            ps.setString(3, request.getParameter("PhoneNumber"));
            ps.setString(4, request.getParameter("Last Name"));
            ps.setString(5, request.getParameter("Email"));
           
            
            //response.sendRedirect("login.jsp");

            ps.executeUpdate();
        }
             catch (Exception e) {
            out.print("<script>alert('Success....')</script>" + e);
        }
}

    
    
    String value="";
    
    if(session.getAttribute("ps0")!=null)
    {
        value=session.getAttribute("ps0").toString();
    }
    else
    {
        value="Login";
    }
    
    
    



%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    </head>
    <body>
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
                                <li><a href="Home.jsp#items">Products</a></li>
			    <li><a href="#">Product Details</a></li> 
			    <li><a href="#">Checkout</a></li> 
			    <li><a href="#">Cart</a></li> 
			    <li><a href="Register.jsp">Login</a></li> 
                                    </ul>
                        </li>
                        <li><a href="contact.jsp"><i class="fa fa-phone ic"></i>Contact</a></li>
                    </ul>
                </div>
                <div class="search-box">
                    <input type="search" name="search" placeholder="Search"><i class="fa fa-search" id="search"> </i>
                </div>
            </div>
            
            <div class="advrtisment">
                <img src="advertisement.jpg" alt="advertisment">
            </div>
            <div class="mainbap">
            <div class="Rightt">
                

                    Price :-
                    <input name="prycing" id="ContentPlaceHolder1_mintxt" type="text">
                    <br>
                    <br>
                    <input name="prycing" id="ContentPlaceHolder1_maxtxt" type="text">
                    <br>
                    <br>
                    <input type="submit" name="ctl00$ContentPlaceHolder1$filterbtn" value="Submit" id="ContentPlaceHolder1_filterbtn">
                    <br>
                    <br>
                    <select name="ctl00$ContentPlaceHolder1$shortby"  id="ContentPlaceHolder1_shortby">
	<option value="--- Sort By ---">--- Sort By ---</option>
	<option selected="selected" value="High To Low">High To Low</option>
	<option value="Low To High">Low To High</option>
                    </select>        
        <select name="ctl00$ContentPlaceHolder1$color"  id="ContentPlaceHolder1_color">
	<option selected="selected" value="--- Select Color ---">--- Select Color ---</option>
	<option value="#000000">powerbank</option>
	<option value="#ffffff">Ear-phone</option>
	<option value="#0000ff">Thump Sleeves</option>
	<option value="#ff0000">charger</option>

</select>


            </div>
            
                 <div class="item_boxes">
                    <h2 class="title text-center">Accessoris</h2>
                <div class="feature-item">
                    
                         <div class="product-image-wrapper">
                                 <div class="product-overlay">
                                        <div class="overlay-content">
                                         <h4>Ambrane 20000mAh Power Bank, 20W Fast Charging, Triple Output, Type C PD (Input & Output), 
                                             Quick Charge, Li-Polymer, Multi-Layer Protection for iPhone, Smartphones 
                                             & Other Devices (Stylo 20K, Green)</h4>
                                            <h2>₹1,999</h2>
                                            <p>Powerbank</p>
                                            <a href="clientproductdetail.aspx?pname=Samsung Galaxy Z" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                    </div>
                  <div class="single-products">
                      <div class="productinfo text-center">
                          <img src="61zfnaeduEL._SX679_.jpg">
                          <h2>₹1,999</h2>
                          <a href="#" class="btn btn-default add-to-cart">Powerbank</a>
                                </div>
				</div>
                    <div class="choose">
			<ul class="nav nav-pills nav-justified">
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
			</ul>
	            </div>
                </div>
                <div class="product-image-wrapper">
                       <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h4>EDYELL C6 Bluetooth Earphones Wireless Neckband Earphone in Ear, 100Hrs Playtime with Type-C Quick Charge,
                                                Magnetic, v5.3 Bluetooth Headphones with Mic, 10mm Drivers, IPX5 Waterproof Neckband</h4>
                                            <h2>₹1,999</h2>
                                            <p>Ear-phones</p>
                                            <a href="clientproductdetail.aspx?pname=Samsung Galaxy Z" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                    </div>
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="711SikAQvWL._SX522_.jpg">
                            <h2> ₹1,999</h2>
                            <a href="#" class="btn btn-default add-to-cart">Ear-phones</a>
                        </div>
                            <div class="choose">
			<ul class="nav nav-pills nav-justified">
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
			</ul>
	            </div>
                    </div>
                </div>
                     <div class="product-image-wrapper">
                         <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h4>RPM Euro Games Gaming Button R11 Mobile Gaming Controller Works with All The Mobile Shooting Games (Black)</h4>
                                            <h2>₹219</h2>
                                            <p>Thump sleeves</p>
                                            <a href="clientproductdetail.aspx?pname=Samsung Galaxy Z" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                    </div>
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="thump.webp">
                            <h2>₹219</h2>
                            <a href="#" class="btn btn-default add-to-cart">Thump sleeves </a>
                        </div>
                         
                            <div class="choose">
			<ul class="nav nav-pills nav-justified">
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
			</ul>
	            </div>
                       
                    </div>
                </div>
                        <div class="product-image-wrapper">
                         <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h4>Cablebasket 3 amp Charger Wall Adapter with 3.1A Fast Charging Triple 3 USB Port USB Charging Cables for All iOS & Android Devices (Black)</h4>
                                            <h2> ₹449</h2>
                                            <p>Charger</p>
                                            <a href="clientproductdetail.aspx?pname=Samsung Galaxy Z" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        </div>
                                    </div>
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="61eptDIxkqL._SX679_.jpg">
                            <h2> ₹449</h2>
                            <a href="#" class="btn btn-default add-to-cart">Charger</a>
                        </div>
                         
                            <div class="choose">
			<ul class="nav nav-pills nav-justified">
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
			<li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
			</ul>
	            </div>
                       
                    </div>
                </div>
                 </div>
                     <ul class="number">
                         <li class="sub-no"><a>1</a></li>
                         <li><a href="">2</a></li>
                         <li><a href="">3</a></li>
                         <li><a href="">»</a></li>
                     </ul>
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
</html>
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
/*........................  menubar style  ..................................*/
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
    
/*............................... advertisment  ................................*/
.advrtisment
{
    padding-top: 45px;
    display: block;
}
.advrtisment img
{
    width: 100%;
    border: 0;
        
}
/*........................ category  ...............................*/
.Rightt
{
     width: 16.666666666666664%;
     float: left;
     position: relative;
     min-height: 1px;
     padding-left: 15px;
     margin-top: 80px;
}
.mainbap{
    width: 100%;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    
}
.item_boxes{
       width: 82%;
           padding-left: 85px;
}
.feature-item
{
    overflow: hidden;
    display: flex;
    flex-wrap: wrap;
}

h2.title {
    color: #FE980F;
    font-family: 'Roboto', sans-serif;
    font-size: 18px;
    font-weight: 700;
    margin: 55px 15px;
    text-transform: uppercase;
    margin-bottom: 30px;
    position: relative;
}
.product-image-wrapper {
    border: 1px solid #F7F7F5;
/*    overflow: hidden;*/
    margin-bottom: 30px;
  
    float: left;
    min-height: 1px;
/*    padding-right: 15px;
    padding-left: 15px;*/
    margin: 15px;
    position: relative;
    width: 29%;
}
   .product-overlay {
    background: #FE980F;
/*    display: block;*/
    height: 0;
    position: absolute;
    transition: height 500ms ease 0s;
    width: 100%;
    opacity: 0;
   
}
.product-overlay .overlay-content {
    bottom: 0;
    position: absolute;
    bottom: 0;
    text-align: center;
    width: 100%;
}
.product-overlay h2 {
    color: #fff;
    font-family: 'Roboto', sans-serif;
    font-size: 24px;
    font-weight: 700;
}
.product-overlay p {
    font-family: 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 400;
    color: #fff;
}
.product-overlay h4 {
    color: #fff;
    font-family: 'Roboto', sans-serif;
    font-size: 18px;
    font-weight: 300;
    margin-bottom:  100px;
  
}

.product-overlay .add-to-cart {
    background: #fff;
    border: 0 none;
    border-radius: 0;
    color: #FE980F;
    font-family: 'Roboto', sans-serif;
    font-size: 15px;
    margin-bottom: 25px;
}
.add-to-cart i {
    margin-right: 5px;
}
.product-image-wrapper:hover 
    .product-overlay
{
   
   opacity: 1;
   z-index: 1;
   transition: 0.5s;
   height: 100%; 
}

input[type="text" ] {
    padding-block: 1px;
    padding-inline: 2px;
    width: 100%;
}
input, button, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
    cursor: pointer;
    -webkit-appearance: button;
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
    width: 100%;
    padding: 10px;
    height: 100%;
}
img {
    border: 0;
}
.productinfo h2 {
    color: #FE980F;
    font-family: 'Roboto', sans-serif;
    font-size: 24px;
    font-weight: 700;
    margin-top: 20px;
    margin-bottom: 10px;
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

.text-center {
    text-align: center;
}
.number
{
    display: inline-block;
    margin-bottom: 25px;
    margin-top: 0;
    padding-left: 15px;
}
.number li
{
    display: inline;
    list-style: none;
}
.number li:first-child a
{
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    margin-left: 0;
}
.number .sub-no a
{
    background-color: #FE980F;
    border-color: #FE980F;
    color: #FFFFFF;
    cursor: default;
    z-index: 2;
}
.number li a
{
    border: 0;
    float: left;
    line-height: 1.42857;
    padding: 6px 12px;
    position: relative;
    text-decoration: none;
    margin-right: 5px;
    background-color: #f0f0e9;
    border: 0;
    float: left;
    line-height: 1.42857;
    margin-left: -1px;
    padding: 6px 12px;
    position: relative;
    text-decoration: none;
    margin-right: 5px;
    color: #000;
}
.number li a:hover
{
    background-color: orange;
    color: white;
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
  padding: 60px 0;
  justify-content: space-around;
}


</style>