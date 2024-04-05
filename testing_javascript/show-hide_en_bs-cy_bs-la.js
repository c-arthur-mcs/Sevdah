
var buttons = document.getElementsByTagName("button");

function English() {
    var x = document.getElementByElement("bs-cy");
    x.style.display = "none";
    var y = document.getElementByElement("bs-la");
    y.style.display = "none";
    var z = document.getElementByElement("en");
    z.style.display = "block";
}

function Bosnian_Cyrillic() {
    var x = document.getElementByElement("en");
    x.style.display = "none";
    var y = document.getElementByElement("bs-la");
    y.style.display = "none";
    var z = document.getElementByElement("bs-cy");
    z.style.display = "block";
}

function Bosnian_Latin() {
    var x = document.getElementByElement("en");
    x.style.display = "none";
    var y = document.getElementByElement("bs-cy");
    y.style.display = "none";
    var z = document.getElementByElement("bs-la");
    z.style.display = "block";
}