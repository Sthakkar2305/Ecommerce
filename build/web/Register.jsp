<%-- 
    Document   : Ecommerce
    Created on : 7 Jul, 2023, 5:48:45 PM
    Author     : 91848
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart ic"></i>cart</a></li>
                                    <li><a href="contact.jsp"><i class="fa fa-phone ic"></i>Contact US</a></li>
                                    <li><a href="Register.jsp"><i class="fa fa-lock ic"></i>Login</a></li>
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
        font-size: 15px;
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
<!DOCTYPE html>

<html>
    <head><%@page import="java.sql.*"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if (request.getParameter("Signup") != null) {
            String Name = "", Email = "", Password = "", confirmpassword = "", Phone = "";
            try {
                Name = request.getParameter("text2");
                Email = request.getParameter("text1");
                Password = request.getParameter("password");
                confirmpassword = request.getParameter("cpassword");
                Phone = request.getParameter("text");

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce register", "root", "");

                PreparedStatement ps = con.prepareStatement("INSERT INTO `signup`(`Name`, `Email`, `phone`, `password`, `confirmpassword`) VALUES (?,?,?,?,?)");
                ps.setString(1, Name);
                ps.setString(2, Email);
                ps.setString(3, Phone);
                ps.setString(4, Password);
                ps.setString(5, confirmpassword);

                ps.executeUpdate();

                con.close();

            } catch (Exception e) {
                out.print(e);
            }
        }

        if (request.getParameter("Login") != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce register", "root", "");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM signup WHERE Email =? AND password =?");
                ps.setString(1, request.getParameter("text11"));
                ps.setString(2, request.getParameter("text12"));
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    response.sendRedirect("Home.jsp");
                    out.print("send");
                } else {
                    out.print("<script>alert('wrong...')</script>");
                }

                PreparedStatement ps1 = con.prepareStatement("SELECT Name, userid FROM signup WHERE Email =?");
                ps1.setString(1, request.getParameter("text11"));
                ResultSet re = ps1.executeQuery();

                if (re.next()) {
                    String name = re.getString("Name");
                    String userid = re.getString("userid");
                    session.setAttribute("ps0", name);
                    session.setAttribute("ps1", userid);
                }

                con.close();
            } catch (Exception e) {
                out.print(e);
            }
        }
    %>

    <html>
        <body>
            <div class="mainw">
                <div class="imagew">
                    <img class="imgl" src="receptionist.png ">

                    </img>

                </div>

                <div class="wrapper">
                    <div class="title-text">
                        <!--        <div class="title login">Login Form</div>
                                <div class="title signup">Signup Form</div>-->
                    </div>
                    <div class="form-container">
                        <div class="slide-controls">
                            <input type="radio" name="slide" id="login" checked>
                            <input type="radio" name="slide" id="signup">
                            <label for="login" class="slide login">Login</label>
                            <label for="signup" class="slide signup">Signup</label>
                            <div class="slider-tab"></div>
                        </div>
                        <div class="form-inner">


                            <form  class="login" method="post">
                                <div class="field">
                                    <input type="email" name="text11" placeholder="Email Address" required>
                                </div>
                                <div class="field">
                                    <input type="password" name="text12" placeholder="Password"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 3}$" required>
                                </div>
                                <div class="pass-link"><a href="forgot.jsp">Forgot password?</a></div>
                                <div class="field btn">
                                    <div class="btn-layer"></div>
                                    <input type="submit" name="Login" value="Login">
                                </div>
                                <div class="signup-link">Not a member? <a href="">Signup now</a></div>



                            </form>
                            <form action="#" class="signup" method="post">
                                <div class="field">
                                    <input type="text" name="text2" placeholder="Username" required>
                                </div>
                                <div class="field">
                                    <input type="text" name="text1" placeholder="Email Address" required>
                                </div>

                                <div class="field">
                                    <!--                  <select class="gender">
                                                          <option value="0">Select Your gender</option>
                                                          <option value="0">Male</option>
                                                          <option value="0">Female</option>
                                                      </select>  -->
                                    <input type="text" name="text" placeholder="Phone Number" required>
                                </div>



                                <div class="field">
                                    <input type="password" name="password" placeholder="Password" required>
                                </div>
                                <div class="field">
                                    <input type="password" name="cpassword" placeholder="Confirm password" required>
                                </div>
                                <div class="field btn">
                                    <div class="btn-layer"></div>
                                    <input type="submit" value="Signup" name="Signup">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </body>
    </html>
    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;

        }
        html,body{
            display: grid;
            height: 100%;
            width: 100%;
            place-items: center;
            /*  background: -webkit-linear-gradient(left, #003366,#004080,#0059b3
            , #0073e6);*/
        }
        ::selection{
            background: #1a75ff;
            color: #fff;
        }
        .mainw{
            display: flex;
            justify-content: space-around;
        }
        .wrapper{
            overflow: hidden;
            max-width: 390px;
            background: #fff;

            padding: 30px;
            border-radius: 15px;
            /*  box-shadow: 0px 15px 20px rgba(0,0,0,0.1);*/
        }
        .wrapper .title-text{
            display: flex;
            width: 200%;
        }

        .imgl
        {
            height: 510px;
            margin-right: 150PX;
            margin-top:  25PX;
            width: 500px;
        }

        .wrapper .title{
            width: 50%;
            font-size: 35px;
            font-weight: 600;
            text-align: center;
            transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
        }
        .wrapper .slide-controls{
            position: relative;
            display: flex;
            height: 50px;
            width: 100%;
            overflow: hidden;
            margin: 30px 0 10px 0;
            justify-content: space-between;
            border: 1px solid lightgrey;
            border-radius: 15px;
        }
        .gender
        {
            height: 50px;
            width: 100%;
            color: grey;
            font-size: 17px;
            padding-left: 10px;
            transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
            border: 1px solid lightgrey;
            border-radius: 15px;
        }
        .slide-controls .slide{
            height: 100%;
            width: 100%;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            text-align: center;
            line-height: 48px;
            cursor: pointer;
            z-index: 1;
            transition: all 0.6s ease;
        }
        .slide-controls label.signup{
            color: #000;
        }
        .slide-controls .slider-tab{
            position: absolute;
            height: 100%;
            width: 50%;
            left: 0;
            z-index: 0;
            border-radius: 15px;
            background: #FE980F;
            transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
        }
        input[type="radio"]{
            display: none;
        }
        #signup:checked ~ .slider-tab{
            left: 50%;
        }
        #signup:checked ~ label.signup{
            color: #fff;
            cursor: default;
            user-select: none;
        }
        #signup:checked ~ label.login{
            color: #000;
        }
        #login:checked ~ label.signup{
            color: #000;
        }
        #login:checked ~ label.login{
            cursor: default;
            user-select: none;
        }
        .wrapper .form-container{
            width: 100%;
            overflow: hidden;
        }
        .form-container .form-inner{
            display: flex;
            width: 200%;
        }
        .form-container .form-inner form{
            width: 50%;
            transition: all 0.6s cubic-bezier(0.68,-0.55,0.265,1.55);
        }
        .form-inner form .field{
            height: 50px;
            width: 100%;
            margin-top: 20px;
        }
        .form-inner form .field input{
            height: 100%;
            width: 100%;
            outline: none;
            padding-left: 15px;
            border-radius: 15px;
            border: 1px solid lightgrey;
            border-bottom-width: 2px;
            font-size: 17px;
            transition: all 0.3s ease;
        }
        .form-inner form .field input:focus{
            border-color: #1a75ff;
            /* box-shadow: inset 0 0 3px #fb6aae; */
        }
        .gender:hover{
            border-color: #1a75ff;
            color: #1a75ff;
        }

        .form-inner form .field input::placeholder{
            color: #999;
            transition: all 0.3s ease;
        }
        form .field input:focus::placeholder{
            color: #1a75ff;
        }
        .form-inner form .pass-link{
            margin-top: 5px;
        }
        .form-inner form .signup-link{
            text-align: center;
            margin-top: 30px;
        }
        .form-inner form .pass-link a,
        .form-inner form .signup-link a{
            color: #FE980F;
            text-decoration: none;
        }
        .form-inner form .pass-link a:hover,
        .form-inner form .signup-link a:hover{
            text-decoration: underline;
        }
        form .btn{
            height: 50px;
            width: 100%;
            border-radius: 15px;
            position: relative;
            overflow: hidden;
        }
        form .btn .btn-layer{
            height: 100%;
            width: 300%;
            position: absolute;
            left: -100%;
            background: #FE980F;
            border-radius: 15px;
            transition: all 0.4s ease;;
        }
        form .btn:hover .btn-layer{
            left: 0;
        }
        form .btn input[type="submit"]{
            height: 100%;
            width: 100%;
            z-index: 1;
            position: relative;
            background: none;
            border: none;
            color: #fff;
            padding-left: 0;
            border-radius: 15px;
            font-size: 20px;
            font-weight: 500;
            cursor: pointer;
        }


    </style>
    <script>
        const loginText = document.querySelector(".title-text .login");
        const loginForm = document.querySelector("form.login");
        const loginBtn = document.querySelector("label.login");
        const signupBtn = document.querySelector("label.signup");
        const signupLink = document.querySelector("form .signup-link a");
        signupBtn.onclick = (() => {
            loginForm.style.marginLeft = "-50%";
            loginText.style.marginLeft = "-50%";
        });
        loginBtn.onclick = (() => {
            loginForm.style.marginLeft = "0%";
            loginText.style.marginLeft = "0%";
        });
        signupLink.onclick = (() => {
            signupBtn.click();
            return false;
        });

    </script>
