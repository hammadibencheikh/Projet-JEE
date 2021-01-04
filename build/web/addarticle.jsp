<%-- 
    Document   : addarticle
    Created on : 31 déc. 2020, 16:28:47
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

        <form  method="post" action="Addarticle">

    <label for="exampleFormControlInput1">Titre</label>
    <input type="text" name="titre" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
  
  
  
    <label for="exampleFormControlTextarea1">Bio</label>
    <input name="bio" class="form-control" id="exampleFormControlTextarea1" rows="3"></input>
  
              
  
    <label  for="exampleFormControlFile1">Image</label>
    <input name="img" type="file" class="form-control-file" id="exampleFormControlFile1">
  
      <button type="submit" class="btn btn-primary"> Enregistre </button>
</form>
            

                                          <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
