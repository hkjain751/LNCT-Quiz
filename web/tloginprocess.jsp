<%-- 
    Document   : tloginprocess
    Created on : 26 Mar, 2018, 10:08:53 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String username=request.getParameter("username");
String userpass=request.getParameter("password");
boolean status=false;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
PreparedStatement ps=con.prepareStatement("select * from teacherregister where username=? and userpass=? ");
ps.setString(1,username);
ps.setString(2,userpass);
ResultSet rs=ps.executeQuery();
status=rs.next();
if(status){
username=rs.getString(1);
session.setAttribute("username",String.valueOf(username));
%>
<jsp:forward page="Teacherpage.jsp"></jsp:forward>
<%
}
else{
System.out.print("hi");
request.setAttribute("Error","Sorry! Username or Password Error. plz Enter Correct Detail or Register");
session.setAttribute("Loginmsg","plz sign in first");
%>
<jsp:forward page="wlogin.jsp"></jsp:forward>
<%
}
}
catch(Exception e){
e.printStackTrace();
}

%>