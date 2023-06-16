window.onload = () => {
    // detectColor();
    randomColor();
}

const colors = ['yellow','pink','red','blue','purple','grey','black'];

function randomColor() {
    var buttons = document.querySelectorAll('#container div');
    for (var i = 0; 1 < buttons.length; i++) {
        var button = buttons[i];
        button.addEventListener('click', function () {
            changeBgColor(this.id);
        })
    }
}

function changeBgColor(color) {
    document.getElementById(color).style.backgroundColor = colors[Math.floor(Math.random()*colors.length)];
}

// function detectColor() {
//     var buttons = document.querySelectorAll('#container div');
//     for (var i = 0; 1 < buttons.length; i++) {
//         var button = buttons[i];
//         button.addEventListener('click', function () {
//             changeBgColor(this.id);
//         })
//     }
// }

// function changeBgColor(color) {
//     document.getElementsByTagName('body')[0].style.backgroundColor = color;
// }

