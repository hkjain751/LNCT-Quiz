<%-- 
    Document   : fillinfo1
    Created on : 18 Apr, 2018, 8:23:31 PM
    Author     : hp
--%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String islogin=(String)session.getAttribute("usernamest");
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
 try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
String enroll= request.getParameter("enrollment");
String name= request.getParameter("name");
String college= request.getParameter("college");
String branch= request.getParameter("branch");
String email= request.getParameter("email");
String mob= request.getParameter("mob");
PreparedStatement ps=con.prepareStatement("insert into lnctstudentinfo values(?,?,?,?,?,?)");
ps.setString(1,enroll);
ps.setString(2,name);
ps.setString(3,college);
ps.setString(4,branch);
ps.setString(5,email);
ps.setString(6,mob);
int s= ps.executeUpdate();


}
catch(Exception e)
{
e.printStackTrace();
request.setAttribute("alert", "Something went wrong, Please Try Again!!");
%>
<jsp:forward page="fillinfo.jsp"></jsp:forward>
<%
}
request.setAttribute("alert", "Information Updated Sucessfully");
%>
<jsp:forward page="studentpage.jsp"></jsp:forward>