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
            <hr/>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12">

    <div class="panel panel-default">
        <div class="panel-heading clearfix">

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

            <g:each in="${bandInstanceList}" var="band" status="index">
                <div class="col-lg-3 col-md-5 col-sm-5">
                    <div class="thumbnail panel-primary band-presenter">
                        <g:render template="/band/image" model="[bandInstance: band]"/>
                        <div class="caption text-center">
                            <ul class="list-group">
                                <li class="list-group-item list-group-item-info"><strong>${band.name}</strong>
                                    <g:link action="band" controller="public" id="${band.id}" absolute="true">
                                        <span class="glyphicon glyphicon-link"></span>
                                    </g:link>
                                </li>
                                <li class="list-group-item">${band.type}</li>
                                <li class="list-group-item"><g:message code="band.nbGame" args="[band.nbGame]"/></li>
                                <li class="list-group-item"><g:message code="band.gold" args="[band.gold]"/><br/>
                                    <g:message code="band.magical.stones"
                                               args="[band.magicalStones]"/></li>
                                <li class="list-group-item">
                                    <div class="btn-group">
                                        <g:link controller="band" action="show" id="${band.id}"
                                                class="btn btn-success">
                                            <span class="glyphicon glyphicon-eye-open"></span>
                                            <g:message code="show"/></g:link>

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </g:each>
        </div>

        <div class="panel-footer">
            <g:paginate total="${bandInstanceCount ?: 0}"/>
        </div>

    </div>
</div>

</body>
</html>
