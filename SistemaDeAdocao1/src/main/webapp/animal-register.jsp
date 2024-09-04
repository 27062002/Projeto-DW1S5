<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro de Animal</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/animal-register.css">
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
                        <a class="nav-link" href="ControllerServlet?action=listAnimals">Home</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="center col-lg-8 offset-lg-2 col-sm-12">
            <c:if test="${result == 'registered'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Animal cadastrado com sucesso.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${result == 'notRegistered'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Animal não cadastrado.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <form action="ControllerServlet" method="post" id="form2" enctype="multipart/form-data">
                <c:choose>
                    <c:when test="${animal == null}">
                        <h1>Novo Animal</h1>
                        <input type="hidden" name="id" value="0">
                    </c:when>
                    <c:when test="${animal != null}">
                        <h1>Edição de Animal</h1>
                        <input type="hidden" name="id" value="${animal.id}">
                    </c:when>
                </c:choose>

		<div class="mb-2">
			<label for="fileName">Foto do animal*</label>
			<input type = "file" name ="fileName" id ="fileName" accept = "image/*" />
		</div>

                <div class="form-group mb-3">
                    <i class="fa fa-paw"></i>
                    <input type="text" class="form-control" name="nome" id="nome" placeholder="Nome*" maxlength="50" required value="${animal.nome}">
                </div>

                <div class="form-group mb-3">
                    <i class="fa fa-dog"></i>
                    <select class="form-select" name="especie" id="especie" required>
                        <c:choose>
                            <c:when test="${animal == null}">
                                <option value="" selected>Selecione a Espécie*</option>
                            </c:when>
                        </c:choose>
                        <option value="CACHORRO" ${animal.especie == 'CACHORRO' ? 'selected' : ''}>Cachorro</option>
                        <option value="GATO" ${animal.especie == 'GATO' ? 'selected' : ''}>Gato</option>
                    </select>
                </div>

                <div class="form-group mb-3">
                    <i class="fa fa-calendar"></i>
                    <input type="number" class="form-control" name="idade" id="idade" placeholder="Idade*" step="1" required value="${animal.idade}">
                </div>

                <div class="form-group mb-3">
                    <i class="fa fa-venus-mars"></i>
                    <select class="form-select" name="sexo" id="sexo" required>
                        <c:choose>
                            <c:when test="${animal == null}">
                                <option value="" selected>Selecione o Sexo*</option>
                            </c:when>
                        </c:choose>
                        <option value="MACHO" ${animal.sexo == 'MACHO' ? 'selected' : ''}>Macho</option>
                        <option value="FEMEA" ${animal.sexo == 'FEMEA' ? 'selected' : ''}>Fêmea</option>
                    </select>
                </div>

                <div class="form-group mb-3">
                    <i class="fa fa-swatchbook"></i>
                    <input type="text" class="form-control" name="pelagem" id="pelagem" placeholder="Pelagem*" minlength="3" maxlength="50" required value="${animal.pelagem}">
                </div>

                <div class="form-group mb-3">
                    <i class="fa fa-dna"></i>
                    <input type="text" class="form-control" name="raca" id="raca" placeholder="Raça*" minlength="3" maxlength="50" required value="${animal.raca}">
                </div>

                <div class="form-group mb-3">
                    <i class="fa fa-notes-medical"></i>
                    <textarea class="form-control" name="problemas_saude" id="problemas_saude" placeholder="Problemas de saúde">${animal.problemas_saude}</textarea>
                </div>

                <div class="col-12 mb-3 text-center">
                    <button type="submit" class="btn btn-primary" name="action" value="saveAnimal">Salvar</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>