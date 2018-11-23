<%-- 
    Document   : loginprocess
    Created on : 26 Mar, 2018, 11:46:13 AM
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
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
PreparedStatement ps=con.prepareStatement("select * from studentregister where username=? and password=? ");
ps.setString(1,username);
ps.setString(2,userpass);
ResultSet rs=ps.executeQuery();
status=rs.next();
if(status){
username=rs.getString(1);
session.setAttribute("usernamest",String.valueOf(username));
//checking info
ps=con.prepareStatement("select * from lnctstudentinfo where enrollment=?");
ps.setString(1, username);
rs=ps.executeQuery();
if(rs.next())
{
%>
<jsp:forward page="studentpage.jsp"></jsp:forward>
<%
}
else{
%>
<jsp:forward page="fillinfo.jsp"></jsp:forward>
<%
}
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