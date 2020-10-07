<%-- 
    Document   : login
    Created on : Oct 1, 2020, 1:25:59 PM
    Author     : juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
    </head> 
    <body> 
        <jsp:include page="menu.jsp"></jsp:include> 
        <c:if test="${param.error==1}"> 
            <font color="red">Usuario Invalido. Intentelo de nuevo</font> 
        </c:if>
        <div class="modal-dialog text-center">
            <div class="col-sm-8" style="margin: 0 auto;margin-top: 25%;padding: 0">
                <div class="modal-content" style="background-color: #AAAAAA;padding: 0 20px;box-shadow: 0px 0px 3px #848484;border-radius: 5px">
                    <div class="col-12">
                        <img src="img/avatar2.png" width="100px" height="100px" style="margin-top: -50px;margin-bottom: 35px"/>
                    </div>
                    <form action="EstudianteServlet?action=login" method="post" class="col-12">
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Identificación" name="username" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Contraseña" name="password" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                        </div>
                        <div class="mb-3">
                            <button type="submit" name="action" class="btn btn-success mr-2">Ingresar</button>
                            <button type="reset" name="action" class="btn btn-outline-primary">Reiniciar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body> 
</html> 

