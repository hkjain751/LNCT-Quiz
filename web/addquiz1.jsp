<%-- 
    Document   : addquiz1
    Created on : 29 Mar, 2018, 7:53:58 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>LNCT Quiz|ADD QUIZ</title>
  <% 
     String alert=(String)request.getAttribute("finished");
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
      
      <form class="login-form" method="post" action="createquiz.jsp">
       <h3>ADD QUIZ</h3>
       <h6 style="color: #ff3333;">This Subject Code Quiz is Already Added
                <br>Please Check Subject Code</h6>
       <input type="text" placeholder="Subject Code" name = "subjectcode" required/>
       <input type="text" placeholder="Subject Name" name = "subject" required/>
      <input type="text" placeholder="No. of Questions For student" name = "noques" required/>
      <input type="text" placeholder="No. of Questions to add" name = "tnoques" required/>
      <input type="text" placeholder="Total Time For QUIZ in MIN" name = "ttime" required/>
      <button>ENTER</button>
    </form>
      
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script>
</body>
</html>