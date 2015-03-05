<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
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
                        code="band.list"/> <small><g:message code="band.list.hint"/></small>
            </h1>
            <g:if test="${asAdmin}">
                <span class="label label-danger"><g:message code="as.admin"/></span>
                <span class="label label-danger"><g:message code="as.admin.person.consulted"
                                                            args="[person.username]"/></span>
            </g:if>
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

            <div class="btn-group pull-right" role="group">
                <g:link class="btn btn-default" controller="band" action="index"
                        params="[order: params.order == 'asc' ? 'desc' : 'asc', sort: 'name']">
                    <span class="glyphicon glyphicon-sort-by-alphabet"></span> Tri
                </g:link>
                <g:link controller="band" action="create" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span>
                    <g:message code="band.create"/></g:link>

            </div>
            <h5>
                <span class="label label-default">Total : ${bandInstanceCount}</span></h5>
        </div>

        <div class="panel-body">

            <g:set var="counter" value="${0}"/>
            <g:each in="${bandInstanceList}" var="band" status="index">
                <g:if test="${counter == 0}">
                    <div class="row-fluid">
                </g:if>
                <div class="col-lg-2 col-md-4 col-sm-5">
                    <div class="thumbnail panel-${asAdmin ? 'danger' : 'primary'}">

                        <asset:image src="Mordheim.gif" width="100px"/>
                        <div class="caption text-center">
                            <ul class="list-group">
                                <li class="list-group-item list-group-item-info"><strong>${band.name}</strong></li>
                                <li class="list-group-item">${band.type}</li>
                                <li class="list-group-item"><g:message code="band.gold" args="[band.gold]"/></li>
                                <li class="list-group-item"><g:message code="band.magical.stones"
                                                                       args="[band.magicalStones]"/></li>
                                <li class="list-group-item">
                                    <div class="btn-group">

                                        <g:link controller="band" action="show" id="${band.id}" class="btn btn-success"
                                                params="${asAdmin ? [asAdmin: true] : []}">
                                            <span class="glyphicon glyphicon-pencil"></span>
                                            <g:message code="show"/></g:link>

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <g:if test="${counter == 0}">
                    </div>
                </g:if>
                <g:set var="counter" value="${counter + 1}"/>
                <g:if test="${counter >= 6}">
                    <g:set var="counter" value="${0}"/>
                </g:if>
            </g:each>
        </div>

        <div class="panel-footer">
            <g:paginate total="${bandInstanceCount ?: 0}"/>
        </div>

    </div>
</div>

</body>
</html>
