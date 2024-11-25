<%@ page import="controladores.UserDAORegr" %> 
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UniDesk | Login</title>
        <link rel="icon" href="logo1.ico"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9133fd9d09.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'poppins';
            }
            body {
                background-color: #f4f6f8;
                width: 100%;
                height: 100vh;
                background: linear-gradient(90deg, #D3E9F9, #fff);
                margin: 0;
                font-family: sans-serif;
                color: aliceblue;
                display: grid;
                min-height: 100vh;
                grid-template-rows: auto 1fr auto;
            }
            .container{
                max-width: 1200px;
                margin: 0 auto;
            }
            .navbar-collapse {
                display: flex !important;
                flex-basis: auto;
                justify-content: end;
            }
            nav{
                width: 100%;
                text-align: end;
            }
            nav ul li{
                display: inline-block;
                margin: 10px 20px;
            }
            nav ul li a{
                text-decoration: none;
                color:black;
            }
            section{
                min-height: 400px;
                margin-top: 50px;
            }
            /* From Uiverse.io by micaelgomestavares */
            .form {
                display: flex;
                flex-direction: column;
                gap: 10px;
                background-color: #ffffff;
                padding: 30px;
                width: 450px;
                border-radius: 20px;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }

            ::placeholder {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }

            .form button {
                align-self: flex-end;
            }

            .flex-column > label {
                color: #151717;
                font-weight: 600;
            }

            .inputForm {
                border: 1.5px solid #ecedec;
                border-radius: 10px;
                height: 50px;
                display: flex;
                align-items: center;
                padding-left: 10px;
                transition: 0.2s ease-in-out;
            }

            .input {
                margin-left: 10px;
                border-radius: 10px;
                border: none;
                width: 85%;
                height: 100%;
            }

            .input:focus {
                outline: none;
            }

            .inputForm:focus-within {
                border: 1.5px solid #2d79f3;
            }

            .flex-row {
                display: flex;
                flex-direction: row;
                align-items: center;
                gap: 10px;
                justify-content: space-between;
            }

            .flex-row > div > label {
                font-size: 14px;
                color: black;
                font-weight: 400;
            }

            .span {
                font-size: 14px;
                margin-left: 5px;
                color: #2d79f3;
                font-weight: 500;
                cursor: pointer;
            }

            .button-submit {
                margin: 20px 0 10px 0;
                background-color: #151717;
                border: none;
                color: white;
                font-size: 15px;
                font-weight: 500;
                border-radius: 10px;
                height: 50px;
                width: 100%;
                cursor: pointer;
            }

            .button-submit:hover {
                background-color: #252727;
            }

            .p {
                text-align: center;
                color: black;
                font-size: 14px;
                margin: 5px 0;
            }

            .btn {
                margin-top: 10px;
                width: 100%;
                height: 50px;
                border-radius: 10px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-weight: 500;
                gap: 10px;
                border: 1px solid #ededef;
                background-color: white;
                cursor: pointer;
                transition: 0.2s ease-in-out;
            }

            .btn:hover {
                border: 1px solid #2d79f3;
                ;
            }
            /*FOOTER*/
            .pie-pagina{
                width: 100%;
                background-color: black;
            }
            .pie-pagina .grupo-1{
                width: 100%;
                max-width:1200px;
                margin:auto;
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                grid-gap: 50px;
                padding: 45px 0px;
            }
            .pie-pagina .grupo-1 .box figure{
                width: 50%;
                height: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .pie-pagina .grupo-1 .box figure img{
                width: 200px;
            }
            .pie-pagina .grupo-1 .box h2{
                color: white;
                margin-bottom: 25px;
                font-size: 20px;
            }

            .pe-pagina .grupo-1 .box p{
                color: white;
                margin-bottom: 10px;
            }
            .pie-pagina .grupo-1 .red-social a{
                display: inline-block;
                text-decoration: none;
                width: 45px;
                height: 45px;
                line-height: 45px;
                color: white;
                margin-right: 10px;
                background-color: #0d2033;
                text-align: center;
                transition: all 300ms ease;
            }
            .pie-pagina .grupo-1 .red-social a:hover{
                color: aqua;
            }
            .pie-pagina .grupo-2{
                background-color: #0a1a2a;
                padding: 15px 10px;
                text-align: center;
                color: white;
            }
            .pie-pagina .grupo-2 small{
                font-size: 15px;
            }
            @media screen and (max-width: 800px){
                .pie-pagina.grupo-1{
                    width: 100%;
                    grid-template-columns: repeat(1, 1fr);
                    grid-gap: 30px;
                    padding: 35px 0px;
                }
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">UniDesk</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="InicioSesion.jsp">Iniciar sesión</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Registro.jsp">Registrarse</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Section-->
        <section>
            <center>
                <form class="form" method="get">
                    <div class="flex-column">
                        <label>Usuario </label>
                    </div>
                    <div class="inputForm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="color: black;" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                        <input id="usuario" type="text" name="usuario" class="input" placeholder="Ingresar usuario" required>
                    </div>

                    <div class="flex-column">
                        <label>Contraseña </label>
                    </div>
                    <div class="inputForm">
                        <svg height="20" viewBox="-64 0 512 512" width="20" xmlns="http://www.w3.org/2000/svg">
                        <path d="m336 512h-288c-26.453125 0-48-21.523438-48-48v-224c0-26.476562 21.546875-48 48-48h288c26.453125 0 48 21.523438 48 48v224c0 26.476562-21.546875 48-48 48zm-288-288c-8.8125 0-16 7.167969-16 16v224c0 8.832031 7.1875 16 16 16h288c8.8125 0 16-7.167969 16-16v-224c0-8.832031-7.1875-16-16-16zm0 0"/>
                        <path d="m304 224c-8.832031 0-16-7.167969-16-16v-80c0-52.929688-43.070312-96-96-96s-96 43.070312-96 96v80c0 8.832031-7.167969 16-16 16s-16-7.167969-16-16v-80c0-70.59375 57.40625-128 128-128s128 57.40625 128 128v80c0 8.832031-7.167969 16-16 16zm0 0"/>
                        </svg>        
                        <input id="password" type="password" name="password" class="input" placeholder="Ingresar contraseña" required>
                    </div>

                    <button class="button-submit" type="submit">Ingresar</button>
                </form>
                <%
                    // Validar si se hizo una solicitud GET
                    if ("GET".equalsIgnoreCase(request.getMethod())) {
                        String usuario = request.getParameter("usuario");
                        String password = request.getParameter("password");

                        UserDAORegr userDAORegr = new UserDAORegr();
                        if (usuario == null && password == null) {
                            // No se hace nada si no hay parámetros
                        } else {
                            try {
                                // Verificar si el usuario existe en la base de datos
                                boolean exists = userDAORegr.verifyUser(usuario, password);
                                System.out.println("" + exists);
                                if (exists) {
                                    // Mostrar alerta de éxito y redirigir
                                    out.println("<script>");
                                    out.println("Swal.fire({");
                                    out.println("    icon: 'success',");
                                    out.println("    title: 'Usuario encontrado',");
                                    out.println("    text: 'Redirigiendo a la página principal...',");
                                    out.println("    timer: 3000,");
                                    out.println("    showConfirmButton: false");
                                    out.println("}).then(() => {");
                                    out.println("    window.location.href = 'socket1.jsp';");  // Redirige a la página principal
                                    out.println("});");
                                    out.println("</script>");
                                } else {
                                    // Mostrar alerta de error
                                    out.println("<script>");
                                    out.println("Swal.fire({");
                                    out.println("    icon: 'error',");
                                    out.println("    title: 'Error',");
                                    out.println("    text: 'Usuario o contraseña incorrectos',");
                                    out.println("    confirmButtonText: 'Intentar de nuevo'");
                                    out.println("});");
                                    out.println("</script>");
                                }
                            } catch (SQLException e) {
                                // Mostrar alerta en caso de error en la base de datos
                                out.println("<script>");
                                out.println("Swal.fire({");
                                out.println("    icon: 'error',");
                                out.println("    title: 'Error de servidor',");
                                out.println("    text: 'Error al verificar el usuario: " + e.getMessage() + "',");
                                out.println("    confirmButtonText: 'Intentar de nuevo'");
                                out.println("});");
                                out.println("</script>");
                            }
                        }
                    }
                %>
                <div>

                </div>
            </center>
        </section>
        <script>
            window.addEventListener('mouseover', initLandbot, {once: true});
            window.addEventListener('touchstart', initLandbot, {once: true});
            var myLandbot;
            function initLandbot() {
                if (!myLandbot) {
                    var s = document.createElement('script');
                    s.type = 'text/javascript';
                    s.async = true;
                    s.addEventListener('load', function () {
                        var myLandbot = new Landbot.Livechat({
                            configUrl: 'https://storage.googleapis.com/landbot.online/v3/H-2690385-ZM7H0X0G499QIW00/index.json',
                        });
                    });
                    s.src = 'https://cdn.landbot.io/landbot-3/landbot-3.0.0.js';
                    var x = document.getElementsByTagName('script')[0];
                    x.parentNode.insertBefore(s, x);
                }
            }
        </script>
        <!-- Footer -->
        <footer class="pie-pagina">
            <div class="grupo-1">
                <div class="box">
                    <div class="box">
                        <figure>
                            <a href="#">
                                <img src="1.svg" alt="">
                            </a>
                        </figure>
                    </div>
                </div>
                <div class="box">
                    <h2>SOBRE NOSOTROS</h2>
                    <p>Estudiantes de la universidad Autónoma del Perú.</p>
                    <p>Curso: Sistemas distibuidos</p>
                    <p>Ciclo: 6to</p>
                </div>
                <div class="box">
                    <h2>SIGUENOS</h2>
                    <div class="red-social">
                        <a href="#" class="fa fa-facebook"></a>
                        <a href="#" class="fa fa-instagram"></a>
                        <a href="#" class="fa fa-youtube"></a>
                    </div>
                </div>
            </div>
            <div class="grupo-2">
                <small>&COPY;Todos los derechos Reservados; UniDesk-Grupo5</small>
            </div>
        </footer>
    </body>
</html>
