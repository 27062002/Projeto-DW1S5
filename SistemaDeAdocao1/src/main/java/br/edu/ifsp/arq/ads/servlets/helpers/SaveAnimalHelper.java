package br.edu.ifsp.arq.ads.servlets.helpers;

import java.io.File;
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
import javax.servlet.http.Part;

public class SaveAnimalHelper implements Helper {

	 private static final String UPLOAD_DIR = "uploads";
	 
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long id = Long.parseLong(req.getParameter("id"));
		String nome = req.getParameter("nome");
		String foto = getFoto(req, resp);
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
		animal.setFoto(foto);
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

	private String getFoto(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// gets absolute path of the web application
        String applicationPath = req.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = /*applicationPath*/"/home/aluno/eclipse-workspace/Projeto-DW1S5/SistemaDeAdocao1/src/main/webapp" + File.separator + UPLOAD_DIR;
         
        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
        System.out.println("aaaaaaaaaa="+applicationPath);
        String fileName = null;
        //Get all the parts from request and write it to the file on server
        for (Part part : req.getParts()) {
        	
            fileName = getFileName(part);
            System.out.println(fileName);
            if(!fileName.isEmpty()) {
            	part.write(uploadFilePath + File.separator + fileName);
            	return fileName;
            	//return uploadFilePath + File.separator + fileName;
            }
            
        }
 
        return fileName;
	}
	
	private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        if(contentDisp.contains("filename")) {
        	String[] tokens = contentDisp.split(";");
            for (String token : tokens) {
                if (token.trim().startsWith("filename")) {
                    return token.substring(token.indexOf("=") + 2, token.length()-1);
                }
            }
        }
        
        return "";
    }
}