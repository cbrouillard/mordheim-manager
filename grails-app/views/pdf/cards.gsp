<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <style type="text/css">

    <!--
    body {
        font-family: Arial;
        font-size: 20px
    }

    .pos {
        position: absolute;
        z-index: 0;
        left: 0px;
        top: 0px
    }

    .table {
        width: 100%;
        border-spacing: 0;
        border-collapse: collapse;
        border: 1px solid gray;
    }

    .table thead tr{
        border-bottom: 2px solid gray;
        background: gray;
        color: white;
        font-weight: bold;
    }

    .table tbody tr{
        background: #eee;
    }

    .text-center {
        text-align: center;
        width: 10%;
    }

    .label-danger {
        color: red;
    }

    .label-success {
        color: green;
    }

    .label-warning {
        color: orange;
    }

    .well{
        border-radius: 5px;
        background: gray;
        border: 2px solid gray;
        color: white;
    }

    -->
    </style>
</head>

<body>

<div class="pos" id="0:0" style="top:0">
    <img src="${resource(dir: 'images', file: 'cards.png', absolute: true)}"
         border="0"/>
</div>

<g:set var="topRef" value="${new Integer(72)}"/>
<g:each in="${band.heroes?.sort({ it.dateCreated })}" var="hero" status="nb">

    <g:if test="${nb == 1 || nb == 3 || nb == 5}">
        <g:set var="leftRef" value="${new Integer(705)}"/>
    </g:if>
    <g:else>
        <g:set var="leftRef" value="${new Integer(230)}"/>
    </g:else>

    <g:if test="${nb % 2 == 0}">
        <g:set var="topRef" value="${new Integer(72) + 266 * nb}"/>
    </g:if>

    <div class="pos" style="top:${topRef}px;left:${leftRef}px;width:310px;font-weight: bold;">
        <span style=" font-family:Arial; font-size:12px; color:white">
            ${hero.name}
        </span>
    </div>

    <g:if test="${hero.photo}">

    </g:if>
    <g:else>
        <div class="pos" style="top:${topRef + 50}px;left:${leftRef}px;width:310px;">
            <div class="well">
                <span style=" font-family:Arial; font-size:12px;">
                    ${raw(hero.equipment)}
                </span>
            </div>
        </div>

    </g:else>

    <div class="pos" style="top:${topRef + 400}px;left:${leftRef}px;width:310px;text-align: center;">
        <g:render template="/profilable/showprofile" model="[warrior: hero]"/>
    </div>

    <div class="pos" style="top:${topRef + 470}px;left:${leftRef}px;width:310px;font-weight: bold;text-align: center;">
        <span style="font-family:Arial; font-size:12px; color:white">
            ${hero.type}
        </span>
    </div>

</g:each>

</body>
</html>