<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Citas</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/menu.css">
</head>
<body>
    <header class="header">
        <div class="menu container">
            <a href="<%= request.getContextPath() %>/menu.jsp" class="logo"> THEGC
                <img src="<%= request.getContextPath() %>/Vista/imagen/navaja.png" alt="">
            </a>

            <input type="checkbox" id="menu"/>
            <label for="menu"></label>

            <nav class="navbar">
                <ul>
                    <li><a href="<%= request.getContextPath() %>/menu.jsp">Inicio
                        <img src="<%= request.getContextPath() %>/Vista/imagen/casa.png" alt="">
                    </a></li>
                    <li><a href="<%= request.getContextPath() %>/mis_clientes.jsp">Mis Clientes
                        <img src="<%= request.getContextPath() %>/Vista/imagen/clientes.png" alt="">
                    </a></li>
                    <li><a href="<%= request.getContextPath() %>/mis_citas.jsp">Mis Citas
                        <img src="<%= request.getContextPath() %>/Vista/imagen/calendario.png" alt="">
                    </a></li>
                </ul>
            </nav>
        </div>
        <div class="header-content container">
            <div class="header-txt">
                <h1>Mis Citas GC </h1>
                <p>Donde el Estilo se Encuentra con la Tradición</p>
            </div>
        </div>
    </header>

    <section class="search-form container">
        <label for="cedula" class="form-label">Seleccione Cédula</label>
        <div class="input-group">
            <select id="cedula" aria-label="Seleccione la Cédula">
                <option value="">Seleccione la Cédula</option>
                <option value="cedula1">Cédula 1</option>
                <option value="cedula2">Cédula 2</option>
                <option value="cedula3">Cédula 3</option>
            </select>
            <button class="btn-buscar">
                <img src='<%= request.getContextPath() %>/Vista/imagen/buscar(1).png' alt="Buscar" style="height: 24px; vertical-align: middle;">
            </button>
        </div>

        <!-- Etiqueta y campo de fecha para la cita -->
        <label for="fecha-cita" class="form-label">Fecha de Cita</label>
        <input type="date" id="fecha-cita" placeholder="Fecha de la Cita" aria-label="Fecha de la Cita">

        <!-- Etiqueta y campo de hora en formato 24 horas -->
        <label for="hora-cita" class="form-label">Hora de Cita</label>
        <input type="time" id="hora-cita" placeholder="Hora de la Cita" aria-label="Hora de la Cita">

        <div class="action-buttons">
            <button class="btn-editar">Editar</button>
            <button class="btn-eliminar">Eliminar</button>
            <button class="btn-agregar">Agregar</button>
        </div>
    </section>

    <section class="table-section container">
        <table>
            <thead>
                <tr>
                    <th>ID Cita</th>
                    <th>Cédula</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                   <td></td>
                   <td></td>
                   <td></td>
                   <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </section>

    <script src="<%= request.getContextPath() %>/Controlador/menu.js"></script>

</body>
</html>