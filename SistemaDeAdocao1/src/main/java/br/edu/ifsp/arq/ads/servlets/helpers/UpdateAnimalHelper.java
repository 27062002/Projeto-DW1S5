package br.edu.ifsp.arq.ads.servlets.helpers;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAnimalHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long animalId = Long.parseLong(req.getParameter("animal-id"));
			
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = animalDao.getAnimalsById(animalId);
		
		if(animal != null) {
			req.setAttribute("animal", animal);	
		}
		return "/animal-register.jsp";
	}

}