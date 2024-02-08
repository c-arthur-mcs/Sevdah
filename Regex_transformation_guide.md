# REGEX EXPRESSIONS

## General markup

### Remove XML heading
`<?xml version="1.0" encoding="UTF-8"?>`

### To mark words:
FIND: `[^\s]+` REPLACE:`<origin lang="">\0</origin>`

### To mark lines: 
FIND: `(^.+?$)\n` REPLACE: `<l>\1</l>\n`

### To mark stanzas:
FIND: `\n\n` REPLACE: `</lg>\n\n<lg>`

### Replace 
`<?xml version="1.0" encoding="UTF-8"?>`
