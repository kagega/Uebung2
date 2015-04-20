package at.ac.tuwien.big.we15.lab2.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Random;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletConfig;
import javax.servlet.*;

import at.ac.tuwien.big.we15.lab2.api.Category;
import at.ac.tuwien.big.we15.lab2.api.Question;
import at.ac.tuwien.big.we15.lab2.api.Answer;
import at.ac.tuwien.big.we15.lab2.api.QuestionDataProvider;
import at.ac.tuwien.big.we15.lab2.api.impl.JSONQuestionDataProvider;
import at.ac.tuwien.big.we15.lab2.api.impl.ServletJeopardyFactory;
import at.ac.tuwien.big.we15.lab2.api.impl.SimpleJeopardyFactory;


import com.google.common.reflect.Parameter;

/**
 * Servlet implementation class jeopardyServlet
 */
@WebServlet(description = "the servlet is the controller", urlPatterns = { "/jeopardyServlet" })
public class jeopardyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private List<Category> information = new ArrayList<Category>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		ServletContext servletContext = config.getServletContext();
		ServletJeopardyFactory factory = new ServletJeopardyFactory(servletContext);
		QuestionDataProvider provider = factory.createQuestionDataProvider();
		information.addAll(provider.getCategoryData());
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher;
		request.setAttribute("information", information);

		dispatcher  = getServletContext().getRequestDispatcher("/jeopardy.jsp");
		dispatcher.forward(request, response);
		
			if(request.getParameter("action") == null)
				return;
			if(request.getParameter("action").compareTo("registerButtonClicked") == 0) {
				dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
				dispatcher.forward(request, response);
			}
			if(request.getParameter("action").compareTo("logoutlinkButtonClicked") == 0) {
				dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
			}
			
			if(request.getParameter("action").compareTo("loginButtonClicked") == 0) {
				dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
			}
			
			if(request.getParameter("action").compareTo("restartButtonClicked") == 0) {
				request.setAttribute("information", information);
				dispatcher = getServletContext().getRequestDispatcher("/jeopardy.jsp");
				dispatcher.forward(request, response);
			}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pw = request.getParameter("password");
		RequestDispatcher dispatcher;

		if(pw==null){
			String id = request.getParameter("question_selection");
			Integer toFind = Integer.parseInt(id);
			int j = 0;
			Question question = null;
			for(Category c : information){
				for(Question q : c.getQuestions()){
					if(j == toFind){
						question = q;
					}
					j++;
				}
			}
			
			request.setAttribute("frage", question);
			dispatcher  = getServletContext().getRequestDispatcher("/question.jsp");
		}
		
		else{
			request.setAttribute("information", information);
			dispatcher  = getServletContext().getRequestDispatcher("/jeopardy.jsp");
		}
		
		dispatcher.forward(request, response);
		
		if(request.getParameter("action") == null)
			return;
		if(request.getParameter("action").compareTo("signInButtonClicked") == 0) {
			HttpSession session = request.getSession();
		}
		if(request.getParameter("action").compareTo("questionSubmitButtonClicked") == 0) {
			dispatcher = getServletContext().getRequestDispatcher("/question.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("action").compareTo("registerButtonClicked") == 0) {
			dispatcher = getServletContext().getRequestDispatcher("/jeopardy.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("action").compareTo("submitButtonClicked") == 0) {
			dispatcher = getServletContext().getRequestDispatcher("/winner.jsp");
			dispatcher.forward(request, response);
		}
		


	}

}
