<%@page import="com.notetaker.entities.Note"%>
<%@page import="com.notetaker.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>Edit Page</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<br>
	<div class="container">
	
	<h1>Edit your note</h1>
	<br>
	<%
	
	int noteId = Integer.parseInt(request.getParameter("note_id").trim());
	Session s = FactoryProvider.getFactory().openSession();
	Note note = (Note) s.get(Note.class, noteId); 
	%>


	<form action="UpdateServlet" method="post">
	
	<input value="<%= note.getId()%>" name="noteId" type="hidden" >
	
		<div class="form-group">
			<label for="title">Note Title</label> <input required type="text"
				class="form-control" id="title" name="title"
				placeholder="Enter Note title here" value="<%=note.getTitle()%>" />
		</div>
		<div class="form-group">
			<label for="content">Note Content</label>
			<textarea required id="content" name="content" class="form-control"
				placeholder="Enter Your Note content here" style="height: 300px;"> <%= note.getContent() %> </textarea>
		</div>

		<div class="container text-center">
			<button type="submit" class="btn btn-success ">Update Note</button>
		</div>


	</form>
	</div>


</body>
</html>