<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.User.UserDetails"%>
<%@ page import="com.DAO.PostDAO"%>
<%@ page import="com.User.Post"%>
<%@ page import="com.Db.DBConnect"%>
<%@page import="java.util.List"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "please login");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	String updateMsg = (String)session.getAttribute("updateMsg");
	if(updateMsg != null)
	{%>
	
    <div class="alert alert-danger" role="alert"><%=updateMsg%></div>
		
	<%
	session.removeAttribute("updateMsg");
	}
	%>
	<div class="container">
		<h2 class="text-center">All Notes:</h2>

		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDAO postDAO = new PostDAO(DBConnect.getConn());
					List<Post> posts = postDAO.getData(user3.getId());
					for (Post post : posts) {
				%>
				
				<div class="cars mt-3">
				
				<img alt="" src="img/paper.jpg" class="card-img-top  mt-2 mx-auto" style="max-width: 100px;">
				

					<div class="card-body p-4">
						<h5 class="card-title"><%=post.getTitle()%></h5>
						<p><%=post.getContent()%>.</p>
						<p>
							<b class="text-success">Published By:<%=user3.getName() %> </b><br>
							<b class="text-primary"></b>
						</p>
						<p>
							<b class="text-success">Published Date:<% %> </b><br> <b
								class="text-success"></b>
						</p>
						<div class="container text-center mt-2">
							<!-- Add dynamic links for delete and edit -->
							<a href="#" class="btn btn-danger">Delete</a>
							 <a href="edit.jsp?note_id=<%=post.getId() %>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
