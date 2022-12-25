package com.demo.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.demo.person.Person;

/**
 * Servlet implementation class EditPerson
 */
@WebServlet("/EditPerson")
public class EditPerson extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPerson() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Initialize necessarry data to be used.
		int id = 0;
		String name = "", address = "";
		Date birthday = null;
		PrintWriter out = response.getWriter();
		RequestDispatcher dataSuccess = request.getRequestDispatcher("confirm_edit.jsp");
		Person person;

		// Checks validity of data before creating Person object.
		try {
			id = Integer.parseInt(request.getParameter("person_id"));
			name = request.getParameter("person_name");
			birthday = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("person_date"));
			address = request.getParameter("person_address");
		} catch (Exception e) {
			RequestDispatcher dataFailed = request.getRequestDispatcher("edit_person.jsp");
			request.setAttribute("error", "Invalid Input. Please enter a valid input.");
			dataFailed.forward(request, response);
		}

		person = new Person(id, name, birthday, address);
		request.getSession().setAttribute("person", person);
		request.getSession().setAttribute("index", request.getParameter("index"));
		dataSuccess.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int index = Integer.parseInt( (String) request.getSession().getAttribute("index") );
		PrintWriter out = response.getWriter();
		ArrayList<Person> personList = (ArrayList) request.getSession().getAttribute("personList");
		RequestDispatcher dataSuccess = request.getRequestDispatcher("person_list.jsp");
		Person p = (Person)request.getSession().getAttribute("person");
		
		
		personList.set(index, p);
		request.getSession().setAttribute("personList", personList);
		
		dataSuccess.forward(request, response);
	}

}
