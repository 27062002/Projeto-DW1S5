package br.edu.ifsp.arq.ads.servlets.helpers;

import java.util.List;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.daos.UserDao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListUserAdocaoHelper implements Helper{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDao userDao = new UserDao(SearcherDataSource.getInstance().getDataSource());
		List<User> usuarios = userDao.getUser();
		req.setAttribute("usuarios", usuarios);
		return "/adocao-register.jsp";
	}
}
