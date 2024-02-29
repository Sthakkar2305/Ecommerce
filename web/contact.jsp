<%-- 
    Document   : contact
    Created on : 22 Jul, 2023, 6:05:36 PM
    Author     : 91848
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu1</title>
    <link rel="stylesheet" href="mysite.css">
    <link rel="stylesheet" href="grid940.css">

    <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
</head>
<body>
  <header>
    <div class="container">
    <div class="menu">
        <div class="row">
            <div class="col-5">
                <div class="logo">
                    <img src="logo.png">
                   
                </div>
            </div>
            <div class="col-7">
                <div class="nav">
                    <ul>
                        <li><a href="Home.jsp"><i class="fa fa-home ic"></i>Home</a></li>
                        <li> <a href="#"><i class="fa fa-star ic"></i> Wishlist</a></li>
                        <li><a href="#"><i class="fa fa-shopping-cart ic"></i>cart</a></li>
                        <li><a href="contact.jsp"><i class="fa fa-phone ic"></i>Contact US</a></li>
                        <li><a href="Register.jsp"><i class="fa fa-lock ic"></i><%out.print(value);%></a></li>
<!--                        <li><a href="#">Feauters</a></li>
                        <li><a href="#">Contact US</a></li>-->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
  </header>
          
</body>
</html>
<style>
    .menu
{
  margin-top: 20px;
}

.logo
{
  text-align: left;
  
}

.logo p
{
  color: rgb(9, 209, 209);
font-family: sans-serif;
font-size: 36px;
line-height: 50px;
letter-spacing: 1px;
}

.nav
{
  line-height: 28px;
}

.menu ul li
{
  float: left;
  list-style: none;
}

.menu ul li a
{
  color: grey;
  text-decoration: none;
  padding: 10px 20px;
  display: block;
}
.ic
{
    margin-right: 6px;
}
.menu ul li:hover
{
  background-color: #FE980F;
  border-radius: 50px;
}

.menu ul li a:hover
{
  color: white;
  
}


* {
    margin: 0;
    padding: 0;
}

.container {
    width: 940px;
    margin: auto;
}


.row {
    margin-left: -20px;
}

.row::after {
    clear: both;
    content: "";
    display: block;
}

[class*="col-"] {
    margin-left: 20px;
    float: left;
    min-height: 30px;
    /*temp*/
    /* background-color: rgb(214, 244, 245);    */

}

.footer
{
    width: 940px;
    
    margin: 20px auto;
}
.col-1 {
    width: 60px;
}

.col-2 {
    width: 140px;
}

.col-3 {
    width: 220px;
}

.col-4 {
    width: 300px;
}

.col-5 {
    width: 380px;
}

.col-6 {
    width: 460px;
}

.col-7 {
    width: 540px;
}

.col-8 {
    width: 620px;
}

.col-9 {
    width: 700px;
}

.col-10 {
    width: 780px;
}

.col-11 {
    width: 860px;
}

.col-12 {
    width: 940px;
}

.h-border
{
    border-top: 1px solid #e3e3e3;
    border-bottom: 1px solid #e3e3e3;
    padding-top: 10px;
    padding-bottom: 10px;   
    margin-top: 30px;
    margin-bottom: 10px;
}
</style>
<div class="new_home_web">
  <div class="responsive-container-block big-container">
    <img class="imgBG" src="https://workik-widget-assets.s3.amazonaws.com/widget-assets/images/aw65.png">
    <div class="responsive-container-block textContainer">
      <div class="topHead">
        <p class="text-blk heading">
          Get in
          <span class="orangeText">
            touch
          </span>
        </p>
        <div class="orangeLine" id="w-c-s-bgc_p-2-dm-id">
        </div>
      </div>
      <p class="text-blk subHeading">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna al iqua.
      </p>
    </div>
    <div class="responsive-container-block container">
      <div class="responsive-cell-block wk-tab-12 wk-mobile-12 wk-desk-7 wk-ipadp-10 line" id="i69b">
        <form class="form-box">
          <div class="container-block form-wrapper">
            <div class="responsive-container-block">
              <div class="left4">
                <div class="responsive-cell-block wk-ipadp-6 wk-tab-12 wk-mobile-12 wk-desk-6" id="i10mt-2">
                  <input class="input" id="ijowk-2" name="FirstName" placeholder="First Name">
                </div>
                <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                  <input class="input" id="indfi-2" name="Last Name" placeholder="Last Name">
                </div>
                <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12">
                  <input class="input" id="ipmgh-2" name="Email" placeholder="Email Address">
                </div>
                <div class="responsive-cell-block wk-desk-6 wk-ipadp-6 wk-tab-12 wk-mobile-12 lastPhone">
                  <input class="input" id="imgis-2" name="PhoneNumber" placeholder="Phone Number">
                </div>
              </div>
              <div class="responsive-cell-block wk-tab-12 wk-mobile-12 wk-desk-12 wk-ipadp-12" id="i634i-2">
                <textarea class="textinput" id="i5vyy-2" placeholder="Message"></textarea>
              </div>
            </div>
            <a class="send" href="#" id="w-c-s-bgc_p-1-dm-id">
                
                <input class="btn0" type="submit" name="btn1" value="send">
            </a>
          </div>
        </form>
      </div>
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
<style>
    .new_home_web .text-blk.subHeading {
  text-align: center;
  color: #939393;
  max-width: 630px;
}

.new_home_web .text-blk.heading {
  font-size: 36px;
  line-height: 55px;
  font-weight: 600;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 20px;
  margin-left: 0px;
}
.btn0{
    padding: 5px;
    font-size: 20px;
    text-transform: capitalize;
    background-color: transparent;
    color: white;
    font-weight: bold;
    border: none;
}

.new_home_web .responsive-container-block.textContainer {
  flex-direction: column;
  align-items: center;
  margin-top: 50px;
  margin-right: 0px;
  margin-bottom: 40px;
  margin-left: 0px;
  max-width: 1320px;
  z-index: 50;
}

.new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-12.wk-ipadp-12 {
  width: 50%;
  padding-top: 0px;
  padding-right: 0px;
  padding-bottom: 25px;
  padding-left: 10px;
}

.new_home_web .send:hover {
  background-image: initial;
  background-position-x: initial;
  background-position-y: initial;
  background-size: initial;
  background-repeat-x: initial;
  background-repeat-y: initial;
  background-attachment: initial;
  background-origin: initial;
  background-clip: initial;
}

.new_home_web .send {
  font-size: 18px;
  color: white;
  font-weight: 600;
  background-color: orange;
  width: 80%;
  text-align: center;
  padding-top: 15px;
  padding-right: 0px;
  padding-bottom: 15px;
  padding-left: 0px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 0px;
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border-bottom-right-radius: 0px;
  border-bottom-left-radius: 0px;
}

.new_home_web .container-block.form-wrapper {
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  justify-content: space-evenly;
  flex-wrap: wrap;
  z-index: 50;
}

.new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-7.wk-ipadp-10.line {
  width: 100%;
  padding-top: 0px;
  padding-right: 0px;
  padding-bottom: 0px;
  padding-left: 0px;
  max-width: 1100px;
}

.new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-5.wk-ipadp-10 {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 30%;
  max-width: 310px;
  padding-top: 0px;
  padding-right: 40px;
  padding-bottom: 0px;
  padding-left: 0px;
}

.new_home_web .responsive-cell-block.wk-ipadp-6.wk-tab-12.wk-mobile-12.wk-desk-6 {
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 30px;
  margin-left: 0px;
  padding-top: 0px;
  padding-right: 10px;
  padding-bottom: 0px;
  padding-left: 10px;
  width: 100%;
}

.new_home_web .textinput {
  height: 100%;
  width: 100%;
  border-top-width: 2px;
  border-right-width: 2px;
  border-bottom-width: 2px;
  border-left-width: 2px;
  border-top-style: solid;
  border-right-style: solid;
  border-bottom-style: solid;
  border-left-style: solid;
  border-top-color: #a2a2a2;
  border-right-color: #a2a2a2;
  border-bottom-color: #a2a2a2;
  border-left-color: #a2a2a2;
  border-image-source: initial;
  border-image-slice: initial;
  border-image-width: initial;
  border-image-outset: initial;
  border-image-repeat: initial;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-bottom-left-radius: 5px;
  font-size: 16px;
  padding-top: 20px;
  padding-right: 30px;
  padding-bottom: 20px;
  padding-left: 20px;
  background-color: #f1f1f1;
}

.new_home_web .input {
  height: 50px;
  width: 100%;
  border-top-width: 2.5px;
  border-right-width: 2.5px;
  border-bottom-width: 2.5px;
  border-left-width: 2.5px;
  border-top-style: solid;
  border-right-style: solid;
  border-bottom-style: solid;
  border-left-style: solid;
  border-top-color: #a2a2a2;
  border-right-color: #a2a2a2;
  border-bottom-color: #a2a2a2;
  border-left-color: #a2a2a2;
  border-image-source: initial;
  border-image-slice: initial;
  border-image-width: initial;
  border-image-outset: initial;
  border-image-repeat: initial;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-bottom-left-radius: 5px;
  font-size: 16px;
  padding-top: 5px;
  padding-right: 15px;
  padding-bottom: 5px;
  padding-left: 15px;
  background-color: #f1f1f1;
}

.new_home_web .responsive-container-block.big-container {
  padding-top: 0px;
  padding-right: 50px;
  padding-bottom: 0px;
  padding-left: 50px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
}

.new_home_web .responsive-container-block.container {
  max-width: 1320px;
  flex-direction: row-reverse;
  justify-content: center;
  align-items: center;
  margin-top: 0px;
  margin-right: auto;
  margin-bottom: 60px;
  margin-left: auto;
  z-index: 50;
}

.new_home_web .responsive-cell-block {
  min-height: 75px;
}

.new_home_web textarea:focus {
  outline-color: initial;
  outline-style: none;
  outline-width: initial;
}

.new_home_web input:focus {
  outline-color: initial;
  outline-style: none;
  outline-width: initial;
}

.new_home_web a {
  text-decoration-line: none;
  text-decoration-thickness: initial;
  text-decoration-style: initial;
  text-decoration-color: initial;
}

.new_home_web .responsive-container-block {
  min-height: 75px;
  height: fit-content;
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  margin-top: 0px;
  margin-right: auto;
  margin-bottom: 40px;
  margin-left: auto;
}

.new_home_web * {
  font-family: Nunito, sans-serif;
}

.new_home_web .text-blk {
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 0px;
  line-height: 25px;
  padding-top: 0px;
  padding-right: 0px;
  padding-bottom: 0px;
  padding-left: 0px;
}

.new_home_web .left4 {
  width: 50%;
  padding-top: 0px;
  padding-right: 10px;
  padding-bottom: 0px;
  padding-left: 0px;
}

.new_home_web .responsive-cell-block.wk-desk-6.wk-ipadp-6.wk-tab-12.wk-mobile-12.lastPhone {
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 0px;
}

.new_home_web .orangeText {
  color: orange;
}

.new_home_web .orangeLine {
  height: 10px;
  width: 160px;
  background-color: orange;
}

.new_home_web .topHead {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 40px;
  margin-left: 0px;
  margin: 0 0 25px 0;
}

.new_home_web .imgBG {
  position: absolute;
  width: 80%;
  height: 100%;
  left: auto;
  right: 0px;
  top: auto;
  bottom: 0px;
}

@media (max-width: 1024px) {
  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-5.wk-ipadp-10 {
    margin-top: 60px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
  }

  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-7.wk-ipadp-10.line {
    padding-top: 0px;
    padding-right: 20px;
    padding-bottom: 60px;
    padding-left: 0px;
  }

  .new_home_web .responsive-container-block.container {
    justify-content: center;
  }
}

@media (max-width: 768px) {
  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-12.wk-ipadp-12 {
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
  }

  .new_home_web .responsive-cell-block.wk-ipadp-6.wk-tab-12.wk-mobile-12.wk-desk-6 {
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    margin: 0 0 10px 0;
  }

  .new_home_web .container-block.form-wrapper {
    align-items: center;
  }

  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-5.wk-ipadp-10 {
    width: 100%;
    margin-top: 30px;
    margin-right: 0px;
    margin-bottom: 0px;
    margin-left: 0px;
  }

  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-7.wk-ipadp-10.line {
    width: 100%;
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 20px;
    padding-left: 0px;
  }

  .new_home_web .responsive-container-block.container {
    flex-direction: column;
  }

  .new_home_web .textinput {
    width: 100%;
  }

  .new_home_web .input {
    width: 100%;
  }

  .new_home_web .left4 {
    padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
    width: 100%;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 25px;
    margin-left: 0px;
  }

  .new_home_web .responsive-container-block {
    flex-direction: column;
    align-items: center;
  }

  .new_home_web .textinput {
    height: 200px;
  }

  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-12.wk-ipadp-12 {
    width: 100%;
  }

  .new_home_web .imgBG {
    width: 100%;
    height: 90%;
    top: auto;
    left: auto;
  }

  .new_home_web .text-blk.heading {
    font-size: 30px;
  }
}

@media (max-width: 500px) {
  .new_home_web .responsive-cell-block.wk-tab-12.wk-mobile-12.wk-desk-5.wk-ipadp-10 {
    flex-wrap: wrap;
  }

  .new_home_web .send {
    padding-top: 15px;
    padding-right: 0px;
    padding-bottom: 15px;
    padding-left: 0px;
    text-align: center;
    width: 70%;
  }

  .new_home_web .responsive-container-block.big-container {
    padding-top: 0px;
    padding-right: 20px;
    padding-bottom: 0px;
    padding-left: 20px;
  }

  .new_home_web .text-blk.heading {
    font-size: 30px;
    text-align: center;
    line-height: 35px;
  }

  .new_home_web .send {
    width: 100%;
    max-width: 250px;
  }

  .new_home_web .imgBG {
    height: 60%;
  }

  .new_home_web .text-blk.subHeading {
    font-size: 16px;
    line-height: 24px;
  }

  .new_home_web .responsive-container-block.textContainer {
    margin: 50px 0 30px 0;
  }

  .new_home_web .input {
    height: 45px;
  }

  .new_home_web .responsive-cell-block.wk-ipadp-6.wk-tab-12.wk-mobile-12.wk-desk-6 {
    margin: 0 0 10px 0;
  }
}

*,
*:before,
*:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  margin: 0;
}

.wk-desk-1 {
  width: 8.333333%;
}

.wk-desk-2 {
  width: 16.666667%;
}

.wk-desk-3 {
  width: 25%;
}

.wk-desk-4 {
  width: 33.333333%;
}

.wk-desk-5 {
  width: 41.666667%;
}

.wk-desk-6 {
  width: 50%;
}

.wk-desk-7 {
  width: 58.333333%;
}

.wk-desk-8 {
  width: 66.666667%;
}

.wk-desk-9 {
  width: 75%;
}

.wk-desk-10 {
  width: 83.333333%;
}

.wk-desk-11 {
  width: 91.666667%;
}

.wk-desk-12 {
  width: 100%;
}

@media (max-width: 1024px) {
  .wk-ipadp-1 {
    width: 8.333333%;
  }

  .wk-ipadp-2 {
    width: 16.666667%;
  }

  .wk-ipadp-3 {
    width: 25%;
  }

  .wk-ipadp-4 {
    width: 33.333333%;
  }

  .wk-ipadp-5 {
    width: 41.666667%;
  }

  .wk-ipadp-6 {
    width: 50%;
  }

  .wk-ipadp-7 {
    width: 58.333333%;
  }

  .wk-ipadp-8 {
    width: 66.666667%;
  }

  .wk-ipadp-9 {
    width: 75%;
  }

  .wk-ipadp-10 {
    width: 83.333333%;
  }

  .wk-ipadp-11 {
    width: 91.666667%;
  }

  .wk-ipadp-12 {
    width: 100%;
  }
}

@media (max-width: 768px) {
  .wk-tab-1 {
    width: 8.333333%;
  }

  .wk-tab-2 {
    width: 16.666667%;
  }

  .wk-tab-3 {
    width: 25%;
  }

  .wk-tab-4 {
    width: 33.333333%;
  }

  .wk-tab-5 {
    width: 41.666667%;
  }

  .wk-tab-6 {
    width: 50%;
  }

  .wk-tab-7 {
    width: 58.333333%;
  }

  .wk-tab-8 {
    width: 66.666667%;
  }

  .wk-tab-9 {
    width: 75%;
  }

  .wk-tab-10 {
    width: 83.333333%;
  }

  .wk-tab-11 {
    width: 91.666667%;
  }

  .wk-tab-12 {
    width: 100%;
  }
}

@media (max-width: 500px) {
  .wk-mobile-1 {
    width: 8.333333%;
  }

  .wk-mobile-2 {
    width: 16.666667%;
  }

  .wk-mobile-3 {
    width: 25%;
  }

  .wk-mobile-4 {
    width: 33.333333%;
  }

  .wk-mobile-5 {
    width: 41.666667%;
  }

  .wk-mobile-6 {
    width: 50%;
  }

  .wk-mobile-7 {
    width: 58.333333%;
  }

  .wk-mobile-8 {
    width: 66.666667%;
  }

  .wk-mobile-9 {
    width: 75%;
  }

  .wk-mobile-10 {
    width: 83.333333%;
  }

  .wk-mobile-11 {
    width: 91.666667%;
  }

  .wk-mobile-12 {
    width: 100%;
  }
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
    