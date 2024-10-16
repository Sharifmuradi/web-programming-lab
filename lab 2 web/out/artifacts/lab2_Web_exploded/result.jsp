<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <section class="main-container__item_left-column__item1 content-section-link">
            <form action="${pageContext.request.contextPath}" method="post">
                <div class="link-to-main">
                    <button class="back-to-main-page__button"
                            type="submit">&larr; Back to main page
                    </button>
                </div>
            </form>
        </section>
    </div>
    <section style="border-bottom-right-radius: 20px;"
             class="main-container__item main-container__item_table content-section content-section_table">
        <h2 class="content-section__header content-section__header_table topper">
            <span class="content-section__header__text">
              Table
            </span>
        </h2>
        <div class="result-table_container">
            <table class="result-table">
                <tr class="result-table__header">
                    <th class="result-table__coords-column">X</th>
                    <th class="result-table__coords-column">Y</th>
                    <th class="result-table__coords-column">R</th>
                    <th class="result-table__hitres-column">RESULT</th>
                </tr>
                <tr class="result">
                    <td style="border-bottom-left-radius: 19px">${newEntry.xValue}</td>
                    <td>${newEntry.yValue}</td>
                    <td>${newEntry.rValue}</td>
                    <td style="border-bottom-right-radius: 19px">${newEntry.hitResult}</td>
                </tr>

            </table>
        </div>
    </section>
</main>
<script>
    var resultElement = document.querySelector('.result');

    var lastTd = resultElement.querySelector('td:last-child').textContent.trim();

    if (lastTd === "true") {
        resultElement.style.backgroundColor = "#aeffb5";
    } else if (lastTd === "false") {
        resultElement.style.backgroundColor = "#ff8686";
    }
</script>
</body>
</html>