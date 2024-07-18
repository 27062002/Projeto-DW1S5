package br.edu.ifsp.arq.ads.servlets.helpers;

import com.google.gson.JsonObject;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteAnimalHelper implements Helper {

	/*@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long animalId = Long.parseLong(req.getParameter("animal-id"));
			
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = animalDao.getAnimalsById(animalId); 
		if(animal != null) {
			animalDao.delete(animal);
		}
		return "ControllerServlet?action=listAnimals";
	}*/
	@Override
	public JsonObject execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long animalId = Long.parseLong(req.getParameter("animal-id"));
		Boolean response;	
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = animalDao.getAnimalsById(animalId);
		if(animal != null) {
			animalDao.delete(animal);
			response = true;
		}else {
			response = false;
		}
		JsonObject json = new JsonObject();
		json.addProperty("response", response);
		return json;
	}

}