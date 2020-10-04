<%-- 
    Document   : oferta
    Created on : Oct 4, 2020, 10:54:17 AM
    Author     : juan
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="text-center">Codigo</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Creditos</th>
                    <th class="text-center">Facultad</th>
                    <th class="text-center"></th>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="m" items="${oferta}">
                    <tr>
                        <td class="text-center">${m.getCodigo()}</td>
                        <td class="text-center">${m.getNombre()}</td>
                        <td class="text-center">${m.getCreditos()}</td>
                        <td class="text-center">${m.getFacultad()}</td>
                        <c:if test="${materias.contains(m)}">    

                            <td class="text-center"><a class="btn btn-danger" href="MatriculaServlet?action=cancelar&codigo=${m.getCodigo()}">Cancelar</a></td>
                        </c:if>
                        <c:if test="${!materias.contains(m)}">
                            <td class="text-center"><a class="btn btn-success" href="MatriculaServlet?action=matricular&codigo=${m.getCodigo()}">Matricular</a></td>
                        </c:if>
                    </tr>

                </c:forEach>



            </tbody>
        </table>
    </body>
</html>
