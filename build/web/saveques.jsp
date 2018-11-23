<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String islogin=(String)session.getAttribute("username");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
String noques=(String)session.getAttribute("noques");
session.setAttribute("noques", noques);
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
<%! static int counter=0; %>
<%
 try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
String question= request.getParameter("question");
String option1= request.getParameter("option1");
String option2= request.getParameter("option2");
String option3= request.getParameter("option3");
String option4= request.getParameter("option4");
String answer=request.getParameter("answer");
String description=request.getParameter("description");
String quizcode=(String)session.getAttribute("quizcode");
PreparedStatement ps=con.prepareStatement("insert into lnctquizques values(?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,question);
ps.setString(2,option1);
ps.setString(3,option2);
ps.setString(4,option3);
ps.setString(5,option4);
ps.setString(6,answer);
ps.setString(7,quizcode);
ps.setString(8,islogin);
ps.setString(9,description);
ps.setString(10,null);
int s= ps.executeUpdate();


}
catch(Exception e)
{
e.printStackTrace();
request.setAttribute("added","Question Not Added,Try Again");
}

%>
<% 
    counter++;
request.setAttribute("counter",counter);
request.setAttribute("added","Question Added Sucessfully");
%>
<jsp:forward page="addquestion.jsp"></jsp:forward>