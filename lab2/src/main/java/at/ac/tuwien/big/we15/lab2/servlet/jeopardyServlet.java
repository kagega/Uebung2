package at.ac.tuwien.big.we15.lab2.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class jeopardyServlet
 */
@WebServlet(description = "the servlet is the controller", urlPatterns = { "/jeopardyServlet" })
public class jeopardyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String username;
	private String password;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jeopardyServlet() {
        super();
        username = "";
        password = "";
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		RequestDispatcher dispatcher = null;
		String pageName = request.getParameter("pageName");
		
		if (pageName.equals("login")) {

			dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			//funktioniert noch nicht...
			if(this.username.length() == 0) {
					
					this.username = request.getParameter("username");
					this.password = request.getParameter("password");
					response.encodeRedirectURL("jeopardy.jsp");
					response.encodeURL("jeopardy.jsp");
					System.out.println("Test");
			} else {
				//stay without anything
			}

		}
	}

}
