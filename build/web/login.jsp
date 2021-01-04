<%-- 
    Document   : login
    Created on : 24 déc. 2020, 13:29:13
    Author     : 21627
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/login.css" rel="stylesheet">

    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>
         <% if(request.getAttribute("msg") !=null){ %>
         <div class="alert alert-danger" role="alert">
             <p style="margin-left: 40%">Verifier username ou password</p>
</div>

<% 
}
%>

       <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="img\logo-header.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form class="login-form" method="POST" action="Login">
      <input type="text"  class="fadeIn second" name="username" placeholder="username">
      <input type="password"  class="fadeIn third" name="password" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="sign.jsp">Create Account</a>
    </div>

  </div>
</div>
           <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
