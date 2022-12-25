package com.midtermexam.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalculatorServlet
 */
@WebServlet("/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculatorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		PrintWriter out = response.getWriter();
		
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		int convnum1=0, convnum2=0, sum=0, product=0;
		
		if (num1.isEmpty() ) {
			out.print( "\nPlease Do not leave the numbers empty." );
			return;
		}
		
		if( num2.isEmpty()) {
			out.print( "\nPlease Do not leave the numbers empty." );
			return;
		}
		
		try{
			convnum1 = Integer.parseInt(num1);
			convnum2 = Integer.parseInt(num2);
		}catch (NumberFormatException numFormatException){
			out.print( "Value cannot be converted into a number." );
			return;
		}
		
		sum = convnum1 + convnum2;
		product = convnum1 * convnum2;
		
		request.setAttribute("sum", sum);
		request.setAttribute("product", product);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
