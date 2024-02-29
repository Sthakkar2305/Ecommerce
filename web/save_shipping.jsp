<%-- 
    Document   : save_shipping.jsp
    Created on : 26 Feb, 2024, 12:14:50 AM
    Author     : 91848
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%@ page import="java.sql.*, org.json.simple.JSONObject, org.json.simple.parser.JSONParser, org.json.simple.parser.ParseException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Retrieve data sent from the client
    BufferedReader reader = request.getReader();
    StringBuilder requestBody = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        requestBody.append(line);
    }

    // Parse JSON data
    JSONParser parser = new JSONParser();
    JSONObject formData = null;
    try {
        formData = (JSONObject) parser.parse(requestBody.toString());
    } catch (ParseException e) {
        e.printStackTrace();
    }

    // Extract form data
    String firstName = (String) formData.get("firstname");
    String lastName = (String) formData.get("lastname");
    // Extract other form fields similarly

    // JDBC connection code to connect to your database
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("your_database_driver_class");
        conn = DriverManager.getConnection("your_database_url", "username", "password");

        String sql = "INSERT INTO your_table (firstname, lastname, email, address, zip, country, state, mobile, altmobile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        // Set other parameters similarly
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
