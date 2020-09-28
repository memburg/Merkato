"use strict";
const sourceText = document.getElementById("source");
const resultText = document.getElementById("result");
const sourceOption = document.getElementById("source-option");
const resultOption = document.getElementById("result-option");
const Esperanto = {
    alphabet: {
        upperCase: [
            "A",
            "B",
            "C",
            "Ĉ",
            "D",
            "E",
            "F",
            "G",
            "Ĝ",
            "H",
            "Ĥ",
            "I",
            "J",
            "Ĵ",
            "K",
            "L",
            "M",
            "N",
            "O",
            "P",
            "R",
            "S",
            "Ŝ",
            "T",
            "U",
            "Ŭ",
            "V",
            "Z",
        ],
        lowerCase: [
            "a",
            "b",
            "c",
            "ĉ",
            "d",
            "e",
            "f",
            "g",
            "ĝ",
            "h",
            "ĥ",
            "i",
            "j",
            "ĵ",
            "k",
            "l",
            "m",
            "n",
            "o",
            "p",
            "r",
            "s",
            "ŝ",
            "t",
            "u",
            "ŭ",
            "v",
            "z",
        ],
    },
};
const Cyrillic = {
    alphabet: {
        upperCase: [
            "А",
            "Б",
            "Ц",
            "Ч",
            "Д",
            "Е",
            "Ф",
            "Г",
            "Џ",
            "Һ",
            "Х",
            "И",
            "Ј",
            "Ж",
            "К",
            "Л",
            "М",
            "Н",
            "О",
            "П",
            "Р",
            "С",
            "Ш",
            "Т",
            "У",
            "Ў",
            "В",
            "З",
        ],
        lowerCase: [
            "а",
            "б",
            "ц",
            "ч",
            "д",
            "е",
            "ф",
            "г",
            "џ",
            "һ",
            "х",
            "и",
            "ј",
            "ж",
            "к",
            "л",
            "м",
            "н",
            "о",
            "п",
            "р",
            "с",
            "ш",
            "т",
            "у",
            "ў",
            "в",
            "з",
        ],
    },
};
const Georgian = {
    alphabet: [
        "ა",
        "ბ",
        "გ",
        "დ",
        "ე",
        "ვ",
        "ზ",
        "თ",
        "ი",
        "ლ",
        "მ",
        "ნ",
        "ჲ",
        "ო",
        "ჟ",
        "რ",
        "ს",
        "ჳ",
        "უ",
        "ფ",
        "ქ",
        "შ",
        "ჩ",
        "ც",
        "ხ",
        "ჯ",
        "ჰ",
        "ჶ",
    ],
};
function fromEsperantoToCyrillic(esperantoText) {
    const splittedText = esperantoText.split("");
    let converted = "";
    for (const i in splittedText) {
        const indexLower = Esperanto.alphabet.lowerCase.indexOf(splittedText[i]);
        const indexUpper = Esperanto.alphabet.upperCase.indexOf(splittedText[i]);
        if (indexLower > -1) {
            converted += Cyrillic.alphabet.lowerCase[indexLower];
        }
        else if (indexUpper > -1) {
            converted += Cyrillic.alphabet.upperCase[indexUpper];
        }
        else {
            converted += splittedText[i];
        }
    }
    return converted;
}
function fromCyrillicToEsperanto(cyrillicText) {
    const splittedText = cyrillicText.split("");
    let converted = "";
    for (const i in splittedText) {
        const indexLower = Cyrillic.alphabet.lowerCase.indexOf(splittedText[i]);
        const indexUpper = Cyrillic.alphabet.upperCase.indexOf(splittedText[i]);
        if (indexLower > -1) {
            converted += Esperanto.alphabet.lowerCase[indexLower];
        }
        else if (indexUpper > -1) {
            converted += Esperanto.alphabet.upperCase[indexUpper];
        }
        else {
            converted += splittedText[i];
        }
    }
    return converted;
}
function fromEsperantoToGeorgian(georgianText) {
    const splittedText = georgianText.split("");
    let converted = "";
    for (const i in splittedText) {
        const indexLower = Esperanto.alphabet.lowerCase.indexOf(splittedText[i]);
        const indexUpper = Esperanto.alphabet.upperCase.indexOf(splittedText[i]);
        if (indexLower > -1) {
            converted += Georgian.alphabet[indexLower];
        }
        else if (indexUpper > -1) {
            converted += Georgian.alphabet[indexUpper];
        }
        else {
            converted += splittedText[i];
        }
    }
    return converted;
}
function fromGeorgianToEsperanto(cyrillicText) {
    const splittedText = cyrillicText.split("");
    let converted = "";
    for (const i in splittedText) {
        const indexLower = Georgian.alphabet.indexOf(splittedText[i]);
        if (indexLower > -1) {
            converted += Esperanto.alphabet.lowerCase[indexLower];
        }
        else {
            converted += splittedText[i];
        }
    }
    return converted;
}
function convertText(source, target, toBeConverted) {
    if (source === "Esperanto" && target === "Cyrillic") {
        return fromEsperantoToCyrillic(toBeConverted);
    }
    else if (source === "Esperanto" && target === "Georgian") {
        return fromEsperantoToGeorgian(toBeConverted);
    }
    else if (source === "Cyrillic" && target === "Esperanto") {
        return fromCyrillicToEsperanto(toBeConverted);
    }
    else if (source === "Cyrillic" && target === "Georgian") {
        return fromEsperantoToGeorgian(fromCyrillicToEsperanto(toBeConverted));
    }
    else if (source === "Georgian" && target === "Esperanto") {
        return fromGeorgianToEsperanto(toBeConverted);
    }
    else if (source === "Georgian" && target === "Cyrillic") {
        return fromEsperantoToCyrillic(fromGeorgianToEsperanto(toBeConverted));
    }
    else {
        return sourceText.value;
    }
}
sourceText.addEventListener("keyup", () => {
    if (sourceText.value == "") {
        resultText.value = "Jot something down";
    }
    else {
        resultText.value = convertText(sourceOption.value, resultOption.value, sourceText.value);
    }
});
