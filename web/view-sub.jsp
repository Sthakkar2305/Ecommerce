<%-- 
    Document   : view-sub
    Created on : 19 Feb, 2024, 1:41:13 PM
    Author     : 91848
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><%@page import="java.sql.*"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
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
                    <li><a href="view-product.jsp">view product</a></li>
                </ul>
            </div>
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header clearfix">Sub-Categories List
                    <a href="adminaddsubcategory.jsp?page=view-sub.jsp" class="btn btn-primary pull-right">Add new</a>
                </h3>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3>Sub-Categories List</h3>
                    </div>

                    <div class="panel-body">
                        <table border="0" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 200px">ID</th>
                                    <th>category</th>
                                    <th>sub-category</th>
                                    <th>Edit</th>
                                    <th>Delete</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce register", "root", "");
                                    PreparedStatement st = con.prepareStatement("Select * from addsubcategory");
                                    ResultSet rs = st.executeQuery();
                                    while (rs.next()) {

                                %>
                                <tr>
                                    <td style="width: 200px"><%=rs.getString("subid")%></td>
                                    <td><%=rs.getString("category")%></td>
                                    <td><%=rs.getString("subcategory")%></td>
                                    <td>
                                        <a href="admin.jsp?page=dashboard.jsp&Edit=<%=rs.getString("subid")%>" class="btn btn-success">Edit</a>

   
                                    </td>
                                    <td>
                                        <a  onclick="return confirm('Are You Sure Delete categories Data?')"href="admin.jsp?page=dashboard.jsp&Delete=<%=rs.getString("subid")%>"class="btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>









                    </div>



                </div>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        </div>
<style>
    /* Reset some default styles */
    body, h1, h2, ul, li, a {
        margin: 0;
        padding: 0;
        list-style: none;
        text-decoration: none;
    }
       .admin-panel {

        display: flex;
        flex-direction:row;
        height: 786px;
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
/* Style the page header */
.page-header {
    margin: 20px 0;
}

/* Style the "Add new" button */
.btn-primary.pull-right {
    float: right;
    border: 1px solid;
    background: orange;
    text-align: center;
    color: white;
    padding: 10px;
    margin-bottom: 10px;
   
}

/* Style the panel */
.panel {
    margin: 45px 0;
    border: 1px solid #ddd;
    border-radius: 4px;
}

/* Style the panel header */
.panel-heading {
    background-color: #f5f5f5;
    border-bottom: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}
.row
{
        width: 85%;
        background-color: #f1f1f1;
        padding: 20px;
        border-radius: 5px;
        
}

/* Style the table */
.table {
    width: 100%;
    max-width: 100%;
}

/* Style the table header cells */
table th {
    background-color: #f5f5f5;
    
}

/* Style the table rows */
table tbody tr:nth-child(odd) {
    background-color: #f9f9f9;
}

/* Style the table cells */
table td {
    text-align: center;
    height: 50px;
    padding: 5px;
}

/* Style the "Edit" and "Delete" buttons */
.btn-success,
.btn-danger {
    padding: 50px 10px;
    margin: 5px;
}

/* Style confirmation dialog text */
.confirm-dialog-text {
    color: red;
}

/* Style the confirmation dialog buttons */
.confirm-dialog-buttons {
    text-align: center;
}


</style>
    </body>
</html>
