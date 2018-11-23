<%-- 
    Document   : fillinfo
    Created on : 16 Apr, 2018, 2:35:48 PM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String username=(String)session.getAttribute("usernamest");
if(username==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>LNCT Quiz Fill Information</title>
  <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
    <a href="login.jsp"><img src="./assets/images/backb.png" alt="Back" height="55" width="55" Style="margin-left: 30px; margin-top: 30px; margin-bottom: 0px;"></a>

  <div class="login-page">
      
  <div class="form">
      <a href="index.html"><img src="assets/images/lnct.png" height="75" width="250"/></a>
      
    <form class="login-form" method="post" action="fillinfo1.jsp">
        <h3>Fill Your Details</h3>
        <input type="text" placeholder="Enrollment No." name = "enrollment" value="<%=username %>"  required/>
      	<input type="text" placeholder="Name" name = "name" required/>
        <input type="text" placeholder="Email" name = "email" required/>
        <input type="text" placeholder="Mobile No." name = "mob" required/>
        <select name="course" style="font-family:Roboto,sans-serif; outline: 0; background: #f2f2f2; width: 100%; border: 1px; margin: 0 0 15px; padding: 15px; box-sizing: border-box; font-size: 14px;">
          <option value="">Select Your Course</option>
          <option value="B.E.">B.E.</option>
          <option value="B.TECH">B.TECH</option>
          <option value="M.TECH">M.TECH</option>
          <option value="OTHER">OTHER</option>
        </select>
        <select name="branch" style="font-family:Roboto,sans-serif; outline: 0; background: #f2f2f2; width: 100%; border: 1px; margin: 0 0 15px; padding: 15px; box-sizing: border-box; font-size: 14px;">
          <option value="">Select Your Branch</option>
          <option value="IT">IT</option>
          <option value="CSE">CSE</option>
          <option value="ME">ME</option>
          <option value="CE">CE</option>
          <option value="EC">EC</option>
          <option value="EE">EE</option>
          <option value="EX">EX</option>
          <option value="EI">EI</option>
          <option value="CHE">CHE</option>
          <option value="OTHER">OTHER</option>
        </select>
        <select name="college" style="font-family:Roboto,sans-serif; outline: 0; background: #f2f2f2; width: 100%; border: 1px; margin: 0 0 15px; padding: 15px; box-sizing: border-box; font-size: 14px;">
          <option value="">Select Your College</option>
          <option value="LNCT,Bhopal">LNCT,Bhopal</option>
          <option value="LNCTS,Bhopal">LNCTS,Bhopal</option>
          <option value="LNCTE,Bhopal">LNCTE,Bhopal</option>
          <option value="Other">Other</option>
        </select>
        
      	<button>Enter</button>
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="js/index.js"></script>
</body>
</html>
