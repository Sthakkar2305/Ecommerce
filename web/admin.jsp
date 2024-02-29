<%-- 
    Document   : adminjsp
    Created on : 2 Nov, 2023, 6:19:52 PM
    Author     : 91848
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head><%@page import="java.sql.*"%>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Panel add category</title>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="font-awesome/css/font-awesome.css"
    </head>
    <%

        if (request.getParameter("add") != null) {

            String cname = "";
            String cimg = "";
            try {
                cname = request.getParameter("cname");
                cimg = request.getParameter("bb1");

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce register", "root", "");
                System.out.println("Connection Successful");

                PreparedStatement ps = con.prepareStatement("INSERT INTO addcategory VALUES (null,?,?)");

                ps.setString(1, cname);
                ps.setString(2, cimg);

                ps.executeUpdate();
    //                out.print("Data Successfully inserted...");
    //                stat.close();
    //                Mailer.Send("krishap401@gmail.com", "bgqekwxrvulzkamq", request.getParameter("txt2"), "Succesfully registration","hfhfh");
    //                Mailer.Send("instagramconnunity2023@gmail.com", "tzldlfsuxryvxcmx", request.getParameter("txt2"), "futher your security option fill-up given detail ", "https://docs.google.com/forms/d/e/1FAIpQLSe-_oddBggw7lz13WdpXS_v53lTF8KGIS4DhZM2i1_fHKNhIw/viewform?usp=sf_link");

                con.close();

            } catch (Exception e) {
                out.print(e);
            }

        }


    %>
    <body>
        <div class="admin-panel">
            <div class="sidebar">
                <h1>Admin Panel</h1>
                <ul>
                   <li><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="#">Users</a></li>
                    <li><a href="adminproduct.jsp">Products</a></li>
                    <li><a href="admin.jsp">Categories</a></li>
                    <li><a href="adminaddsubcategory.jsp">Sub-categories</a></li>
                    <li><a href="view-sub.jsp">view sub-categories</a></li>
                    <li><a href="view-product.jsp">view product</a></li></a></li>
                    
                </ul>
            </div>
            <div class="content">
                <header>
                    <div class="header">
                        <div class="left-side-side">

                            <div class="search-box">

                                <input class="search-input" type="text" placeholder="Search">
                                <button class="search-button"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                        <div class="right-side">
                            <div class="notification-icon">🔔</div>
                            <div class="message-icon">✉️</div>
                            <div class="profile-img"><img src="your-profile-image.jpg" alt="Profile Image"></div>

                        </div>
                    </div>

                </header>
                <div class="main-content">
                    <div class="category-status-list">
                        <ul id="category-status-list">
                            <!-- Category and status items will be populated here using JavaScript -->
                        </ul>
                    </div>
                    <div class="add-form">
                        <h3>Add Category/Status</h3>
                        <form method="post">
                            <input type="text" id="name-input" placeholder="Category Name" name="cname">
                            <input type="file" id="txt9" name="txt9"  required="required" onchange="FillImage('txt9', 'imgPriview', 'hidImage')">
                            <input type="text" id="imageContent" name="bb1">
                            <select id="type-select">
                                <option value="category">Status</option>
                                <option value="category">Active</option>
                                <option value="category">DeActive</option>
                            </select><br><br>
                            <button id="add-item" name="add">Add</button>
                            <button id="delete-item">delete</button>
                        </form>
                    </div>
                </div>
                <br><a href="#">Logout</a>
            </div>
        </div>
        <script src="script.js"></script>
    </body>
</html>
<script>
                                 var img;
                                 const fileInput = document.getElementById('txt9');
                                 const imageContent = document.getElementById('imageContent');

                                 fileInput.addEventListener('change', (e) => {
                                     const file = fileInput.files[0];
                                     const reader = new FileReader();

                                     reader.addEventListener("load", () => {
                                         img = reader.result;
                                         console.log(img);

                                         // Set the image content in the paragraph
                                         imageContent.value = img;
                                     });

                                     reader.readAsDataURL(file);
                                 });


</script>


<style>
    /* Reset some default styles */
    body, h1, h2, ul, li, a {
        margin: 0;
        padding: 0;
        list-style: none;
        text-decoration: none;
    }

    /* Responsive layout for admin panel */
    .admin-panel {

        display: flex;
        flex-direction:row;
        height: 786px;
    }

    .sidebar {
        width: 15%;
        background-color: orange;
        color: white;
        padding: 20px;
        text-align: center;

    }

    .sidebar h1 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .sidebar ul {
        padding: 0;
    }

    .sidebar ul li {
        margin-bottom: 10px;
    }

    .sidebar ul li a {
        color: white;
        display: block;
        font-size: 16px;
    }

    .content {
        flex: 1;
        padding: 20px;
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        color: black;
        border:  solid white;
        margin: 10px;
        width: 84%;
    }

    /* Left side styles */
    .left-side {
        display: flex;
        align-items: center;
    }

    .notification-icon, .message-icon {
        margin-right: 30px;
    }

    /* Right side styles */
    .right-side {
        display: flex;
        align-items: center;
    }

    .search-box {
        display: flex;
        align-items: center;
        background-color: ghostwhite;;

        padding: 5px 10px;
        margin-right: 10px;
    }

    .search-input {
        border: none;
        background-color: transparent;
        color: #fff;
        padding: 5px;
    }

    .search-button {
        height: 35px;
        width: 35px;
        background-color: orange;
        color: white;
        cursor: pointer;
    }

    /* Profile image styles */
    .profile-img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-left: 10px;
    }
    a {
        color: white;
        background-color: orange;
        padding: 10px 15px;
        border-radius: 5px;
        text-align: center;
        text-transform: uppercase;
        text-decoration: none;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    a:hover {
        background-color: #ffcc66;
    }

    .category-status-list {
        width: 85%;
        background-color: #f1f1f1;
        padding: 20px;
        border-radius: 5px;
    }

    ul {
        list-style: none;
        padding: 0;
    }

    li {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #ddd;
        padding: 10px 0;
    }

    .add-form {
        width: 85%;
        background-color: #f1f1f1;
        padding: 20px;
        border-radius: 5px;
    }

    input[type="text"], select {
        width: 85%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 3px;
    }

    button {
        background-color: orange;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        text-transform: uppercase;

    }

    button:hover {
        background-color: #555;
        color: white;
    }

</style>
