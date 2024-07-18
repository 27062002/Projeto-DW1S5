<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jakarta.tags.core -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!-- jakarta.tags.functions -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Página de Cadastro de Animal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/animal-register.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="ControllerServlet?action=listAnimals">Adoção</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link" href="ControllerServlet?action=listAnimals">Home</a>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div class="container ">
		<div class="center col-lg-6 offset-lg-3 col-sm-12">
				<c:if test="${result == 'registered'}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						Animal cadastrado com sucesso.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${result == 'notRegistered'}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						Animal não cadastrado.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
			<form action="ControllerServlet" method="post" id="form2">

					<c:choose>
						<c:when test="${animal == null}">
							<h1 class="text-center">Novo Animal</h1>
						</c:when>
						<c:when test="${animal != null}">
							<h1 class="text-center">Edição de Animal</h1>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${animal == null}">
							<input type="hidden" name="id" value="0">
						</c:when>
						<c:when test="${animal != null}">
							<input type="hidden" name="id" value="${animal.id}">
						</c:when>
					</c:choose>
					<div class="mb-2">
						<label for="nome">Nome*</label>
  						<input type="text" class="form-control" name="nome" id="nome" maxlength="50"
  						required="required" value="${animal.nome}">
					</div>
					<div class="mb-2">
						<label for="especie">Espécie*</label> 
						<select class="form-select"
							name="especie" id="especie" required="required">
							<c:choose>
								<c:when test="${animal == null}">
									<option value="" selected>Selecione</option>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${animal.especie != 'CACHORRO'}">
									<option value="CACHORRO">Cachorro</option>
								</c:when>
								<c:when test="${animal.especie == 'CACHORRO'}">
									<option value="CACHORRO" selected>Cachorro</option>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${animal.especie != 'GATO'}">
									<option value="GATO">Gato</option>
								</c:when>
								<c:when test="${animal.especie == 'GATO'}">
									<option value="GATO" selected>Gato</option>
								</c:when>
							</c:choose>
						</select>
					</div>
					
					<div class="mb-2">
						<label for="idade">Idade*</label> 
						<input type="number"
							name="idade" id="idade" class="form-control" step="1" 
							required="required" value="${animal.idade}">
					</div>
					
					<div class="mb-2">
						<label for="sexo">Sexo*</label> 
						<select class="form-select"
							name="sexo" id="sexo" required="required">
							<c:choose>
								<c:when test="${animal == null}">
									<option value="" selected>Selecione</option>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${animal.sexo != 'MACHO'}">
									<option value="MACHO">Macho</option>
								</c:when>
								<c:when test="${animal.sexo == 'MACHO'}">
									<option value="MACHO" selected>Macho</option>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${animal.sexo != 'FEMEA'}">
									<option value="FEMEA">Fêmea</option>
								</c:when>
								<c:when test="${animal.sexo == 'FEMEA'}">
									<option value="FEMEA" selected>Fêmea</option>
								</c:when>
							</c:choose>
					</div>
					
					<div class="mb-2">
						<label for="pelagem">Pelagem*</label>
  						<input type="text" class="form-control" name="pelagem" id="pelagem" minlength="3" maxlength="50"
  						required="required" value="${animal.pelagem}">
					</div>
					
					<div class="mb-2">
						<label for="raca">Raça*</label>
  						<input type="text" class="form-control" name="raca" id="raca" minlength="3" maxlength="50"
  						required="required" value="${animal.raca}">
					</div>
					
					<div class="mb-2">
						<label for = "problemas_saude">Problemas de saúde:</label>
						<textarea name = "problemas_saude" id = "problemas_saude" value="${animal.problemas_saude}">
						</textarea>
					</div>

					<div class="col-12 mb-2">
						<button type="submit" class="btn btn-primary" name="action" value="saveAnimal">Salvar</button>
					</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>