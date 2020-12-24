<%-- 
    Document   : detail
    Created on : 24 déc. 2020, 14:09:39
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
<!DOCTYPE html>
<html lang="en">
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
        <!-- Single News Start-->
        <div class="single-news">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="sn-container">
                            <div class="sn-img">
                                <img src="<%=a.getImg()%>" />
                                
                            </div>
                            <div class="sn-content">
                                <h1 class="sn-title"><%=a.getTitre()%> </h1>
                                <p>
                                    <%=a.getBio()%>
                                </p>
                                <p>
                                    <%=a.getDatepub()%>
                                </p>
                            </div>
                        </div>
                       
                    </div>

                   
                </div>
            </div>
        </div>
                            <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>