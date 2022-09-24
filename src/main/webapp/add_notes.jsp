<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@include file="all_js_css.jsp"%>

<title>Add Notes</title>
</head>
<body>

	<div class="container-fluid p-0 m-0 ">
		<%@include file="navbar.jsp"%>
	</div>

	<!-- this is add form -->
	<div class="container">
		<h1>Please fill your note details</h1>
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input required type="text"
					class="form-control" id="title" name="title"
					placeholder="Enter Note title here" />
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required id="content" name="content" class="form-control"
					placeholder="Enter Your Note content here" style="height: 300px;"></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary ">Add Note</button>
			</div>


		</form>

	</div>

</body>
</html>