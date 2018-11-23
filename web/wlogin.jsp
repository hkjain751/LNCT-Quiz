<%-- 
    Document   : wlogin.jsp
    Created on : 26 Mar, 2018, 10:24:19 PM
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
  <a href="index.html"><img src="./assets/images/backb.png" alt="Back" class="zoomimage" height="55" width="55" Style="margin-left: 30px; margin-top: 30px; margin-bottom: 0px;"></a>

  <div class="login-page">
  <div class="form">
      <a href="index.html"><img src="assets/images/lnct.png" height="75" width="250"/></a>
      <form class="register-form" method="post" action="tloginprocess.jsp">
       <h3>Teacher Login</h3>
       <h6 style="color: red;">Invalid Username/Password</h6>
      <input type="text" placeholder="Username(Employee Id)" name = "username" required/>
      <input type="password" placeholder="Password" name = "password" required/>
      <button>LOGIN</button>
       <p class="message">Sign In As Student <a href="#">Sign In</a></p>
    </form>
      
    <form class="login-form" method="post" action="loginprocess.jsp">
        <h3>Student Login</h3>
        <h6 style="color: red;">Invalid Username/Password</h6>
      	<input type="text" placeholder="Username(Enrollment No.)" name = "username" required/>
      	<input type="password" placeholder="Password" name = "password" required/>
      	<button>LOGIN</button>
        <p class="message">Sign In As Teacher <a href="#">Sign In</a></p>
    </form>
  </div>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="js/index.js"></script>




</body>

</html>

