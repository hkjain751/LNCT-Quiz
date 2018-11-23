<%-- 
    Document   : logint
    Created on : 20 Jul, 2018, 11:54:59 PM
    Author     : hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>LNCT Quiz Login</title>
  <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
    <a href="index.html"><img src="./assets/images/backb.png" alt="Back" class="zoomimage" height="55" width="55" Style=" margin-left: 30px; margin-top: 30px; margin-bottom: 0px;"></a>

  <div class="login-page">
      
  <div class="form">
      <a href="index.html"><img src="assets/images/lnct.png" height="75" width="250"/></a>
      <form class="login-form" method="post" action="tloginprocess.jsp">
       <h3>Teacher Login</h3>
      <input type="text" placeholder="Username(Employee Id)" name = "username" required/>
      <input type="password" placeholder="Password" name = "password" required/>
      <button>LOGIN</button>
      
      <p class="message">Sign In As Student <a href="login.jsp">Sign In</a></p>
    </form>
    
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>




</body>

</html>
