<%-- 
    Document   : addstudentprocess
    Created on : 30 Mar, 2018, 5:50:18 PM
    Author     : hp
--%>

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
<%
 try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
String susername= request.getParameter("susername");
String spassword= request.getParameter("spassword");
PreparedStatement ps=con.prepareStatement("insert into studentregister values(?,?,?)");
ps.setString(1,susername);
ps.setString(2,spassword);
ps.setString(3,islogin);
int s= ps.executeUpdate();


}
catch(Exception e)
{
e.printStackTrace();
request.setAttribute("alert", "Student Already Exist With This Username");
%>
<jsp:forward page="addstudent1.jsp"></jsp:forward>
<%
}
request.setAttribute("alert", "Student Added Sucessfully");
%>
<jsp:forward page="addstudent.jsp"></jsp:forward>