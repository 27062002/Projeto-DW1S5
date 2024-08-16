package br.edu.ifsp.arq.ads.servlets.helpers;

import java.util.List;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListAnimalsHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> Animals = animalDao.getAnimal();
		req.setAttribute("animals", Animals);
		if (user.getTipoUsuario() == 1) {
			return "/home-common.jsp";
		} else if (user.getTipoUsuario() == 2) {
			return "/home-funcionario.jsp";
		} else if (user.getTipoUsuario() == 3) {
			return "/home-adm.jsp";
		} else {
			return "/login.jsp";
		}
	}
}