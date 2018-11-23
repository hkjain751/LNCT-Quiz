<%-- 
    Document   : showeditquiz
    Created on : 1 Apr, 2018, 10:22:44 PM
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
  <title>LNCT Quiz|EDIT QUIZ</title>
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
       <jsp:forward page="editquiz.jsp"></jsp:forward>

       <%
     }%>
  <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
    
       <h3>EDIT QUIZ</h3>
       <h5 style="color: #286090;">Select Question Paper</h5>
          <%    try {
                out.print("<table>");
                out.print("<tr><td>Question ID</td><td>Question</td><td>option1</td><td>option2</td><td>option3</td><td>option4</td><td>Answer</td><td>Discription</td><td>Edit</td><td>Delete</td></tr>");
                String qid,ques,op1,op2,op3,op4,ans,dis;
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
                PreparedStatement ps=con.prepareStatement("select * from lnctquizques where addedby='"+islogin+"' AND quizcode='"+quizid+"'");
                
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    
                    ques=rs.getString(1);
                    op1=rs.getString(2);
                    op2=rs.getString(3);
                    op3=rs.getString(4);
                    op4=rs.getString(5);
                    ans=rs.getString(6);
                    dis=rs.getString(9);
                    qid=rs.getString(10);
                    out.print("<tr><td>"+qid+"</td>"+"<td>"+ques+"</td>"+"<td>"+op1+"</td>"+"<td>"+op2+"</td>"+"<td>"+op3+"</td>"+"<td>"+op4+"</td>"+"<td>"+ans+"</td>"+"<td>"+dis+"</td>");
                    out.print("<td><button onclick="+"editques.jsp"+ "value="+qid+">Edit</button></td><td><button onclick="+"deleteques.jsp"+ "value="+qid+">Delete</button></td></tr>");
                }
                out.print("</table>");
                }
             catch(Exception e)
                {
                e.printStackTrace();
                request.setAttribute("finished", "Something Went Wrong"+e);
                %>
                <jsp:forward page="editquiz.jsp"></jsp:forward>
                <%
                }
       %>
       <br><br>
      <button onclick="window.location='Teacherpage.jsp'">BACK</button>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/index.js"></script>
</body>
</html>

