<%-- 
    Document   : result
    Created on : 12 Apr, 2018, 11:44:20 PM
    Author     : hp
--%>
<%
    String result=(String)session.getAttribute("result");
%>

<!doctype html>
<html>
<head>
<title>LNCT Quiz|Result</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
    body {
  margin-left: 35%; margin-top: 10%; margin-right: 35%; border: #000;
  background: #337ab7; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #337ab7, #8DC26F);
  background: -moz-linear-gradient(right, #337ab7, #8DC26F);
  background: -o-linear-gradient(right, #337ab7, #8DC26F);
  background: linear-gradient(to left, #337ab7, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
.animated {
    -webkit-animation-duration: 10s;
    animation-duration: 10s;
    -moz-user-select: none;
    -ms-user-select: none;
    -webkit-user-select: none;
}

.yt-loader {
    -webkit-animation-name: horizontalProgressBar;
    animation-name: horizontalProgressBar;
    -webkit-animation-timing-function: ease;
    animation-timing-function: ease;
    background: #ef534e;
    height: 3px;
    left: 0;
    top: 0;
    width: 0%;
    z-index: 9999;
    position:relative;
}

.yt-loader:after{
  display: block;
  position: absolute;
  content:'';
  right: 0px;
  width: 100px;
  height: 100%;
  box-shadow: #ef534e 1px 0 6px 1px;
  opacity: 0.5;
}
@keyframes horizontalProgressBar
{
    0%   {width: 0%;}
    20%  {width: 10%;}
    30%  {width: 15%;}
    40%  {width: 18%;}
    50%  {width: 20%;}
    60%  {width: 22%;}
    100% {width: 100%;}
}
</style>
</head>

<body>
    <script type="text/javascript">
        window.onbeforeunload = function() { return "Warning: Your work will be lost!"; };
    </script>        
    <div class="animated yt-loader"></div>
    <div id="section">
        <hr>
        <center><h2>Test Finished</h2></center>
    <hr>
    <ul>
        <li><b>Your Score: <%=result %></b></li>
      <li>Your Result is Saved Sucessfully.</li>
      <li>To Check Result Press <b>See Result</b> On Home Page.</li>
      <li>Press <b>Continue</b> to go to Home Page.</li>
    </ul>
    <br/>
    <hr>
    <center>
    <button id="start" style="width:180px;height:40px; background-color: blue; color: white; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; border-top-left-radius: 20px; border-top-right-radius: 20px;" onClick="window.location='studentpage.jsp'">Continue</button>  
    </center> 
    <hr>
    </div>
    
</body>

</html>