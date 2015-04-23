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

    td {
        vertical-align: top;
    }

    .table {
        width: 100%;
        border-spacing: 0;
        border-collapse: collapse;
        border: 1px solid gray;
        border-radius: 5px;
    }

    .table-light {
        width: 100%;
        height: 100%;
        border-spacing: 0;
        border-collapse: collapse;
    }

    .table-light td {
        width: 50%;
    }

    .table thead tr {
        border-bottom: 2px solid gray;
        background: gray;
        color: white;
        font-weight: bold;
    }

    .table tbody tr {
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

    .well {
        border-radius: 5px;
        background: transparent;
        border: 2px solid gray;
        text-align: justify;
    }

    .well .header {
        font-size: 14px;
        padding: 5px 0 5px 5px;
        background: gray;
        color: white;
    }

    .well .body {
    }

    .well.data {
        height: 135px;
        overflow: hidden;
    }

    ul {
        padding: 5 0 0 20;
        margin: 0;
        list-style-type: circle;
    }

    .photo {
        border-radius: 5px;
        background: white;
        border: 2px solid gray;
        height: 135px;
    }

    img.imgwarrior {
        height: 100%;
        width: 100%;
    }

    .type {
        text-align: center;
        border-radius: 5px;
        font-weight: bold;
        padding: 5px;
        border: 2px solid gray;
    }

    -->
    </style>
</head>

<body>
<g:render template="/pdf/banddata"/>
<g:render template="/pdf/cardsdata" model="[startingTop: 3508 + (band.mavericks ? 1754 : 0)]"/>
</body>
</html>