package br.edu.ifsp.arq.ads.servlets.helpers;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.arq.ads.model.daos.AdocaoDao;
import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.daos.UserDao;
import br.edu.ifsp.arq.ads.model.entities.Adocao;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddAdocaoHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//Long id = Long.parseLong(req.getParameter("id"));
		LocalDate date = LocalDate.parse(req.getParameter("date"));
		Integer animal = Integer.parseInt(req.getParameter("animal"));
		String email = req.getParameter("email");

		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		AdocaoDao adocaoDao = new AdocaoDao(SearcherDataSource.getInstance().getDataSource());
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		UserDao userDao = new UserDao(SearcherDataSource.getInstance().getDataSource());
		Adocao adocao = new Adocao();
		adocao.setDate(date);
		adocao.setUser(user);
		adocao.setAnimal(animal);
		adocao.setEmail(email);
		if(userDao.checkUserByEmail(email)) {
			if(adocaoDao.save(adocao)) {
				animalDao.updateList(adocao.getAnimal());
				req.setAttribute("result", "registered");
			}
		}else {
			req.setAttribute("result", "notRegistered");
		}
		return "/adocao-register.jsp";
	}
}
