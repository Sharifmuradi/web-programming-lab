const Y_MIN = -3.0;
const Y_MAX = 3.0;
const X_VALUES = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
const R_VALUES = [1, 2, 3, 4, 5];

const rElement = $('.input-form__select_r');
const yElement = $('.input-form__text_y');
let canvas = $('.graph-canvas');

function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function validateY() {

    let numY = parseFloat(yElement.val());
    if (isNumeric(numY) && numY >= Y_MIN && numY <= Y_MAX) {
        $('.input-form__info').text('Enter point coordinates');
        $('.input-form__info').css("color", "black");

        return true;
    } else {
        $('.input-form__info').text('Enter a Y value between -3 and 3!');
        $('.input-form__info').css("color", "red");
        return false;
    }
}

function validateX() {
    let numX = $('input[name="xval"]:checked').val();
    if (isNumeric(numX) && X_VALUES.includes(parseInt(numX))) {
        $('.input-form__info').text('Enter point coordinates');
        $('.input-form__info').css("color", "black");

        return true;
    } else {
        $('.input-form__info').text('Wrong input X value!');
        $('.input-form__info').css("color", "red");
        return false;
    }
}

function validateR() {
    let rval = parseInt(rElement.val());
    if (R_VALUES.includes(rval)) {
        $('.input-form__info').text('Enter point coordinates');
        $('.input-form__info').css("color", "black");

        return true;
    } else {
        $('.input-form__info').text('Select R value!');
        $('.input-form__info').css("color", "red");
        return false;
    }
}


function validateForm() {
    return validateR() && validateX() && validateY();
}


function drawPoint(x, y) {
    clearCanvas();
    if (x > canvas.width() || x < -canvas.width() || y > canvas.height() || y < -canvas.height()) return;

    let ctxAxes = canvas[0].getContext('2d');
    ctxAxes.setLineDash([2, 2]);
    ctxAxes.beginPath();
    ctxAxes.moveTo(x, 110);
    ctxAxes.lineTo(x, y);
    ctxAxes.moveTo(110, y);
    ctxAxes.lineTo(x, y);
    ctxAxes.stroke();
    ctxAxes.fillStyle = 'red';
    ctxAxes.arc(x, y, 2, 0, 2 * Math.PI);
    ctxAxes.fill();
}

function clearCanvas() {
    canvas[0].getContext('2d').clearRect(0, 0, canvas.width(), canvas.height());
}

function redrawFromInput() {
    const btn = $('.input-form__control-buttons__button');
    if (validateForm()) {
        btn.prop('disabled', false);
        btn.css("cursor", "pointer");
        btn.css("background-color", "#8af98a");
        drawPoint((parseInt($('input[name="xval"]:checked').val()) * 67 / parseInt(rElement.val()) + 110), -(parseFloat(yElement.val()) * 67 / parseInt(rElement.val()) - 110));
    } else {
        btn.prop('disabled', true);
        btn.css("cursor", "not-allowed");
        btn.css("background-color", "#ff4f4f");
        clearCanvas();
    }
}

canvas.on('click', function (event) {
    if (!validateR()) return;
    let rval = rElement.val();
    //console.log("offX: "+event.offsetX)
    let xFromCanvas = (event.offsetX - 110) / 67 * (rval);
    console.log("x : " + xFromCanvas)
    let minDifference = Infinity;
    let nearestXValue;
    for (let i = 0; i < X_VALUES.length; i++) {
        if (Math.abs(xFromCanvas - X_VALUES[i]) < minDifference) {
            minDifference = Math.abs(xFromCanvas - X_VALUES[i]);
            nearestXValue = X_VALUES[i];
        }
    }

    // console.log("offY: "+event.offsetY)
    let yFromCanvas = (-event.offsetY + 110) / 67 * rval;
    console.log("y : " + yFromCanvas)
    if (yFromCanvas < Y_MIN) {
        yFromCanvas = Y_MIN;
    } else if (yFromCanvas > Y_MAX) {
        yFromCanvas = Y_MAX;
    }


    document.getElementById("y-text").value = yFromCanvas.toFixed(8).toString();
    setGraphicValue();
    drawPoint(nearestXValue * 67 / rval + 110, -(yFromCanvas * 67 / rval - 110));


    changeCheckedRadio(nearestXValue.toString());
});

function changeCheckedRadio(x) {
    let radios = Array.from(document.getElementsByName("xval"));
    let checkedRadio = radios.find(function (radio) {
        return radio.checked;
    });
    if (checkedRadio) {
        checkedRadio.checked = false;
    }
    let desiredRadio = radios.find(function (radio) {
        console.log("in radio check shod : " + radio.id.slice(4));
        console.log("meghdare x : " + x);
        return radio.id.slice(4) == x;
    });

    if (desiredRadio) {
        desiredRadio.checked = true;
    }
}


function setGraphicValue() {
    let rValue = rElement.val();
    let svgGraph = document.querySelector(".svg-graph");
    if (!svgGraph) {
        console.error("SVG document is not available.");
    }


    svgGraph.querySelector('.coordinate-text_minus-Rx').textContent = (-rValue).toString();
    svgGraph.querySelector('.coordinate-text_minus-Ry').textContent = (-rValue).toString();
    svgGraph.querySelector('.coordinate-text_minus-half-Rx').textContent = (-rValue / 2).toString();
    svgGraph.querySelector('.coordinate-text_minus-half-Ry').textContent = (-rValue / 2).toString();
    svgGraph.querySelector('.coordinate-text_plus-Rx').textContent = (rValue).toString();
    svgGraph.querySelector('.coordinate-text_plus-Ry').textContent = (rValue).toString();
    svgGraph.querySelector('.coordinate-text_plus-half-Rx').textContent = (rValue / 2).toString();
    svgGraph.querySelector('.coordinate-text_plus-half-Ry').textContent = (rValue / 2).toString();

    redrawFromInput();
}

rElement.on('change', function (event) {
    setGraphicValue();
});

yElement.on('input', function (event) {
    setGraphicValue();
});

const radioButtons = document.querySelectorAll('input[name="xval"]');

radioButtons.forEach((radioButton) => {
    radioButton.addEventListener('change', function () {
        if (this.checked) {
            setGraphicValue();
        }
    });
});

$("tr:not(:first-child)").each(function () {
    var lastTd = $(this).find("td:last-child").text().trim();

    if (lastTd === "true") {
        $(this).css("background-color", "#aeffb5");
    } else {
        $(this).css("background-color", "#ff8686");
    }
});
document.addEventListener("DOMContentLoaded", function () {
// انتخاب اولین ردیف داده پس از هدر
    let firstRow = document.querySelector('.result-table tr:nth-child(2)');

    if (firstRow) {
        let firstRowXValue = firstRow.querySelector('td:nth-child(1)').textContent.trim();
        let firstRowYValue = firstRow.querySelector('td:nth-child(2)').textContent.trim();
        let firstRowRValue = firstRow.querySelector('td:nth-child(3)').textContent.trim();
        changeCheckedRadio(Math.trunc(firstRowXValue).toString());
        yElement.val(firstRowYValue);
        rElement.val(Math.trunc(firstRowRValue).toString());
        setGraphicValue();
    }
});


