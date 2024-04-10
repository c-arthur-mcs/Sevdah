
/* GLOBAL VARIABLES */
var slavic
var turkic
var other

function init() {
    var buttons = document.getElementsByTagName("button")
    slavic = document.getElementsByClassName("slavic")
    turkic = document.getElementsByClassName("turkic")
    other = document.getElementsByClassName("germanic greek hungarian italian latin")
    /* SLAVIC ORIGIN BUTTONS */
    var SlavItalicButton = buttons[3]
    SlavItalicButton.addEventListener('click', Italic(slavic))
    var SlavBoldButton = buttons[4]
    SlavBoldButton.addEventListener('click', Slav_Bold)
    var SlavUnderButton = buttons[5]
    SlavUnderButton.addEventListener('click', Slav_Under)
    var SlavClearButton = buttons[6]
    SlavClearButton.addEventListener('click', Slav_Clear)
    /* TURKIC ORIGIN BUTTONS */
    var TurkItalicButton = buttons[7]
    TurkItalicButton.addEventListener('click', Italic(turkic))
    var TurkBoldButton = buttons[8]
    TurkBoldButton.addEventListener('click', Turk_Bold)
    var TurkUnderButton = buttons[9]
    TurkUnderButton.addEventListener('click', Turk_Under)
    var TurkClearButton = buttons[10]
    TurkClearButton.addEventListener('click', Turk_Clear)
    /* OTHER ORIGIN BUTTONS */
    var OtherItalicButton = buttons[11]
    OtherItalicButton.addEventListener('click', Italic(other))
    var OtherBoldButton = buttons[12]
    OtherBoldButton.addEventListener('click', Other_Bold)
    var OtherUnderButton = buttons[13]
    OtherUnderButton.addEventListener('click', Other_Under)
    var OtherClearButton = buttons[14]
    OtherClearButton.addEventListener('click', Other_Clear)
    /* ALPHABET BUTTONS */
    var LatinButton = buttons[15]
    LatinButton.addEventListener('click', Latin)
    var CyrillicButton = buttons[16]
    CyrillicButton.addEventListener('click', Cyrillic_Bold)
}

function Italic(input) {
    console.log("buttonPushed")
    for(let i = 0; i < input.length; i++)
        {
        input[i].style.fontStyle = "italic"
        };
}


/* SLAVIC FUNCTIONS */
function Slav_Italic() {
    var x = document.getElementsByClassName ("slavic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.fontStyle = "italic"
    };
}

function Slav_Bold() {
    var x = document.getElementsByClassName ("slavic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.fontWeight = "bold"
    };
}

function Slav_Under() {
    var x = document.getElementsByClassName ("slavic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.textDecoration = "underline"
    };
}

function Slav_Clear() {
    var x = document.getElementsByClassName ("slavic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.textDecoration = "none"
        x[i].style.fontWeight = "normal"
        x[i].style.fontStyle = "normal"
    };
}

/* TURKIC FUNCTIONS */
function Turk_Italic() {
    var x = document.getElementsByClassName ("turkic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.fontStyle = "italic"
    };
}

function Turk_Bold() {
    var x = document.getElementsByClassName ("turkic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.fontWeight = "bold"
    };
}

function Turk_Under() {
    var x = document.getElementsByClassName ("turkic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.textDecoration = "underline"
    };
}

function Turk_Clear() {
    var x = document.getElementsByClassName ("turkic");
    for (let i = 0; i < x.length; i++) {
        x[i].style.textDecoration = "none"
        x[i].style.fontWeight = "normal"
        x[i].style.fontStyle = "normal"
    };
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