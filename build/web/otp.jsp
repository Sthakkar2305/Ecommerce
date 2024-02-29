<%-- 
    Document   : otp
    Created on : 17 Jul, 2023, 6:16:08 PM
    Author     : 91848
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="MailSender.Mailer"%>
<%@page import="java.util.*" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">


            <%
              
                 session.setAttribute("Email",session.getAttribute("Email"));
                if (request.getParameter("btn1") != null) {

                    if (request.getParameter("txt1").toString().equals(session.getAttribute("otp").toString())) {
                        response.sendRedirect("contactus.jsp");
                      
                       
                      
                    }
                }

            %>
            <div class="container">
                <div id="title">
                    <span id="signup-title">Otp</span>
                </div>
                <div class="OTP">
                    <label> E-mail:-</label><span id="mail"><%=session.getAttribute("Email").toString()%></span><br><br>
                    <label>Enter-OTP</label>
                    <input type="text" id="OTP" name="txt1" required>
                </div>

                <input type="submit" value="Submit" id="verify" name="btn1" />
            </div>   
            </body>
                </html>
                <style>
                     *
                    {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }
                    body{
                        display: flex;
                        justify-content: center;
                        flex-direction: column;
                        align-items: center;
                        background-color: orange;
                    }
                    .container{
                        height: 300px;
                        width: 300px;
                        background-color: buttonface;
                        margin: 150px;
                        padding: 7px;
                        display: flex;
                        justify-content: center;
                        flex-direction: column;
                        text-align: center;
                    }
                   input[type="submit"] {
                      width: 30%;
                      margin-left: 100px;
                      margin-top: 25px;
                     }
                     #title
                     {
                        margin: 15px;
                        color: orange;
                        font-size: larger;
                     }
                      #mail
                     {
                         background-color: white;
                         border: 1px solid black;
                         padding: 2px;
                     }
                     

                </style>
