<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="entries" class="muradi.lab2.beans.EntriesBean" scope="session"/>
<!DOCTYPE html>

<html lang="ru">

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab 2</title>
</head>

<body>

<header class="main-header topper clearfix">
    <span class="main-header__info">
        Laboratory work 2<br>
        Version 765
    </span>
    <img class="main-header__itmo-logo" src="img/itmo-gif-logo.gif" alt="itmo logo">
    <span class="main-header__authors">
        MURADI SHARIF<br>
        P3213
    </span>
</header>

<main class="main-container">
    <div class="main-container__item main-container__item_left-column">
        <section class="main-container__item_left-column__item content-section content-section_graph">
            <h2 class="content-section__header content-section__header_graph topper">
              <span class="content-section__header__text">
                Graphic
              </span>
            </h2>
            <div class="content-container result-graph_container">
                <object class="result-graph" type="image/svg+xml" data="img/result-graph.svg">
                    <img src="img/result-graph.png" width="220" height="220" alt="Graphic">
                </object>
                <canvas class="graph-canvas" width="220" height="220">Interactive graph area</canvas>
            </div>
        </section>

        <section class="main-container__item_left-column__item content-section content-section_values">
            <h2 class="content-section__header content-section__header_values topper">
              <span class="content-section__header__text">
                Data
              </span>
            </h2>
            <form class="input-form" action="${pageContext.request.contextPath}/check" method="POST">
                <p class="input-form__info">Enter point coordinates</p>


                <div class="input-form__container input-form__container_select">
                    <label class="input-form__label input-form__label_x" id="x-radio">X</label>
                    <div class="input-form__container_radios">

                        <label for="xval-3" class="x-radio">
                            <input type="radio" name="xval" value="-3" id="xval-3"> -3
                        </label>
                        <label for="xval-2" class="x-radio">
                            <input type="radio" name="xval" value="-2" id="xval-2"> -2
                        </label>
                        <label for="xval-1" class="x-radio">
                            <input type="radio" name="xval" value="-1" id="xval-1"> -1
                        </label>
                        <label for="xval0" class="x-radio">
                            <input type="radio" name="xval" value="0" id="xval0" checked> 0
                        </label>
                        <label for="xval1" class="x-radio">
                            <input type="radio" name="xval" value="1" id="xval1"> 1
                        </label>
                        <label for="xval2" class="x-radio">
                            <input type="radio" name="xval" value="2" id="xval2"> 2
                        </label>
                        <label for="xval3" class="x-radio">
                            <input type="radio" name="xval" value="3" id="xval3"> 3
                        </label>
                        <label for="xval4" class="x-radio">
                            <input type="radio" name="xval" value="4" id="xval4"> 4
                        </label>
                        <label for="xval5" class="x-radio">
                            <input type="radio" name="xval" value="5" id="xval5"> 5
                        </label>
                    </div>
                </div>

                <div class="input-form__container input-form__container_text">
                    <label class="input-form__label input-form__label_y" for="y-text">Y</label>
                    <input class="input-form__control input-form__text input-form__text_y" id="y-text" type="text"
                           name="yval"
                           maxlength="10" autocomplete="off" placeholder="  Number from -3 to 3 ...">
                </div>

                <div class="input-form__container input-form__container_select">
                    <label class="input-form__label input-form__label_r" for="r-select">R</label>
                    <select class="input-form__control input-form__select input-form__select_r" id="r-select"
                            name="rval">
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>


                <div class="input-form__control-buttons__container">
                    <button class="input-form__control-buttons__button input-form__control-buttons__button_submit"
                            type="submit" disabled>Check
                    </button>
                </div>

            </form>
        </section>
    </div>

    <section class="main-container__item main-container__item_table content-section content-section_table">
        <h2 class="content-section__header content-section__header_table topper">
            <span class="content-section__header__text">
              Table
            </span>
        </h2>
        <div class="results-table_container">
            <table class="result-table">
                <tr class="result-table__header">
                    <th class="result-table__coords-column">X</th>
                    <th class="result-table__coords-column">Y</th>
                    <th class="result-table__coords-column">R</th>
                    <th class="result-table__hitres-column">RESULT</th>
                </tr>
                <c:forEach var="entry" items="${entries.entries}">
                    <tr>
                        <td>${entry.xValue}</td>
                        <td>${entry.yValue}</td>
                        <td>${entry.rValue}</td>
                        <td>${entry.hitResult}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </section>

</main>

   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script src="js/main.js"></script>
</body>

</html>
