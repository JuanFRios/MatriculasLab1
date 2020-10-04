<%-- 
    Document   : matricula
    Created on : Oct 3, 2020, 4:06:11 PM
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
        
        <c:if test="${materias.size()==0}">
            <p class="text-center">
                No hay materias matriculadas
            </p>
        </c:if>
        <c:if test="${materias.size()!=0}">
            <h1 class="text-center">Materias Matriculadas</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Codigo</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Creditos</th>
                        <th class="text-center">Facultad</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="m" items="${materias}">
                        <tr>
                            <td class="text-center">${m.getCodigo()}</td>
                            <td class="text-center">${m.getNombre()}</td>
                            <td class="text-center">${m.getCreditos()}</td>
                            <td class="text-center">${m.getFacultad()}</td>
                        </tr>

                    </c:forEach>



                </tbody>
            </table>
        </c:if>
       
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>               
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
