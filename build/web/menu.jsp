<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<c:if test="${empty login}"> 
    <div class="navbar-container">
        <nav class="navbar navbar-light" style="background-color: #D8FFCE;">
            <a class="navbar-brand mr-auto" href="index.jsp">
                <img src="img/logo.png" width="40" height="40" class="d-inline-block align-top" alt="Logo UdeA">
            </a>
            <div class="d-flex flex-row justify-content-around">
                <a class="btn btn-success mr-2" href="login.jsp">Iniciar Sesión</a>
                <a class="btn btn-primary" href="nuevaCuenta.jsp">Registrarse</a>
            </div>
        </nav>
    </div>
    
</c:if>

<c:if test="${not empty login}">
    <div class="navbar-container">
        <nav class="navbar navbar-light" style="background-color: #D8FFCE;">
            <a class="navbar-brand mr-auto" href="index.jsp">
                <img src="img/logo.png" width="40" height="40" class="d-inline-block align-top" alt="Logo UdeA">
            </a>
            <div class="d-flex flex-row justify-content-around">
                <a class="btn btn-success" href="EstudianteServlet?action=logout">Salir</a>
            </div>
        </nav>
    </div>
</c:if>

<hr/>