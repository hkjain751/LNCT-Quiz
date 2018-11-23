<%-- 
    Document   : resultDAO
    Created on : 12 Apr, 2018, 11:43:42 PM
    Author     : hp
--%>
<%@page import="java.sql.*"%>
<%
String islogin=(String)request.getSession().getAttribute("usernamest");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
}
  String item=(String)request.getSession().getAttribute("item");
  String res=null;
  int noques=10;
  int count=0;
  
try
{   String qid=null,ans=null,ansr=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
    PreparedStatement ps=con.prepareStatement("select noques from lnctquizinfo where subjectcode='"+item+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                noques=rs.getInt("noques");
    ps=con.prepareStatement("select qid,answer from lnctquizques where quizcode='"+item+"'");
    rs = ps.executeQuery();
                while(rs.next())
                {
                    qid=rs.getString("qid");
                    ans=rs.getString("answer");
                    ansr=(String)request.getParameter(qid);
                if(ansr != null && ansr.equals(ans))
                    count++;
                }
    ps=con.prepareStatement("insert into lnctquizresult values(?,?,?,?,?,CURRENT_TIMESTAMP)");
    ps.setString(1,"");
    ps.setString(2,islogin);
    ps.setString(3,item);
    ps.setInt(4,noques);
    ps.setInt(5,count);
    rs = ps.executeQuery();
    if(!rs.next())
{
%>
<jsp:forward page="givequiz.jsp"></jsp:forward>
<%
}
res=count+" / "+noques;
}
catch( Exception e)
{ %>
    <jsp:forward page="givequiz.jsp"></jsp:forward>
<%
}
session.setAttribute("result",res);
response.sendRedirect("result.jsp");
%>
