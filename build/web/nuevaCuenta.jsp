<%-- 
    Document   : nuevaCuenta
    Created on : Oct 1, 2020, 1:47:05 PM
    Author     : juan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="style.css"> <!-- Optional theme--> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> 
        <!-- Latest compiled and minified JavaScript --> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
    </head> 
    <body> 
        <jsp:include page="menu.jsp"></jsp:include> 
        <div class="container well"> 
            <div align="center"> 
                <form action="EstudianteServlet?action=insert" method="post"> 
                    <table> 
                        <tr> 
                            <th><label><b>Identificación:</b></label>
                            <th> <input type="number" placeholder="Digite la Identificación" class="form-control" name="id" required=""/> </th> 
                        </tr> 
                        <tr> 
                            <th><label><b>Nombre:</b></label>
                            <th> <input type="text" placeholder="Escriba su nombre" class="form-control" name="username" required=""/> </th> 
                        </tr> 
                        <tr> 
                            <th><label><b>Contraseña:</b></label></th> 
                            <th> <input type="password" placeholder="Defina una contraseña" class="form-control" name="password" required=""/> </th> 
                        </tr> 
                        <tr> 
                            <th><label><b>E-mail:</b></label></th> 
                            <th> <input type="email" placeholder="Escriba su E-mail" class="form-control" name="email" required=""/> </th> 
                        </tr> 
                        <div class="break"></div>
                        <tr> 
                            <td colspan="2"> <input class="btn icon-btn btn-success" type="submit" name="action" value="Insert"> <span class="glyphicon glyphicon-ok-sign"></span> 
                                <input class="btn icon-btn btn-lg" type="reset" name="action" value="Reset"> <span class="glyphicon glyphicon-remove"></span> 
                            </td> 
                        </tr> 
                    </table> 
                </form> 
            </div> 
            <br> 
        </div> 
    </body> 
</html> 
