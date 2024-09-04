<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adoção - Cadastro de Administradores</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
     <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f0f4f8;
            color: #333;
        }
        .navbar {
            background-color: #003366 !important;
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
        }
        .nav-link:hover {
            color: #66ccff !important;
        }
        .container {
            margin-top: 50px;
            max-width: 900px;
        }
        .row {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .form-control {
            border-radius: 8px;
            padding-left: 40px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }
        .form-group .fa {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }
        .btn-primary {
            background-color: #003366;
            border-color: #003366;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #66ccff;
            border-color: #66ccff;
        }
        h1 {
            font-weight: 700;
            margin-bottom: 20px;
            text-align: center;
        }
        .alert-success, .alert-danger {
            margin-bottom: 20px;
        }
        .image-side {
            background-color: #003366;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }
        .image-side img {
            max-width: 100%;
            border-radius: 10px;
        }
    </style>
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
        <div class="row">
            <div class="col-lg-6 image-side d-none d-lg-flex">
                <img src="images/cadastro_administrador.jpg" alt="Cadastro de Administrador">
            </div>
            <div class="col-lg-6 p-5">
                <c:if test="${result == 'registered'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Administrador cadastrado com sucesso.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${result == 'notRegistered'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        Administrador não cadastrado.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <form action="ControllerServlet" method="post" id="form1">
                    <h1>Cadastro</h1>
                    
                    <div class="form-group">
                        <i class="fa fa-user"></i>
                        <input type="text" class="form-control" name="nome" id="nome" placeholder="Nome completo*" minlength="3" maxlength="50" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-id-card"></i>
                        <input type="text" class="form-control" name="cpf" id="cpf" pattern="[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}" placeholder="000.000.000-00"
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-address-card"></i>
                        <input type="text" class="form-control" name="rg" id="rg" pattern="[0-9]{2}\.[0-9]{3}\.[0-9]{3}-[0-9]{1}" placeholder="00.000.000-0"
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-phone"></i>
                        <input type="text" class="form-control" name="telefone" id="telefone" placeholder="(00)00000-0000" pattern="\([0-9]{2}\)[0-9]{5}-[0-9]{4}"
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-calendar-alt"></i>
                        <input type="date" class="form-control" name="data_de_nascimento" id="data_de_nascimento" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-map-marker-alt"></i>
                        <input type="text" class="form-control" name="endereco" id="endereco" placeholder="Endereço*" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-envelope"></i>
                        <input type="email" class="form-control" name="email" id="email" placeholder="E-mail*" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-lock"></i>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Senha*" minlength="6" maxlength="12" required>
                    </div>
                    
                    <div class="form-group">
                        <i class="fa fa-lock"></i>
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirmação de Senha*" minlength="6" maxlength="12" required>
                    </div>
                    
                    <div class="col-12 mb-3 text-center">
                        <button type="submit" class="btn btn-primary" name="action" value="addEmployee">Salvar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>