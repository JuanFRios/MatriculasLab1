<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<c:if test="${empty login}"> 
    <div class="navbar">
        <form class="form-inline">
            <a class="btn btn-outline-success" href="login.jsp">Iniciar Sesión</a>
            <a class="btn btn-outline-success" href="nuevaCuenta.jsp">Registrarse</a>
        </form>
        
    </div>
    
</c:if>

<c:if test="${not empty login}">
    <div class="navbar">
        <!-- Button trigger modal -->
        <form class="form-inline">
            <a class="btn btn-outline-success" href="EstudianteServlet?action=logout">Salir</a>
        </form>
    </div>
</c:if>

<hr/>