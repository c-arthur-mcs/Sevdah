
function textTransformationsInit() {
  var languageToggles = document.getElementsByClassName("languageToggle")
  for (var i = 0, len = languageToggles.length; i < len; i++) {
    languageToggles[i].addEventListener("click", changeStyle, false);
  }
}

function changeStyle(e) {
  console.log(this);
  var lg = this.dataset.language;
  var style = this.dataset.style;
  if ([ 'slavic', 'turkic'].includes(lg)) {
    var targets = document.getElementsByClassName(lg);
  } else {
    var targets = document.querySelectorAll(".germanic, .greek, .hungarian, .italian, .latin");
  }
  console.log(targets);
  for (var i = 0, len = targets.length; i < len; i++) {
    if (style == 'clear') {[ 'italic', 'bold', 'under'].forEach(function (j) {
        targets[i].classList.remove(j);
      })
    } else {
      targets[i].classList.add(style);
    }
  }
}


function Latin() {
    var x = document.getElementsByClassName("cyrillic");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.display = "none"
        };  
    var y = document.getElementsByClassName("latin");
    for(let i = 0; i < y.length; i++)
        {
        y[i].style.display = "block"
        };  
}

function Cyrillic() {
    var x = document.getElementsByClassName("latin");
    for(let i = 0; i < x.length; i++)
        {
        x[i].style.display = "none"
        };  
    var y = document.getElementsByClassName("cyrillic");
    for(let i = 0; i < y.length; i++)
        {
        y[i].style.display = "block"
        };  
}

document.addEventListener('DOMContentLoaded', textTransformationsInit);