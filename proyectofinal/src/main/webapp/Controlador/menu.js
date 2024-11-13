// Abrir modal "Registrar Cita"
document.querySelector('.navbar ul li:nth-child(1) a').addEventListener('click', function(e) {
    e.preventDefault();
    //document.getElementById('modal').style.display = 'flex';
});

// Redirigir a ProcesosClientes.html al hacer clic en "Buscar Cita"
document.querySelector('.navbar ul li:nth-child(2) a').addEventListener('click', function(e) {
    e.preventDefault();
    window.location.href = 'ProcesosCliente.html';
});

// Abrir modal "Mis Citas"
document.querySelector('.navbar ul li:nth-child(3) a').addEventListener('click', function(e) {
    e.preventDefault();
    //document.getElementById('modalMisCitas').style.display = 'flex';
});

// Funciones para cerrar los modales específicos
function closeMisCitasModal() {
    document.getElementById('modalMisCitas').style.display = 'none';
}

function closeBuscarModal() {
    document.getElementById('modalBuscarCita').style.display = 'none';
}

function buscarCita() {
    const idCita = document.getElementById('idCita').value;

    if (idCita >= 1) {
        document.getElementById('detalleCitaBody').innerHTML = `
            <tr>
                <td>${idCita}</td>
                <td><!-- Aquí irá la cédula real --></td>
                <td><!-- Aquí irá la fecha real --></td>
            </tr>
        `;
        document.getElementById('modalBuscarCita').style.display = 'none';
        document.getElementById('modalDetalleCita').style.display = 'flex';
    } else {
        alert("El ID de la cita debe ser un número mayor o igual a 1.");
    }
}

function closeDetalleModal() {
    document.getElementById('modalDetalleCita').style.display = 'none';
}

/*
// Evento para cerrar el modal "Registrar Cita" y abrir el modal de fecha
document.querySelector('#modal .modal-buttons button[type="submit"]').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('modal').style.display = 'none';
    document.getElementById('modalDate').style.display = 'flex';
});
*/

function closeModalDate() {
    document.getElementById('modalDate').style.display = 'none';
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
}

function submitForm(actionUrl){
    document.getElementById('form-clientes').action = actionUrl;
    document.getElementById('form-clientes').submit();
}