package com.notetaker.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.notetaker.entities.Note;
import com.notetaker.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {

			// fetch title, content

			String title = request.getParameter("title").toString();
			String content = request.getParameter("content").toString();

			Note note = new Note(title, content, new Date());

//			System.out.println(note.getId() +" : "+note.getTitle());

			// hibernate code
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();

			out.println("<h1>Note added successfully...!! </h1>");
			out.println("<h1 style='text-align:center; '> <a href='all_notes.jsp'>Show all notes </a></h1>");

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
