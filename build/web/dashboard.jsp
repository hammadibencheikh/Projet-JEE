<%-- 
    Document   : dashboard
    Created on : 24 déc. 2020, 13:30:19
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
<%@page import="models.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                 <jsp:include page="header.jsp"></jsp:include>
                <%//  if(session.getAttribute("u")==null){
                 //    request.setAttribute("msg", "necessite une authentification");
                 //    request.getRequestDispatcher("login.jsp").forward(request, response);
                // }
                // %>
            <button type="button" class="btn btn-primary btn-lg">Ajout Article</button>

                 <h1>Mes articles</h1>
                 
                   <%  
                                     //int idcat=Integer.parseInt(request.getParameter("idcat"));
                            List<Article> arts=new ArrayList<Article>(); 
                            Connection conn=DAOUtil.getConnection();
                            Statement st = conn.createStatement();
                            String req="select * from Article";
                            ResultSet rs=st.executeQuery(req);
                           SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                            while(rs.next())
                                arts.add(new Article(rs.getInt("ida"), rs.getString("titre"),rs.getString("bio"),rs.getString("img"),sdf.parse(rs.getDate("datepub").toString())));
                                                conn.close();
                             %>
                             
                              
                               <%  if(arts.size()==0) { %>
                             <div class="alert alert-danger" role="alert">
                                    aucune Article trouves!
                             </div>    
                           <%  } 
                            else { %>
                                <table class="table">
  <caption>List de article</caption>
  <thead>
    <tr>
      <th scope="col">Titre</th>
      <th scope="col">datepub</th>
      <th scope="col">img</th>
      <th scope="col">Detail</th>
      <th scope="col">Action</th>
      
    </tr>
  </thead>
  <tbody>
    <% for(Article a:arts) { %>
    
      <tr>
      
      <td><%=a.getTitre()%></td>
      <td><%=a.getDatepub()%></td>
      <td><%=a.getImg()%></td>
      <td><a href="detail.jsp?ida=<%=a.getIda()%>">Lire...</a></td>
      <td> <a href="editarticle.jsp?ida=<%=a.getIda()%>" scope="col" style="color: green">Editer</a>
       <a href="supparticle.jsp?ida=<%=a.getIda()%>" scope="col" style="color: red">Supprimer </a></td>
      
    </tr>
   <%  } %>
 
  </tbody>
</table>
          <%  } %>              
                 
                 
                 <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
