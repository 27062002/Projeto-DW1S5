<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="pt-BR">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>Adoção - Página de Cadastro de Usuário</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/user-register.css">

  </head>
  <body>
  	<div class="container">
    	<div class="col-lg-6 offset-lg-3 col-sm-12">
    	<c:if test="${result == 'notRegistered' }">
    		<div class="alert alert-danger alert-dismissible fade show" role="alert">
  			E-mail já cadastrado tente novamente
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
    	</c:if>
    	 <form action="ControllerServlet" method="post" id="form1">
    	 		<h1 class="text-center">Cadastre-se</h1>
    	 		
    	 		<div class="mb-2">
					<label for="nome">Nome completo*</label>
  					<input type="text" class="form-control" name="nome" id="nome" maxlength="50" pattern="[a-zA-Z]{2,}(\s[a-zA-Z]{2,})+" placeholder="Nome completo"
  					required="required">
  					<span id="0"></span>
				</div>
				
				<div class="mb-2">
					<label for="cpf">CPF*</label>
  					<input type="text" class="form-control" name="cpf" id="cpf" pattern="[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}" placeholder="000.000.000-00"
  					required="required">
  					<span id="1"></span>
				</div>
				
				<div class="mb-2">
					<label for="rg">RG*</label>
  					<input type="text" class="form-control" name="rg" id="rg" pattern="[0-9]{2}\.[0-9]{3}\.[0-9]{3}-[0-9]{1}" placeholder="00.000.000-0"
  					required="required">
  					<span id="2"></span>
				</div>
				
				<div class="mb-2">
					<label for="telefone">Telefone*</label>
  					<input type="text" class="form-control" name="telefone" id="telefone" placeholder="(00)00000-0000" pattern="\([0-9]{2}\)[0-9]{5}-[0-9]{4}"
  					required="required">
  					<span id="3"></span>
				</div>
				
				<div class="mb-2">
  					<label for="data_de_nascimento">Data de Nascimento*</label>
  					<input type="date" class="form-control" name="data_de_nascimento" id="data_de_nascimento" required="required">
  					<span id="4"></span>
				</div>
				
				<div class="mb-2">
					<label for="endereco">Endereço*</label>
  					<input type="text" class="form-control" name="endereco" id="endereco"
  					required="required">
  					<span id="5"></span>
				</div>
				
				<div class="mb-2">
					<label for="email">E-mail*</label>
  					<input type="email" class="form-control" name="email" id="email"
  					required="required">
  					<span id="6"></span>
				</div>
				
				<div class="mb-2">
  					<label for="password">Senha*</label>
  					<input type="password" class="form-control" name="password" id="password" minlength="6" maxlength="12" required="required">
  					<span id="7"></span>
				</div>
				
				<div class="mb-2">
  					<label for="confirmPassword">Confirmação de Senha*</label>
  					<input type="password" class="form-control" name="confirmPassword" id="confirmPassword" minlength="6" maxlength="12" required="required">
  					<span id="8"></span>
				</div>
				
				<div class="col-12 mb-2">
					<button type="submit" class="btn btn-primary" name="action" value="addUser">Salvar</button>
				</div>
    	 </form>
    	</div>
    </div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/user-register.js"></script>
  </body>
</html>