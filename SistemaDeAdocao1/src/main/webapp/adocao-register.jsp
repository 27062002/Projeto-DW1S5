<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jakarta.tags.core -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><!-- jakarta.tags.functions -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Página de Cadastro de Adoção</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/adocao-register.css">
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
						Adoção cadastrada com sucesso.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
				<c:if test="${result == 'notRegistered'}">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						Adoção não cadastrada.
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
				</c:if>
			<form action="ControllerServlet" method="post" id="form2">

					<c:choose>
						<c:when test="${adocao == null}">
							<h1 class="text-center">Nova Adoção</h1>
						</c:when>
					</c:choose>
					<div class="mb-2">
						<label for="date">Data*</label> 
						<input type="date" name="date" id="date"
							class="form-control" required="required" value="${adocao.date}">
					</div>
					
					<div class="mb-2">
						<label for="animal">Animal*</label> 
						<input type="number"
							name="animal" id="animal" class="form-control" step="1" 
							required="required" value="${adocao.animal}">
					</div>
					
					<div class="mb-2">
					<label for="email">E-mail*</label>
  					<input type="email" class="form-control" name="email" id="email"
  					required="required">
  					<span id="6"></span>
				</div>

					<div class="col-12 mb-2">
						<button type="submit" class="btn btn-primary" name="action" value="addAdocao">Salvar</button>
					</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>