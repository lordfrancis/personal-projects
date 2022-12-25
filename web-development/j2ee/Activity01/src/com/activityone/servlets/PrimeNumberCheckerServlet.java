package com.activityone.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class PrimeNumberCheckerServlet
 */
@WebServlet("/PrimeNumberCheckerServlet")
public class PrimeNumberCheckerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrimeNumberCheckerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String number = request.getParameter("number");
		int convNumber;
		
		if ( number == null ) {
			out.print( "Must pass a 'number' in the url parameter." );
			return;
		}
		
		try{
			convNumber = Integer.parseInt(number);
		}catch (NumberFormatException numFormatException){
			out.print( "Value cannot be converted into a number." );
			return;
		}
		
		
		
		if( checkPrime( convNumber ) ) {
			out.print( convNumber + " is a PRIME number.");
		} else {
			out.print( convNumber + " is a NOT A PRIME number.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private boolean checkPrime( int number ) {

		if (number<=1) {
            return false;
        }
		
		for (int i=2; i <= number/2; i++ ) {
			if( (number % i) == 0)
				return false;
		}
		
		return true;
	}

}
