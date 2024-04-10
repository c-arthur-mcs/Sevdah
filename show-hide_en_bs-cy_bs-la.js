function init(){
    var buttons = document.getElementsByTagName("button")
    var EnButton = buttons[0]
    EnButton.addEventListener('click',English)
    var BsCyButton = buttons[1]
    BsCyButton.addEventListener('click',Bosnian_Cyrillic)
    var BsLaButton = buttons[2]
    BsLaButton.addEventListener('click',Bosnian_Latin)
}

function English() {
    var x = document.getElementsByClassName("bs-cy");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.display = "none"
        };  
    var y = document.getElementsByClassName("bs-la");
    for(let i = 0; i < y.length; i++)
        {
        y[i].style.display = "none"
        };  
    var z = document.getElementsByClassName("en");
    for(let i = 0; i < z.length; i++)
        {
        z[i].style.display = "block"
        };  
}

function Bosnian_Cyrillic() {
    var x = document.getElementsByClassName("en");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.display = "none"
        };  
    var y = document.getElementsByClassName("bs-la");
    for(let i = 0; i < y.length; i++)
        {
        y[i].style.display = "none"
        };  
    var z = document.getElementsByClassName("bs-cy");
    for(let i = 0; i < z.length; i++)
        {
        z[i].style.display = "block"
        };  
}

function Bosnian_Latin() {
    var x = document.getElementsByClassName("en");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.display = "none"
        };  
    var y = document.getElementsByClassName("bs-cy");
    for(let i = 0; i < y.length; i++)
        {
        y[i].style.display = "none"
        };  
    var z = document.getElementsByClassName("bs-la");
    for(let i = 0; i < z.length; i++)
        {
        z[i].style.display = "block"
        };  
}

window.onload = init;