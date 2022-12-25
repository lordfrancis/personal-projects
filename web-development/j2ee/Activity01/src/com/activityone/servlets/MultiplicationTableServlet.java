package com.activityone.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MultiplicationTableServlet
 */
@WebServlet("/MultiplicationTableServlet")
public class MultiplicationTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MultiplicationTableServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("multiplication_table_output.jsp");
		String colReq = request.getParameter("col");
		String rowReq = request.getParameter("row");
		int col = 0, row = 0;

		try {
			col = Integer.parseInt(colReq);
			row = Integer.parseInt(rowReq);
		} catch (Exception e) {
			request.setAttribute("output",
					"<b>Invalid Input. Cannot generate a multiplication table. Please check your input and try again.</b>");
			rd.forward(request, response);
		}

		String table = generateTable(col, row);
		request.setAttribute("output", table);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * Function to generate the table based from columns and rows.
	 * @param col
	 * @param row
	 * @return string
	 */
	private String generateTable(int col, int row) {
		String table = "<table border='1' class='table table-striped'><tr><td></td>";

		// Prints header columns
		for (int h = 1; h <= col; h++) {
			table += "<th>" + h + "</th>";
		}
		table += "</tr>";

		// Prints the rest of the table
		for (int r = 1; r <= row; r++) {
			table += "<tr><th>" + r + "</th>";
			for (int c = 1; c <= col; c++) {
				int res = r * c;
				table += "<td>" + res + "</td>";
			}
			table += "</tr>";
		}
		table += "</table>";

		return table;
	}

}
