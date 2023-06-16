window.onload = () => {
    funcionarAlert();
}

function funcionarAlert() {
    const boton = document.getElementById('boton');

boton.addEventListener('click', () => {
    alert('Hola mundo')
})
}

