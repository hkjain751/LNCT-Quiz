<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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


<% try {
String subject= request.getParameter("subject");
String noques= request.getParameter("noques");
String subjectcode= request.getParameter("subjectcode");
String tnoques= request.getParameter("tnoques");
String ttime= request.getParameter("ttime");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
PreparedStatement ps=con.prepareStatement("insert into lnctquizinfo values(?,?,?,?,?,?)");
ps.setString(1,subjectcode);
ps.setString(2,subject);
ps.setString(3,noques);
ps.setString(4,tnoques);
ps.setString(5,ttime);
ps.setString(6,islogin);
int s= ps.executeUpdate();
request.setAttribute("added","Quiz Added Successfully \nEnter Questions Here");
session.setAttribute("noques",tnoques);
session.setAttribute("quizcode",subjectcode);
%>
<jsp:forward page="addquestion.jsp"></jsp:forward>
<%
 }
catch(Exception e)
{
    e.printStackTrace();
request.setAttribute("finished","Something Went Wrong");
%>
<jsp:forward page="addquiz1.jsp"></jsp:forward>
<% } %>
