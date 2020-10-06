<%-- 
    Document   : nuevaCuenta
    Created on : Oct 1, 2020, 1:47:05 PM
    Author     : juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Registrarse</title>
    </head> 
    <body> 
        <jsp:include page="menu.jsp"></jsp:include>
<<<<<<< HEAD
        <div class="modal-dialog text-center">
            <div class="col-sm-8" style="margin: 0 auto;margin-top: 25%;padding: 0">
                <div class="modal-content" style="background-color: #AAAAAA;padding: 20px 20px;box-shadow: 0px 0px 3px #848484;border-radius: 5px">
                    <form action="EstudianteServlet?action=insert" method="post" class="col-12">
                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Identificación" name="id" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nombre" name="username" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Contraseña" name="password" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" name="email" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                        </div>
                        <div>
                            <button type="submit" name="action" class="btn btn-success mr-2">Registrarse</button>
                            <button type="reset" name="action" class="btn btn-outline-primary">Reiniciar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body> 
=======
    <c:if test="${param.err==1}">
        <font color="red">Usuario ya registrado. Intentelo de nuevo</font> 
    </c:if>
    <div class="modal-dialog text-center">
        <div class="col-sm-8" style="margin: 0 auto;margin-top: 25%;padding: 0">
            <div class="modal-content" style="background-color: #AAAAAA;padding: 20px 20px;box-shadow: 0px 0px 3px #848484;border-radius: 5px">
                <form action="EstudianteServlet?action=insert" method="post" class="col-12">
                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Identificación" name="id" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Nombre" name="username" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Contraseña" name="password" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email" name="email" required="" style="height: 42px;font-size: 18px;border: 0;border-radius: 5px"/>
                    </div>
                    <div>
                        <button type="submit" name="action" class="btn btn-success mr-2">Registrarse</button>
                        <button type="reset" name="action" class="btn btn-outline-primary">Reiniciar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body> 
>>>>>>> feature-refact-front
</html> 
