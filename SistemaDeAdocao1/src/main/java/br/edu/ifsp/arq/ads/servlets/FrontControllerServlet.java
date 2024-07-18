package br.edu.ifsp.arq.ads.servlets;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import br.edu.ifsp.arq.ads.servlets.helpers.Helper;
import br.edu.ifsp.arq.ads.servlets.helpers.HelperFactory;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ControllerServlet")
public class FrontControllerServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public FrontControllerServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Helper helper = new HelperFactory().getHelper(req);
		try {
			Object response = helper.execute(req, resp);
			if(response instanceof JsonObject) {
				resp.setContentType("application/json");
				resp.getWriter().write(response.toString());
			}else if(response instanceof List) {
				resp.setContentType("application/json");
				resp.getWriter().write(new Gson().toJson(response));
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(response.toString());
				dispatcher.forward(req, resp);
			}
		}
		catch(Exception error) {
			throw new ServletException(error);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}