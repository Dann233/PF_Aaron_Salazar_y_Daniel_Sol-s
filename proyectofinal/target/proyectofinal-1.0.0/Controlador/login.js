document.addEventListener('DOMContentLoaded', () => {
    const togglePassword = document.getElementById('togglePassword');
    const passwordField = document.getElementById('passwordField');
    const userField = document.getElementById('textField');
    const iconLock = document.querySelector('.fa-lock');
    const iconEye = document.querySelector('.fa-eye');
    const iconEyeSlash = document.querySelector('.fa-eye-slash');
    const userLabel = document.getElementById('userLabel');
    const passwordLabel = document.getElementById('passwordLabel');

    // Alternar la visibilidad de la contraseña
    togglePassword.addEventListener('click', function () {
        const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', type);

        if (type === 'password') {
            iconEye.style.display = 'inline';
            iconEyeSlash.style.display = 'none';
        } else {
            iconEye.style.display = 'none';
            iconEyeSlash.style.display = 'inline';
        }
    });

    // Función para alternar la visibilidad de los labels
    const toggleLabelsVisibility = () => {
        userLabel.style.display = userField.value ? 'none' : 'none';
        passwordLabel.style.display = passwordField.value ? 'none' : 'none';
    };

    // Eventos de entrada y pérdida de foco para los campos de usuario y contraseña
    userField.addEventListener('input', toggleLabelsVisibility);
    userField.addEventListener('blur', toggleLabelsVisibility);
    passwordField.addEventListener('input', toggleLabelsVisibility);
    passwordField.addEventListener('blur', toggleLabelsVisibility);

    
    passwordField.addEventListener('focus', () => {
        if (passwordField.value) {
            togglePassword.style.display = 'inline';
        }
        iconLock.style.display = 'none';
    });

    passwordField.addEventListener('blur', () => {
        if (!passwordField.value) {
            togglePassword.style.display = 'none';
            iconLock.style.display = 'inline';
        }
    });

    passwordField.addEventListener('input', function () {
        if (this.value) {
            togglePassword.style.display = 'inline';
            iconLock.style.display = 'none';
        } else {
            togglePassword.style.display = 'none';
            iconLock.style.display = 'inline';
        }
    });
});
