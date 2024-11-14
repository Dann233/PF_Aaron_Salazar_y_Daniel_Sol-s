document.addEventListener('DOMContentLoaded', function () {
    const buscarBtn = document.getElementById('btn-buscar');
    const editarBtn = document.getElementById('btn-actualizar');
    const eliminarBtn = document.getElementById('btn-eliminar');
    const agregarBtn = document.getElementById('btn-agregar');

    buscarBtn.addEventListener('click', function () {
        const idbuscada = document.getElementById('id_cita').value.trim();
        if (idbuscada === '') {
            alert('Por favor, ingrese un número de cita para buscar.');
            return;
        }
        fetch(`../Modelo/buscar_cita.jsp?id_cita=${idbuscada}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ocurrió un problema al realizar la búsqueda.');
                }
                return response.json();
            })
            .then(data => {
                if (data && data.cedula && data.fecha && data.hora) {
                    const form_cita = document.getElementById('form_cita');
                    form_cita.querySelector('#cedula').value = data.cedula;
                    form_cita.querySelector('#fecha-cita').value = data.fecha;
                    form_cita.querySelector('#hora-cita').value = data.hora;
                } else {
                    alert('Número de cita no encontrado');
                }
            })
            .catch(error => {
                console.error('Error en la búsqueda:', error);
                document.getElementById('mensaje').innerHTML = '<p>Ocurrió un error en la búsqueda.</p>';
            });
    });

    // Eventos para actualizar, eliminar y agregar
    editarBtn.addEventListener('click', function (event) {
        const form_cita = document.getElementById('form_cita');
        if (!validarCampos(form_cita)) {
            alert('Por favor, llene todos los campos antes de editar.');
            event.preventDefault();
        } else {
            form_cita.action = '../Modelo/actualizar_cita.jsp';
            form_cita.submit();
        }
    });

    eliminarBtn.addEventListener('click', function (event) {
        const idbuscada = document.getElementById('id_cita').value.trim();
        if (idbuscada === '') {
            alert('Por favor, ingrese un número de cita para eliminar.');
            event.preventDefault();
            return;
        }
        const form_cita = document.getElementById('form_cita');
        form_cita.action = '../Modelo/eliminar_cita.jsp';
        form_cita.submit();
    });

    agregarBtn.addEventListener('click', function (event) {
        const form_cita = document.getElementById('form_cita');
        if (!validarCampos(form_cita)) {
            alert('Por favor, llene todos los campos antes de agregar.');
            event.preventDefault();
        } else {
            form_cita.action = '../Modelo/insertar_cita.jsp';
            form_cita.submit();
        }
    });

    function validarCampos(formulario) {
        const cedula = formulario.querySelector('#cedula').value.trim();
        const fecha = formulario.querySelector('#fecha-cita').value.trim();
        const hora = formulario.querySelector('#hora-cita').value.trim();
        return cedula !== '' && fecha !== '' && hora !== '';
    }
});
