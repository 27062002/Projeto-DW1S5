<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Página de Login</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #004080, #008080);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            color: #333;
        }
        .btn-primary {
            background-color: #004080;
            border-color: #004080;
            transition: background-color 0.3s ease;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #008080;
            border-color: #008080;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            transition: background-color 0.3s ease;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
        .input-group-text {
            background-color: #f8f9fa;
            border: none;
        }
        .input-group-text img {
            width: 20px;
            height: 20px;
        }
        .form-control {
            border-radius: 8px;
            box-shadow: none;
            padding-left: 45px;
        }
        .messages {
            margin-bottom: 20px;
        }
        .alert-success, .alert-danger {
            color: #ffffff;
            padding: 10px 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .alert-success {
            background-color: #28a745;
        }
        .alert-danger {
            background-color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="messages col-12">
            <c:choose>
                <c:when test="${result == 'registered'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Usuário cadastrado com sucesso.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:when>
                <c:when test="${result == 'loginError'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        E-mail ou senha inválidos.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:when>
            </c:choose>
        </div>
        <form action="ControllerServlet" method="post">
            <div class="login col-12">
                <div class="col-12">
                    <h1 class="text-center">Login</h1>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">
                        <img alt="ícone de e-mail" src="img/envelope.svg">
                    </span>
                    <input type="email" class="form-control" placeholder="E-mail" aria-label="E-mail" name="email" id="email">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">
                        <img alt="ícone de senha" src="img/file-lock.svg">
                    </span>
                    <input type="password" class="form-control" placeholder="Senha" aria-label="Senha" name="password" id="password">
                </div>
                <div class="col-12 mb-3">
                    <button type="submit" class="btn btn-primary w-100" name="action" value="login">Login</button>
                </div>
                <div class="col-12 mb-3">
                    <a class="btn btn-secondary w-100" href="user-register.jsp">Cadastrar</a>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>