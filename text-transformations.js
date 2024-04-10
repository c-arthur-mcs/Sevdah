function init(){
    var buttons = document.getElementsByTagName("button")
    /* SLAVIC ORIGIN BUTTONS */
    var SlavItalicButton = buttons[3]
    SlavItalicButton.addEventListener('click',Slav_Italic)
    var SlavBoldButton = buttons[4]
    SlavBoldButton.addEventListener('click',Slav_Bold)
    var SlavUnderButton = buttons[5]
    SlavUnderButton.addEventListener('click',Slav_Under)
    /* TURKIC ORIGIN BUTTONS */
    var TurkItalicButton = buttons[6]
    TurkItalicButton.addEventListener('click',Turk_Italic)
    var TurkBoldButton = buttons[7]
    TurkBoldButton.addEventListener('click',Turk_Bold)
    var TurkUnderButton = buttons[8]
    TurkUnderButton.addEventListener('click',Turk_Under)
    /* OTHER ORIGIN BUTTONS */
    var OtherItalicButton = buttons[6]
    OtherItalicButton.addEventListener('click',Other_Italic)
    var OtherBoldButton = buttons[7]
    OtherBoldButton.addEventListener('click',Other_Bold)
    var OtherUnderButton = buttons[8]
    OtherUnderButton.addEventListener('click',Other_Under)
    /* ALPHABET BUTTONS */
    var LatinButton = buttons[6]
    LatinButton.addEventListener('click',Latin)
    var CyrillicButton = buttons[7]
    CyrillicButton.addEventListener('click',Cyrillic_Bold)
}

/* SLAVIC FUNCTIONS */
function Slav_Italic() {
    var x = document.getElementsByClassName ("slavic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.fontStyle = "italic"
        };  
}

function Slav_Bold() {
    var x = document.getElementsByClassName ("slavic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.fontWeight = "bold"
        };  
}

function Slav_Under() {
    var x = document.getElementsByClassName ("slavic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.textDecoration = "underline"
        };  
}

/* TURKIC FUNCTIONS */
function Turk_Italic() {
    var x = document.getElementsByClassName ("turkic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.fontStyle = "italic"
        };  
}

function Turk_Bold() {
    var x = document.getElementsByClassName ("turkic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.fontWeight = "bold"
        };  
}

function Turk_Under() {
    var x = document.getElementsByClassName ("turkic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.textDecoration = "underline"
        };  
}

/* OTHER FUNCTIONS */
function Other_Italic() {
    var x = document.getElementsByClassName ("germanic","greek","hungarian","italian","latin");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.fontStyle = "italic"
        };  
}

function Other_Bold() {
    var x = document.getElementsByClassName ("germanic","greek","hungarian","italian","latin");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.fontWeight = "bold"
        };  
}

function Other_Under() {
    var x = document.getElementsByClassName ("germanic","greek","hungarian","italian","latin");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.textDecoration = "underline"
        };  
}