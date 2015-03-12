<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div>

            <h1>
                <g:message
                        code="buddies"/> <small><g:message code="buddies.hint"/></small>
            </h1>
            <hr/>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12">

    <div class="panel panel-default">
        <div class="panel-heading">

        </div>

    </div>
</div>
</body>
</html>