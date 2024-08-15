package br.edu.ifsp.arq.ads.servlets.helpers;

import java.util.List;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListAnimalAdocaoHelper implements Helper{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> animals = animalDao.getAnimal();
		req.setAttribute("animals", animals);
		return "/ControllerServlet?action=listUsersForAdocoes";
	}
}
