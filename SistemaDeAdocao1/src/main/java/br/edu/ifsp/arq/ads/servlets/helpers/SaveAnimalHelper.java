package br.edu.ifsp.arq.ads.servlets.helpers;

import java.time.LocalDate;

import br.edu.ifsp.arq.ads.model.daos.AnimalDao;
import br.edu.ifsp.arq.ads.model.entities.Animal;
import br.edu.ifsp.arq.ads.model.entities.Especie;
import br.edu.ifsp.arq.ads.model.entities.Sexo;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SaveAnimalHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long id = Long.parseLong(req.getParameter("id"));
		String nome = req.getParameter("nome");
		Especie especie = Especie.valueOf(req.getParameter("especie"));
		Integer idade = Integer.parseInt(req.getParameter("idade"));
		Sexo sexo = Sexo.valueOf(req.getParameter("sexo"));
		String raca = req.getParameter("raca");
		String pelagem = req.getParameter("pelagem");
		String problemas_saude = req.getParameter("problemas_saude");

		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		
		AnimalDao animalDao = new AnimalDao(SearcherDataSource.getInstance().getDataSource());
		Animal animal = new Animal();
		animal.setNome(nome);
		animal.setEspecie(especie);
		animal.setIdade(idade);
		animal.setSexo(sexo);
		animal.setRaca(raca);
		animal.setPelagem(pelagem);
		animal.setProblemas_saude(problemas_saude);
		
		if(id == 0) {
			if(animalDao.save(animal)) {
				req.setAttribute("result", "registered");
			}
		}else {
			animal.setId(id);
			if(animalDao.update(animal)) {
				req.setAttribute("result", "registered");
			}
		}
		return "/animal-register.jsp";
	}

}