document.addEventListener('DOMContentLoaded', function () {
    const submitbtn = document.getElementById('submit-btn');

    submitbtn.addEventListener('click', function (event) {
        const form_login = document.getElementById('form_login');
        if (!validarCampos(form_login)) {
            alert('Por favor, llene todos los campos antes de ingresar.');
            event.preventDefault();
        } else {
            form_login.action = '../Modelo/login.jsp';
            form_login.submit();
        }
    });

    function validarCampos(formulario) {
        const usuario = formulario.querySelector('#usuario').value.trim();
        const clave = formulario.querySelector('#clave').value.trim();
        return usuario !== '' && clave !== '';
    }
});