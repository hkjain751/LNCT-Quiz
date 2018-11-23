<%-- 
    Document   : givequiz1
    Created on : 11 Apr, 2018, 12:52:55 PM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%
    String quizcode=null,quizname=null,noques=null,time=null;
String username=(String)session.getAttribute("usernamest");
if(username==null){
	response.sendRedirect("login.jsp");
}
%>

<html>
<head>
<title>LNCT Quiz|Start Quiz</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
    body {
            background: #337ab7; /* fallback for old browsers */
            background: -webkit-linear-gradient(right, #337ab7, #8DC26F);
            background: -moz-linear-gradient(right, #337ab7, #8DC26F);
            background: -o-linear-gradient(right, #337ab7, #8DC26F);
            background: linear-gradient(to left, #337ab7, #8DC26F);
            font-family: "Roboto", sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;      
         }
</style>
</head>

<body style="margin-left: 25%; margin-top: 10%; margin-right: 25%; border: #000;">       
        
    <div id="section">
        <br/><hr>
        <center><h2><strong>&nbsp;&nbsp;&nbsp;INSTRUCTIONS</strong></h2></center>
        <hr>
        <ul style=" margin-left: 15%;">
<% try{
String item=(String)request.getParameter("item");
if(item.equals("w"))
{
    request.setAttribute("finished", "Something went wrong");
       response.sendRedirect("givequiz.jsp");
     }%>
    
    <%
session.setAttribute("item",item);
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
PreparedStatement ps=con.prepareStatement("select * from lnctquizinfo where subjectcode='"+item+"'");
ResultSet rs = ps.executeQuery();
rs.next();
   quizcode=rs.getString(1);
   quizname=rs.getString(2);
   noques=rs.getString(3);
   time=rs.getString(5);
        }
        catch(Exception e)
        {
            out.print(e);
        }
            %>
        <li>Quiz Code:<b> <%=quizcode %></b></li>
        <li>Quiz Name:<b> <%=quizname %></b></li>
        <li>Total Questions:<b> <%=noques %></b></li>
        <li>Time Alloted:<b> <%=time %> Minutes</b></li>
	  <li>Questions based on Selected Quiz</li>
	  <li>There is no negative marking</li>
	  <li>Click on  <b>Start</b>  button to start the test</li>
	  <li>After the test starts, don't press back or refresh button or don't close the browser window</li>
	</ul>  
    <br/>
    <hr>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button id="start" style="width:180px;height:40px; margin-left: 80px; background-color: blue; color: white; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; border-top-left-radius: 20px; border-top-right-radius: 20px;" onClick="window.location='test.jsp'">Start</button>  
  <button id="start" style="width:180px;height:40px; margin-left: 80px; background-color: blue; color: white; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; border-top-left-radius: 20px; border-top-right-radius: 20px;" onClick="window.location='givequiz.jsp'">Back</button>  
  <br/>
  <hr>
    </div>
    
</body>

</html>