
/* GLOBAL VARIABLES */
var slavic
var turkic
var germanic
var greek
var hungarian
var italian
var latin


/* INITIALIZION */
function init() {
    var buttons = document.getElementsByName("button")
    slavic = document.getElementsByClassName("slavic")
    turkic = document.getElementsByClassName("turkic")
    germanic = document.getElementsByClassName("germanic")
    greek = document.getElementsByClassName("greek")
    hungarian = document.getElementsByClassName("hungarian")
    italian = document.getElementsByClassName("italian")
    latin = document.getElementsByClassName("latin")
    /*console.log(buttons)*/
    /* SLAVIC ORIGIN BUTTONS */
    var SlavItalicButton = buttons[3];
    SlavItalicButton.addEventListener('click', Italic(slavic));
    var SlavBoldButton = buttons[4];
    SlavBoldButton.addEventListener('click', Bold(slavic));
    var SlavUnderButton = buttons[5];
    SlavUnderButton.addEventListener('click', Under(slavic));
    var SlavClearButton = buttons[6];
    SlavClearButton.addEventListener('click', Clear(turkic));
    /* TURKIC ORIGIN BUTTONS */
    var TurkItalicButton = buttons[7];
    TurkItalicButton.addEventListener('click', Italic(turkic));
    var TurkBoldButton = buttons[8];
    TurkBoldButton.addEventListener('click', Bold(turkic));
    var TurkUnderButton = buttons[9];
    TurkUnderButton.addEventListener('click', Under(turkic));
    var TurkClearButton = buttons[10];
    TurkClearButton.addEventListener('click', Clear(turkic));
    /* OTHER ORIGIN BUTTONS */
    var OtherItalicButton = buttons[11];
    OtherItalicButton.addEventListener('click', OtherItalic);
    var OtherBoldButton = buttons[12];
    OtherBoldButton.addEventListener('click', Other_Bold);
    var OtherUnderButton = buttons[13];
    OtherUnderButton.addEventListener('click', Other_Under);
    var OtherClearButton = buttons[14];
    OtherClearButton.addEventListener('click', Other_Clear);
    /* ALPHABET BUTTONS */
    var LatinButton = buttons[15];
    LatinButton.addEventListener('click', Latin);
    var CyrillicButton = buttons[16];
    CyrillicButton.addEventListener('click', Cyrillic);
}

function Italic(input) {
    console.log("buttonPushed")
    for(let i = 0; i < input.length; i++)
        {
        input[i].style.fontStyle = "italic"
        };
}

function Bold(input) {
    console.log("buttonPushed")
    for(let i = 0; i < input.length; i++)
        {
        input[i].style.fontWeight = "bold"
        };
}

function Under(input) {
    console.log("buttonPushed")
    for(let i = 0; i < input.length; i++)
        {
        input[i].style.textDecoration = "underline"
        };
}

function Clear(input) {
    console.log("buttonPushed")
    for(let i = 0; i < input.length; i++)
        {
        input[i].style.textDecoration = "none"
        input[i].style.fontWeight = "normal"
        input[i].style.fontStyle = "normal"
        };
}

function OtherItalic() {
    Italic(germanic)
    Italic(greek)
    Italic(hungarian)
    Italic(italian)
    Italic(latin)
}

/* OTHER FUNCTIONS */
function Other_Italic() {
    var x = document.getElementsByClassName ("germanic", "greek", "hungarian", "italian", "latin");
    for (let i = 0; i < x.length; i++) {
        x[i].style.fontStyle = "italic"
    };
}

function Other_Bold() {
    var x = document.getElementsByClassName ("germanic", "greek", "hungarian", "italian", "latin");
    for (let i = 0; i < x.length; i++) {
        x[i].style.fontWeight = "bold"
    };
}

function Other_Under() {
    var x = document.getElementsByClassName ("germanic", "greek", "hungarian", "italian", "latin");
    for (let i = 0; i < x.length; i++) {
        x[i].style.textDecoration = "underline"
    };
}

function Other_Clear() {
    var x = document.getElementsByClassName ("germanic", "greek", "hungarian", "italian", "latin");
    for (let i = 0; i < x.length; i++) {
        x[i].style.textDecoration = "none"
        x[i].style.fontWeight = "normal"
        x[i].style.fontStyle = "normal"
    };
}
/*
window.onload = init();*/