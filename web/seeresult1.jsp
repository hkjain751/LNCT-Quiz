<%-- 
    Document   : seeresult1
    Created on : 6 Apr, 2018, 1:39:30 PM
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
  <title>LNCT Quiz|SEE RESULT</title>
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
}
String quizid=request.getParameter("item");
     if(quizid==null)
     {
       request.setAttribute("finished", "Something went wrong");
       %>
       <jsp:forward page="seeresult.jsp"></jsp:forward>

       <%
     }%>
  <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
       <h3>SEE RESULT</h3>
       
          <%    try {
                %>
                <table style="border:2px; column-gap:2px;">
<%                out.print("<tr><td>EXAM ID</td><td>STUDENT ID</td><td>QUIZ ID</td><td>TOTAL MARKS</td><td>OBTAIN MARKS</td><td>TIME</td></tr>");
                String examid,studentid,quizid1,totalmarks,obtainmarks,time;
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
                PreparedStatement ps=con.prepareStatement("select * from lnctquizresult where quizid='"+quizid+"'");
                
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    examid=rs.getString(1);
                    studentid=rs.getString(2);
                    quizid1=rs.getString(3);
                    totalmarks=rs.getString(4);
                    obtainmarks=rs.getString(5);
                    time=rs.getString(6);
                    out.print("<tr><td>"+examid+"</td><td>"+studentid+"</td>"+"<td>"+quizid1+"</td>"+"<td>"+totalmarks+"</td>"+"<td>"+obtainmarks+"</td>"+"<td>"+time+"</td></tr>");
                    
                }
                out.print("</table>");
                }
             catch(Exception e)
                {
                e.printStackTrace();
                request.setAttribute("finished", "Something Went Wrong"+e);
                %>
                <jsp:forward page="seeresult.jsp"></jsp:forward>
                <%
                }
       %>
       <br><br>
      <button onclick="window.location='Teacherpage.jsp'">BACK</button>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script>

 </body>
</html>

