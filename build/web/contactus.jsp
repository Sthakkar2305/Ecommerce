<%-- 
    Document   : contactus
    Created on : 13 Jul, 2023, 12:08:31 PM
    Author     : 91848
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><%@page import="java.sql.*"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
      
        
            
        if (request.getParameter("btn") != null) {
            
            
             
            
            String Pass = "", confirmpass = "";
            try {
                session.getAttribute("Email");
                Pass = request.getParameter("Lemail");
                confirmpass = request.getParameter("Lpass");

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce register", "root", "");
                System.out.println("Connection Successful");

                String sql = "UPDATE `signup` SET `password`='" +Pass +"',`confirmpassword`='" + confirmpass + "' where email='" + session.getAttribute("Email").toString() + "'";
                PreparedStatement ps = con.prepareStatement(sql);
//                ps.setString(1,Password);
                //              ps.setString(2, confirmpassword); 

                ps.executeUpdate();
//                           
                //ResultSet rs = ps.executeQuery();
                // if (rs.next()) {
                out.print("<script>window.location.href='Register.jsp'</script> ");
                // } else {
                //   out.print("Username or Password is Wrong.");
                // out.print("<script>alert('wrong...')</script>");
                //  }

            } catch (Exception e) {
                out.print(e);
            }

        }


    %>
    <body>
        <div class="wrapper">
            <div class="title-text">
                <div class="title login">Change Password</div>
            </div>
            <div class="form-container">

                <div class="form-inner">
                    <!--   login form   -->
                    <form  class="login"  method="post">
                        <div class="field">
                            <div class="signup-link">Enter New Password <a href=""></a></div>
                            <input type="password" placeholder="Password" name="Lemail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 3}$" required>
                        </div>
                          <div class="field">
                            <div class="signup-link">Confirm Password <a href=""></a></div>
                            <input type="password" placeholder="Confirm Password" name="Lpass" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 3}$" required>
                        </div>

                        <div class="field btn">
                            <div class="btn-layer">
                                <input type="submit" name="btn">
                            </div>
                        </div>
                        <!--<div class="signup-link">Not a member? <a href="">Signup now</a></div>-->
                    </form>


                </div>
            </div>
        </div>

        <style>

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            html,body{
                display: grid;
                height: 100%;
                width: 100%;
                place-items: center;
                background: orange;
            }
            ::selection{
                background: #1a75ff;
                color: #fff;
            }
            .wrapper{
                overflow: hidden;
                max-width: 390px;
                height: 340px;
                background: #fff;
                padding: 30px;
                border-radius: 15px;
                box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
            }
            .wrapper .title-text{
                display: flex;
                width: 200%;
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
                margin: 20px 0 10px 0;
                justify-content: space-between;
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
                background: -webkit-linear-gradient(left,#003366,#004080,#0059b3
                    , #0073e6);
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
                height: 40px;
                width: 100%;
                margin-top: 10px;
            }
            .form-inner form .field input{
                height: 100%;
                width: 100%;
                outline: none;
                padding-left: 15px;
                border-radius: 15px;
                border: 1px solid lightgrey;
                border-bottom-width: 2px;
                font-size: 15px;
                transition: all 0.3s ease;
            }
            .form-inner form .field input:focus{
                border-color: #1a75ff;
                /* box-shadow: inset 0 0 3px #fb6aae; */
            }
            .form-inner form .field input::placeholder{
                color: #999;
                transition: all 0.3s ease;
            }
            form .field input:focus::placeholder{
                color: #1a75ff;
            }
            .form-inner form .pass-link{
                margin-top: 25px;
                font-size: 15px;
                margin-left: 5px;
            }
            .form-inner form .signup-link{
                text-align: left;
                margin-top: 30px;
                margin-bottom: 5px;
            }
            .form-inner form .pass-link a,
            .form-inner form .signup-link a{
                color: #1a75ff;
                text-decoration: none;
            }
            .form-inner form .pass-link a:hover,
            .form-inner form .signup-link a:hover{
                text-decoration: underline;
            }
            form .btn{
                top: 35px;
                margin-top: 300px;
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
                background: orange;
                border-radius: 15px;
                transition: all 0.4s ease;;
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

    </body>
</html>