<%-- 
    Document   : addnewques
    Created on : 1 Apr, 2018, 11:18:12 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.awt.Dialog"%>

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
					 <% 
                                             String quiz;
					 	if(request.getParameter("item")!=null){
                                                    quiz=(String)request.getParameter("item");
                                                    session.setAttribute("quizcode",quiz );
                                                }
                                                else if(session.getAttribute("quizcode")!=null)
                                                {
                                                    quiz=(String)session.getAttribute("quizcode");
                                                }
                                                else
                                                {
                                        request.setAttribute("finished","Something went Wrong in Select Quiz");
   			
   					%>
   				          <jsp:forward page="newaddques.jsp"></jsp:forward>
   							          <% 
   							             }
                                             

%>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>LNCT Quiz Login</title>
  <% 
     String alert=(String)request.getAttribute("added");
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

    <a href="newaddques.jsp"><img src="./assets/images/backb.png" alt="Back" height="55" width="55" Style="margin-left: 30px; margin-top: 30px; margin-bottom: 0px;"></a>

  <div class="login-page">
  <div class="form">
                  
                		<form class="login-form" method="post" action="addques.jsp" >
					<table>
                                            <tr><td>Question:</td><td><textarea rows="3" cols="25" name="question" required ></textarea></td></tr>
					<tr><td>Option1:</td><td><input type="text" name="option1" required/></td></tr>	
					<tr><td>Option2:</td><td><input type="text" name="option2" required/></td></tr>
                                        <tr><td>Option3:</td><td><input type="text" name="option3" required/></td></tr>
					<tr><td>Option4:</td><td><input type="text" name="option4" required/></td></tr>
					<tr><td>Answer:</td><td><input type="text" name="answer" required/></td></tr>	
					<tr><td>Description:</td><td><input type="text" name="description" /></td></tr>	
                                        <tr><td></td><td><button>ADD</button></td></tr>
                    </table>
                     </form>
      </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>
</body></html>
