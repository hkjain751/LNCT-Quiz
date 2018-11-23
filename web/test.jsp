<%-- 
    Document   : test
    Created on : 12 Apr, 2018, 11:42:24 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<%@page session="false" %>
<%
HttpSession s=request.getSession(false);
String item=(String)request.getSession().getAttribute("item");
                if(item==null)
                {
%>
<jsp:forward page="givequiz.jsp"></jsp:forward>
<%
                }
                if(s==null) 
                { 
%>
<jsp:forward page="login.jsp" />
<%
                }
%>
<% String duration=(String)s.getAttribute("duration"); %>

<%
    String quizcode=null,quizname=null,noques=null,time=null;
    int nok=10;
    try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");

    
                PreparedStatement ps=con.prepareStatement("select * from lnctquizinfo where subjectcode='"+item+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    quizcode=rs.getString(1);
                    quizname=rs.getString(2);
                    noques=rs.getString(3);
                    time=rs.getString(5);   
                }
              nok=Integer.parseInt(noques);
    }
    catch(Exception e)
    {
        %>
        <jsp:forward page="givequiz.jsp"></jsp:forward>
        <%
        
    }
 %>
 <%
     int a=Integer.parseInt(time); 
 %>
<head>
<title>LNCT Quiz</title>
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
    .exam{
            margin-left: 20%;
            margin-right: 20%;
            margin-top: 20px;
            font-size: 18px;
         }
</style>
<script type="text/javascript">
    var cmin=<%= a %>;
    var total=cmin*60;
    cmin=cmin-1;
    var ctr=0;
    var dom=document.getElementById("kulu");
    function ram()
    {
    var dom=document.getElementById("kulu");
    dom.value="Time Left - "+(cmin)+":"+(total%60);
    <% String t=(String)s.getAttribute("over"); %>
    var tt=<%= t %>
    if(tt=="false"){ram1();}
    total=total-1;
    ctr++;
    if(ctr==60){ctr=0;cmin=cmin-1;}
    if(total==0){
    ram1();}
    setTimeout("ram()", 1000);
    }
    function ram1(){
    window.location.replace("resultDAO.jsp");
    }
</script>
</head>
<body onload="ram()">
    
    <form name="form1">
    <input type="text" id="kulu" style="border-color: transparent; background-color: transparent; margin-left: 80%; margin-top: 3%; font-size: 25px;"/>
    </form>
    <form class="exam" action="resultDAO.jsp">
        <hr>
        <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quiz Name : <%=quizname %> </h4>
        <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quiz Code : <%=quizcode %></h4>
        <hr>
        <%
         try {
                String qid=null,question=null,op1=null,op2=null,op3=null,op4=null;
                int count=0;
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hkjain751");
                PreparedStatement ps=con1.prepareStatement("select * from lnctquizques where quizcode='"+item+"' ORDER BY dbms_random.value");
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    question=rs.getString(1);
                    op1=rs.getString(2);
                    op2=rs.getString(3);
                    op3=rs.getString(4);
                    op4=rs.getString(5);
                    qid=rs.getString(10);
                    count++;
                    
        %>
        <p>Question(<%=count %>) &nbsp;&nbsp;<%=question %></p>
        <input type="radio" name="<%=qid %>" value="<%=op1 %>"  > <label><%=op1 %></label><br/>
        <input type="radio" name="<%=qid %>" value="<%=op2 %>" > <label><%=op2 %></label><br/>
        <input type="radio" name="<%=qid %>" value="<%=op3 %>"  > <label><%=op3 %></label><br/>
        <input type="radio" name="<%=qid %>" value="<%=op4 %>" > <label><%=op4 %></label><br/>
        <hr>
        <%
            if(count>=nok)
                    {
                        break;
                    }
            }
        %>
        <center>
    <button id="start" style="width:180px;height:40px; background-color: blue; color: white; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; border-top-left-radius: 20px; border-top-right-radius: 20px;" onClick="window.location='studentpage.jsp'">Submit Quiz</button>  
    </center> 
    <hr>
    </form>
                <%
                    request.getSession().setAttribute("noques", nok);
                }
             catch(Exception e)
                {
                e.printStackTrace();
                request.setAttribute("finished", "Something Went Wrong"+e);
                %>
                <jsp:forward page="givequiz.jsp"></jsp:forward>
                <%
                }
       %>
     
</body>
</html>