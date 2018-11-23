<%-- 
    Document   : addstudent
    Created on : 28 Mar, 2018, 2:24:34 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%
String islogin=(String)session.getAttribute("username");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
%>

             <% 
					if(request.getAttribute("notlogin_msg")!=null){
					out.print("<font size='2' color='red' m>");
					out.print(request.getAttribute("notlogin_msg"));
					out.print("</font>");
					}
					%>
				<% 
					if(request.getAttribute("Error")!=null){
					out.print("<font size='2' color='red' >");
					out.print(request.getAttribute("Error"));
					out.print("</font>");
					}
					%>
                                        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>LNCT Quiz|ADD STUDENT</title>
 <% 
     String alert=(String)request.getAttribute("alert");
if(alert!=null)
{
%>
<script type="text/javascript">
    var msg = "<%=alert%>";
    alert(msg);
    </script>
<%
}%>
  <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
        <a href="Teacherpage.jsp"><img src="./assets/images/backb.png" alt="Back" height="55" width="55" Style="margin-left: 30px; margin-top: 30px; margin-bottom: 0px;"></a>

  <div class="login-page">
  <div class="form">
      
      <form class="login-form" method="post" action="addstudentprocess.jsp">
       <h3>ADD STUDENT</h3>
       <input type="text" placeholder="Student Username/Enroll.No." name = "susername" required/>
       <input type="text" placeholder="Student Password" name = "spassword" required/>
      <button>ENTER</button>
      
    </form>
      
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script>
</body>
</html>
