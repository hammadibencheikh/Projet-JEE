<%-- 
    Document   : news
    Created on : 24 déc. 2020, 13:30:53
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
 <head>
        <meta charset="utf-8">
        <title>Bootstrap News Template - Free HTML Templates</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Bootstrap News Template - Free HTML Templates" name="keywords">
        <meta content="Bootstrap News Template - Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap" rel="stylesheet"> 

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
                      
                            <%  
                            List<Article> arts=new ArrayList<Article>(); 
                            Connection conn=DAOUtil.getConnection();
                            Statement st = conn .createStatement();
                            ResultSet rs=st.executeQuery("select * from Article order by datepub desc");
                           SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                            while(rs.next())
                                arts.add(new Article(rs.getInt("ida"), rs.getString("titre"),rs.getString("bio"),rs.getString("img"),sdf.parse(rs.getDate("datepub").toString())));
                                                conn.close();

                             %>	
                               
           <div class="cat-news">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2>Sports</h2>
                                <%
                                int i=0;
                                for(Article a: arts){
                                %>
       
                        <div class="row cn-slider">
                            <div class="col-md-6">
                                <div class="cn-img">
                                    <img src="<%=a.getImg()%>" />
                                    <div class="cn-title">
                                        <a href="detail.jsp?ida=<%=a.getIda()%>"><%=a.getTitre()%></a>
                                    </div>
                                </div>
                            </div>
                                      <% i++; }%>
                            
                            
                       
                           
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Category News End-->

      
                                
        <!-- Category News End-->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>