<%-- 
    Document   : forgot
    Created on : 17 Jul, 2023, 5:42:39 PM
    Author     : 91848
--%>

<%@page import="java.sql.*"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="MailSender.Mailer"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>SignUp</title>
        <link rel="stylesheet" type="text/css" href="Test2.css">
    </head>
    <body>
        <form method="post">

            <%

                if (request.getParameter("btn1") != null) {
                    Random ran = new Random();
                    int n = ran.nextInt(9000) + 1000;
                    out.print(n);
                    out.print("hii");
                    String s1 = String.valueOf(n);

                    Mailer.Send("thakkarsmit122@gmail.com", "naxbcvkzhhgzgpvj", request.getParameter("txt1"), "Succesfully registration", s1);
                    response.sendRedirect("otp.jsp");
                    session.setAttribute("otp", s1);
                    session.setAttribute("Email", request.getParameter("txt1"));

                }
            %>

            <div class="container">
                <div id="title">
                    <span id="Verification">Verification</span>
                </div>

                <div class="Email">
                    <label>Email</label>
                    <input type="email" id="Email" name="txt1" required>
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

                </style>