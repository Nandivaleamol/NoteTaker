<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.notetaker.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.notetaker.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container-fluid">
		<%@ include file="navbar.jsp"%>
		<br>
		<div class="container">
			<h1 class="text-uppercase m-3">All Notes:</h1>

			<div clas="row">
				<div class="col-12">


					<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Note");
					List<Note> list = q.list();

					for (Note note : list) {
					%>
					<div class="card mt-3">
						<img class="card-img-top ml-4" style="max-width: 80px"
							alt="Card image cap" src="img/notepad.png">
						<div class="card-body">
							<h5 class="card-title m-2">
								<%=note.getTitle()%>
							</h5>
							<p class="card-text">
								<%=note.getContent()%>
							</p>
							<p> <b class="text-primary">Added Date: <%=note.getAddedDate() %></b> </p>
							<div class="container mt-2 ml-4">
								<a class="btn btn-danger"
									href="DeleteServlet?note_id= <%=note.getId()%> ">Delete</a> <a
									class="btn btn-primary" href="edit.jsp?note_id= <%=note.getId()%>">Update</a>
							</div>
						</div>
					</div>

					<%
					}
					s.close();
					%>

				</div>
			</div>
		</div>

	</div>
</body>
</html>