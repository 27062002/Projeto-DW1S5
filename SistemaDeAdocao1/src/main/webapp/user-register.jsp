<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adoção - Cadastro de Usuário</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="./css/user-register.css">
</head>
<body>
    <div class="container">
        <div class="col-12">
            <c:if test="${result == 'notRegistered'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    E-mail já cadastrado, tente novamente.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
        </div>
        <form action="ControllerServlet" method="post" id="form1">
            <h1>Cadastre-se</h1>
            <div class="mb-3">
                <label for="nome">Nome completo*</label>
                <input type="text" class="form-control" name="nome" id="nome" maxlength="50" pattern="[a-zA-Z]{2,}(\s[a-zA-Z]{2,})+" placeholder="Nome completo">
            </div>
            <div class="mb-3">
                <label for="cpf">CPF*</label>
                <input type="text" class="form-control" name="cpf" id="cpf" pattern="[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}" placeholder="000.000.000-00">
            </div>
            <div class="mb-3">
                <label for="rg">RG*</label>
                <input type="text" class="form-control" name="rg" id="rg" pattern="[0-9]{2}\.[0-9]{3}\.[0-9]{3}-[0-9]{1}" placeholder="00.000.000-0">
            </div>
            <div class="mb-3">
                <label for="telefone">Telefone*</label>
                <input type="text" class="form-control" name="telefone" id="telefone" placeholder="(00)00000-0000" pattern="\([0-9]{2}\)[0-9]{5}-[0-9]{4}">
            </div>
            <div class="mb-3">
                <label for="data_de_nascimento">Data de Nascimento*</label>
                <input type="date" class="form-control" name="data_de_nascimento" id="data_de_nascimento" required>
            </div>
            <div class="mb-3">
                <label for="endereco">Endereço*</label>
                <input type="text" class="form-control" name="endereco" id="endereco" required>
            </div>
            <div class="mb-3">
                <label for="email">E-mail*</label>
                <input type="email" class="form-control" name="email" id="email" required>
            </div>
            <div class="mb-3">
                <label for="password">Senha*</label>
                <input type="password" class="form-control" name="password" id="password" minlength="6" maxlength="12" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword">Confirmação de Senha*</label>
                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" minlength="6" maxlength="12" required>
            </div>
            <div class="col-12 mb-2">
                <button type="submit" class="btn btn-primary w-100" name="action" value="addUser">Salvar</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/user-register.js"></script>
</body>
</html>