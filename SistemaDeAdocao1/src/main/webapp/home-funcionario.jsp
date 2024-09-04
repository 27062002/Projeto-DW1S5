<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import = "java.util.List,br.edu.ifsp.arq.ads.model.entities.Animal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jakarta.tags.core -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- jakarta.tags.functions -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adoção - Página Principal</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/home-funcionario.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="ControllerServlet?action=listAnimals">Adoção</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="animal-register.jsp">Animal</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="statistics.jsp">Estatísticas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ControllerServlet?action=listAnimalsForAdocoes">Adoção</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ControllerServlet?action=listAdocoes">Listagem de Adoções</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                            ${sessionScope.user.nome}
                        </a>
                        <ul class="dropdown-menu">
                            
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="ControllerServlet?action=logout">Sair</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container-master">
			<div class="title">
		        <div class="title-content">
		            <h1>Adoção de Animais</h1>
		            <p>Encontre um novo amigo hoje mesmo</p>
		        </div>
		    </div>
	    <div class="container">
	        <div class="col-12">
	            <h1 class="text-center">Listagem de Animais</h1>
	        </div>
	        
	        <form action="ControllerServlet" method="post">
	            <div class="row">
	                <div class="col-12 col-lg-3">
	                    <div class="mb-2">
	                        <label for="especie">Espécie</label>
	                        <select class="form-select" name="especie" id="especie">
	                            <option value="" selected>Selecione</option>
	                            <option value="CACHORRO">Cachorro</option>
	                            <option value="GATO">Gato</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="col-12 col-lg-3 mt-4">
	                    <button type="submit" class="btn btn-primary" name="action" value="searchAnimals">Filtrar</button>
	                </div>
	            </div>
	        </form>
	
	        <c:choose>
	            <c:when test="${fn:length(animals) > 0}">
	                <div class="table-responsive">
	                    <table class="table table-striped table-hover">
	                        <thead>
	                            <tr>
	                                <th>ID</th>
					<th>Foto</th>
	                                <th>Nome</th>
	                                <th>Espécie</th>
	                                <th>Idade</th>
	                                <th>Sexo</th>
	                                <th>Ações</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach var="animal" items="${animals}" varStatus="index">
	                                <tr>
	                                    <td>${animal.id}</td>
	                                    <td><img src="uploads/${animal.foto}" alt="Foto"></td>
	                                    <td>${animal.nome}</td>
	                                    <td>${animal.especie}</td>
	                                    <td>${animal.idade}</td>
	                                    <td>${animal.sexo}</td>
	                                    <td>
	                                        <span data-bs-toggle="tooltip" data-bs-placement="top" title="Editar">
	                                            <a class="btn" href="ControllerServlet?action=updateAnimal&animal-id=${animal.id}">
	                                                <i class="fa fa-edit"></i>
	                                            </a>
	                                        </span>
	                                        <span data-bs-toggle="tooltip" data-bs-placement="top" title="Excluir">
	                                            <a type="button" class="btn" data-bs-toggle="modal" data-bs-target="#myModal" data-bs-id="${animal.id}">
	                                                <i class="fa fa-trash"></i>
	                                            </a>
	                                        </span>
	                                    </td>
	                                </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	            </c:when>
	            <c:otherwise>
	                <p class="text-center">Sem nenhum animal registrado.</p>
	            </c:otherwise>
	        </c:choose>
	    </div>
</div>
    <!-- Modal -->
    <div class="modal" tabindex="-1" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Exclusão</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Tem certeza que deseja excluir o animal?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" id="delete" class="btn btn-danger">Excluir</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/home.js"></script>
</body>
</html>