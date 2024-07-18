package br.edu.ifsp.arq.ads.servlets.helpers;

import java.util.List;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.dto.AnimalByRaca;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AnimalStatisticsByRacaHelper implements Helper {

	@Override
	public List<AnimalByRaca> execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");	
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		return animalDao.getAnimalsStatisticsByRaca(); 
	}

}