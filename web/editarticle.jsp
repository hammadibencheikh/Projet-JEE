<%-- 
    Document   : editarticle
    Created on : 31 déc. 2020, 21:55:12
    Author     : 21627
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="models.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAOUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
  <%  
                            Article a =null;
                            int ida=Integer.parseInt(request.getParameter("ida"));
                            Connection conn=DAOUtil.getConnection();
                            PreparedStatement ps = conn.prepareStatement("select * from Article where ida=? order by datepub desc");
                            ps.setInt(1, ida);
                            ResultSet rs=ps.executeQuery();
                           SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                            if(rs.next())
                             a=new Article(rs.getInt("ida"), rs.getString("titre"),rs.getString("bio"),rs.getString("img"),sdf.parse(rs.getDate("datepub").toString()));
                                               
                                                conn.close();

                             %>	
                         
                         
                         
                         
        <form  method="post" action="Editarticle">

    <label for="exampleFormControlInput1">Titre</label>
    <input type="text" name="titre" class="form-control" id="exampleFormControlInput1" value="<%=a.getTitre()%>">
  
  
    <br>
    <label for="exampleFormControlTextarea1">Bio</label>
    <input name="bio" class="form-control" id="exampleFormControlTextarea1" rows="3" value="<%=a.getBio()%>"></input>
  
              
  
    <label  for="exampleFormControlFile1">Image</label>
    <input name="img" type="file" class="form-control-file" id="exampleFormControlFile1" value="<%=a.getImg()%>">
    <input name="ida" type="hidden" value="<%=a.getIda()%>">
      <button type="submit" class="btn btn-primary"> Enregistre </button>
</form>
            

                                          <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
