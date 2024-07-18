package br.edu.ifsp.arq.ads.servlets.helpers;

import java.sql.SQLException;
import java.util.List;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.daos.filters.AnimalFilter;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.Especie;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SearchAnimalsHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String especie = req.getParameter("especie");
		Especie especieAnimal = null;
		if(!especie.isEmpty()) {
			especieAnimal = Especie.valueOf(especie);
		}
		
		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		
		AnimalFilter filter = new AnimalFilter();
		filter.setUser(user);
		filter.setEspecie(especieAnimal);
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		List<Animal> animals = null;
		try {
			animals = animalDao.getAnimalsByFilter(filter);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("animals", animals);
		return "/home.jsp";
	}

}