<%-- 
    Document   : givequiz
    Created on : 11 Apr, 2018, 12:36:54 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%
String islogin=(String)session.getAttribute("usernamest");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
} 
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
  <title>LNCT Quiz|GIVE QUIZ</title>
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
    <div class="animated yt-loader"></div>
    <a href="studentpage.jsp"><img src="./assets/images/backb.png" alt="Back" class="zoomimage" height="55" width="55" Style="margin-left: 30px; margin-top: 30px; margin-bottom: 0px;"></a>
    <div class="login-page">
  <div class="form">
      
      <form class="login-form" method="post" action="givequiz1.jsp">
       <h3>SELECT QUIZ</h3>
       <h5 style="color: #286090;">Select Question Paper</h5>
       <select name="item" style="font-family:Roboto,sans-serif; outline: 0; background: #f2f2f2; width: 100%; border: 1px; margin: 0 0 15px; padding: 15px; box-sizing: border-box; font-size: 14px;">
          <option value="w">Select Question Paper</option>
          <%    try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
                PreparedStatement ps=con.prepareStatement("select subjectcode from lnctquizinfo");
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                String quizid=rs.getString(1);
                out.print("<option value="+ quizid + ">" +quizid+ "</option>");
                }
                }
             catch(Exception e)
                {
                e.printStackTrace();
                request.setAttribute("alert", "Something Went Wrong");
                }
       %>
       </select>
      <button>ENTER</button>
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script>
</body>
</html>

