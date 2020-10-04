<%-- 
    Document   : principal
    Created on : Oct 1, 2020, 1:53:22 PM
    Author     : juan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <style>      
        .profile {
            margin: 10px 0;
        }

        .profile-sidebar {
            margin: 75px 0;
            padding: 10px 0 10px 0;
            background: #F1F3FA;
        }

        .profile-userpic img {
            float: none;
            margin: 0 auto;
            width: 50%;
            height: 50%;
            -webkit-border-radius: 50% !important;
            -moz-border-radius: 50% !important;
            border-radius: 50% !important;
        }

        .profile-usertitle {
            text-align: center;
            margin-top: 20px;
        }

        .profile-usertitle-name {
            color: #5a7391;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .profile-usertitle-job {
            text-transform: uppercase;
            color: #5b9bd1;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .profile-userbuttons {
            text-align: center;
            margin-top: 10px;
        }

        .profile-userbuttons .btn {
            text-transform: uppercase;
            font-size: 11px;
            font-weight: 600;
            padding: 6px 15px;
            margin-right: 5px;
        }

        .profile-userbuttons .btn:last-child {
            margin-right: 0px;
        }


        /* Profile Content */
        .profile-content {
            padding: 20px;
            background: #F1F3FA;
            min-height: 460px;
        }
    </style>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="row profile">
                <div class="col-md-4">
                    <div class="profile-sidebar">

                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name" >
                            ${login.getNombre()} <br>
                            ${login.getId()}
                        </div>

                        <div class="profile-usertitle-name" style="color: #A4A4A4;">
                            Estudiante<br>
                            E-mail: ${login.getCorreo()}<br>
                        </div>
                    </div>
                    <div class="profile-userbuttons">
                        <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalLong">Editar</button>
                    </div>
                </div>
            </div>           
            <div class="col-md-8" style="height: 430px;">
                <div class="navbar">
                    <form class="form-inline">
                        <a class="btn btn-outline-success" href="MatriculaServlet?action=listar" target="miFrame">Constancia de Matricula</a>
                        <a class="btn btn-outline-success" href="MatriculaServlet?action=oferta" target="miFrame">Editar Matricula</a>
                    </form>

                </div>
                <iframe src="MatriculaServlet?action=listar" name="miFrame" style="height: 100%; width: 100%; border: none"> </iframe>
            </div>
        </div>

        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form action="EstudianteServlet" method="POST">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Editar información</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Identificación</label>
                                    <input type="text" class="form-control" readonly="" name="txtId" value="${login.getId()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label >Contraseña</label>
                                    <input type="text" class="form-control"  name="txtContrasena" value="${login.getContrasena()}">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label >Nombre Completo</label>
                                    <input type="text" class="form-control"  placeholder="Nombres y Apellidos" name="txtNombre" value="${login.getNombre()}">
                                </div>
                                <div class="form-group col-md-4">
                                    <label >Correo Electrónico</label>
                                    <input type="text" class="form-control"  name="txtCorreo" value="${login.getCorreo()}">
                                </div>

                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>                            
                            <input type="submit" name="action" value="editar" class="btn btn-success ">

                        </div>
                    </form>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>               
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
