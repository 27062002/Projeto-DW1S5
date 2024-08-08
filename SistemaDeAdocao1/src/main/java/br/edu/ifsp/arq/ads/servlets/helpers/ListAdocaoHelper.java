package br.edu.ifsp.arq.ads.servlets.helpers;

import java.util.List;

import br.edu.ifsp.arq.ads.model.daos.AdocaoDao;
import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.entities.Adocao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListAdocaoHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(false);
		AdocaoDao adocaoDao = new AdocaoDao(SearcherDataSource.getInstance().getDataSource());
		List<Adocao> Adocoes = adocaoDao.getAdocao();
		req.setAttribute("adocoes", Adocoes);
		return "/listaAdocao.jsp";
	}

}