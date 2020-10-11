# DOM Objects
sourceText = document.getElementById 'source'
resultText = document.getElementById 'result'
sourceOption = document.getElementById 'source-option'
resultOption = document.getElementById 'result-option'

# Object containing esperanto alphabet
Esperanto =
    alphabet:
        upperCase: ['A','B','C','Ĉ','D','E','F','G','Ĝ','H','Ĥ','I','J','Ĵ','K','L','M','N','O','P','R','S','Ŝ','T','U','Ŭ','V','Z']
        lowerCase: ['a','b','c','ĉ','d','e','f','g','ĝ','h','ĥ','i','j','ĵ','k','l','m','n','o','p','r','s','ŝ','t','u','ŭ','v','z']

# Object containing cyrillic alphabet
Cyrillic =
    alphabet:
        upperCase: ['А','Б','Ц','Ч','Д','Е','Ф','Г','Џ','Һ','Х','И','Ј','Ж','К','Л','М','Н','О','П','Р','С','Ш','Т','У','Ў','В','З']
        lowerCase: ['а','б','ц','ч','д','е','ф','г','џ','һ','х','и','ј','ж','к','л','м','н','о','п','р','с','ш','т','у','ў','в','з']

# Object containing georgian alphabet
Georgian =
    alphabet: ['ა','ბ','გ','დ','ე','ვ','ზ','თ','ი','ლ','მ','ნ','ჲ','ო','ჟ','რ','ს','ჳ','უ','ფ','ქ','შ','ჩ','ც','ხ','ჯ','ჰ','ჶ']

# Function to convert from esperanto alphabet to cyrillic alphabet
fromEsperantoToCyrillic = (esperantoText) ->
    splittedText = esperantoText.split ''
    converted = ''

    for char in splittedText
        indexLower = Esperanto.alphabet.lowerCase.indexOf char
        indexUpper = Esperanto.alphabet.upperCase.indexOf char

        if indexLower > -1
            converted += Cyrillic.alphabet.lowerCase[indexLower]
        else if indexUpper > -1
            converted += Cyrillic.alphabet.upperCase[indexUpper]
        else
            converted += char

    return converted

# Function to convert from cyrillic alphabet to esperanto alphabet
fromCyrillicToEsperanto = (cyrillicText) ->
    splittedText = cyrillicText.split ''
    converted = ''

    for char in splittedText
        indexLower = Cyrillic.alphabet.lowerCase.indexOf char
        indexUpper = Cyrillic.alphabet.upperCase.indexOf char

        if indexLower > -1
            converted += Esperanto.alphabet.lowerCase[indexLower]
        else if indexUpper > -1
            converted += Esperanto.alphabet.upperCase[indexUpper]
        else
            converted += char

    return converted

# Function to convert from esperanto alphabet to georgian alphabet
fromEsperantoToGeorgian = (esperantoText) ->
    splittedText = esperantoText.split ''
    converted = ''

    for char in splittedText
        indexLower = Esperanto.alphabet.lowerCase.indexOf char
        indexUpper = Esperanto.alphabet.upperCase.indexOf char

        if indexLower > -1
            converted += Georgian.alphabet[indexLower]
        else if indexUpper > -1
            converted += Georgian.alphabet[indexUpper]
        else
            converted += char

    return converted

# Function to convert from georgian alphabet to esperanto alphabet
fromGeorgianToEsperanto = (georgianText) ->
    splittedText = georgianText.split ''
    converted = ''

    for char in splittedText
        indexLower = Georgian.alphabet.indexOf char

        if indexLower > -1
            converted += Esperanto.alphabet.lowerCase[indexLower]
        else
            converted += char

    return converted

# Function to convert from X system to esperanto alphabet
fromXSystemToEsperanto = (xSystemText) ->
    # Replace lower cases
    converted = xSystemText.replaceAll('cx', 'ĉ')
    converted = converted.replaceAll('gx', 'ĝ')
    converted = converted.replaceAll('hx', 'ĥ')
    converted = converted.replaceAll('jx', 'ĵ')
    converted = converted.replaceAll('sx', 'ŝ')
    converted = converted.replaceAll('ux', 'ŭ')

    #Replace upper cases
    converted = converted.replaceAll(/Cx|CX/g, 'Ĉ')
    converted = converted.replaceAll(/Gx|GX/g, 'Ĝ')
    converted = converted.replaceAll(/Hx|HX/g, 'Ĥ')
    converted = converted.replaceAll(/Jx|JX/g, 'Ĵ')
    converted = converted.replaceAll(/Sx|SX/g, 'Ŝ')
    converted = converted.replaceAll(/Ux|UX/g, 'Ŭ')

# Function to convert from esperanto alphabet to X system alphabet
fromEsperantoToXSystem = (xSystemText) ->
    # Replace lower cases
    converted = xSystemText.replaceAll('ĉ', 'cx')
    converted = converted.replaceAll('ĝ', 'gx')
    converted = converted.replaceAll('ĥ', 'hx')
    converted = converted.replaceAll('ĵ', 'jx')
    converted = converted.replaceAll('ŝ', 'sx')
    converted = converted.replaceAll('ŭ', 'ux')

    #Replace upper cases
    converted = converted.replaceAll('Ĉ', 'Cx')
    converted = converted.replaceAll('Ĝ', 'Gx')
    converted = converted.replaceAll('Ĥ', 'Hx')
    converted = converted.replaceAll('Ĵ', 'Jx')
    converted = converted.replaceAll('Ŝ', 'Sx')
    converted = converted.replaceAll('Ŭ', 'Ux')

# Function to deside which convertion will be performed
convertText = (source, target, toBeConverted) ->
    if source == 'Esperanto' and target == 'Cyrillic'
        return fromEsperantoToCyrillic toBeConverted
    else if source == 'Esperanto' and target == 'Georgian'
        return fromEsperantoToGeorgian toBeConverted
    else if source == 'Esperanto' and target == 'X'
        return fromEsperantoToXSystem toBeConverted
    else if source == 'Cyrillic' and target == 'Esperanto'
        return fromCyrillicToEsperanto toBeConverted
    else if source == 'Cyrillic' and target == 'Georgian'
        return fromEsperantoToGeorgian(fromCyrillicToEsperanto(toBeConverted))
    else if source == 'Cyrillic' and target == 'X'
        return fromEsperantoToXSystem(fromCyrillicToEsperanto(toBeConverted))
    else if source == 'Georgian' and target == 'Georgian'
        return fromGeorgianToEsperanto toBeConverted
    else if source == 'Georgian' and target == 'Cyrillic'
        return fromEsperantoToCyrillic(fromGeorgianToEsperanto(toBeConverted))
    else if source == 'Georgian' and target == 'X'
        return fromEsperantoToXSystem(fromGeorgianToEsperanto(toBeConverted))
    else if source == 'X' and target == 'Esperanto'
        return fromXSystemToEsperanto toBeConverted
    else if source == 'X' and target == 'Georgian'
        return fromEsperantoToGeorgian(fromXSystemToEsperanto(toBeConverted))
    else if source == 'X' and target == 'Cyrillic'
        return fromEsperantoToCyrillic(fromXSystemToEsperanto(toBeConverted))
    else
        return sourceText.value

# Function that will pass as argument to the listeners
listen = () ->
    if sourceText.value == ''
        resultText.value = 'Jot something down'
    else
        resultText.value = convertText(sourceOption.value, resultOption.value, sourceText.value)

sourceText.addEventListener('keyup', listen)
sourceOption.addEventListener('change', listen)
resultOption.addEventListener('change', listen)