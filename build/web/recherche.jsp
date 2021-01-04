<%-- 
    Document   : recherche.jsp
    Created on : 24 déc. 2020, 21:48:09
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
    </head>
    <body>
           <jsp:include page="header.jsp"></jsp:include>

                                 <%  
                                     //int idcat=Integer.parseInt(request.getParameter("idcat"));
                                     String mot=request.getParameter("mot");
                            List<Article> arts=new ArrayList<Article>(); 
                            Connection conn=DAOUtil.getConnection();
                            Statement st = conn.createStatement();
                            String req="select * from Article where titre";
                            //if(idcat>0) req+="and idcat="+idcat;
                            if(request.getParameter("mot")!=null)
                                req+=" like '%"+mot+"%' order by datepub desc";
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
  <caption>List of users</caption>
  <thead>
    <tr>
      <th scope="col">Titre</th>
      <th scope="col">datepub</th>
      <th scope="col">img</th>
      <th scope="col">Detail</th>
    </tr>
  </thead>
  <tbody>
    <% for(Article a:arts) { %>
    
      <tr>
      
      <td><%=a.getTitre()%></td>
      <td><%=a.getDatepub()%></td>
      <td><%=a.getImg()%></td>
      <td><a href="detail.jsp?ida=<%=a.getIda()%>">Lire...</a></td>
    </tr>
   <%  } %>
 
  </tbody>
</table>
          <%  } %>              
                             
      
                            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>