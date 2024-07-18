package br.edu.ifsp.arq.ads.servlets.helpers;

import br.edu.ifsp.arq.ads.model.daos.UserDao;
import br.edu.ifsp.arq.ads.model.entities.User;
import br.edu.ifsp.arq.ads.utils.PasswordEncode;
import br.edu.ifsp.arq.ads.utils.SearcherDataSource;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAdmHelper implements Helper {

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String nome = req.getParameter("nome");
		String cpf = req.getParameter("cpf");
		String rg = req.getParameter("rg");
		String telefone = req.getParameter("telefone");
		String data_de_nascimento = req.getParameter("data_de_nascimento");
		String endereco = req.getParameter("endereco");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User();
		user.setNome(nome);
		user.setCpf(cpf);
		user.setRg(rg);
		user.setTelefone(telefone);
		user.setData_de_nascimento(LocalDate.parse(data_de_nascimento));
		user.setEndereco(endereco);
		user.setEmail(email);
		user.setPassword(PasswordEncode.encode(password));
		
		UserDao userDao = new UserDao(SearcherDataSource.getInstance().getDataSource());
		
		if(userDao.saveAdmUser(user)) {
			req.setAttribute("result", "registered");
			return "/adm-register.jsp";
		}else {
			req.setAttribute("result", "notRegistered");
			return "/adm-register.jsp";
		}
	}

}

