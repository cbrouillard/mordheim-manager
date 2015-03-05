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
            <h1><g:message
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
                <g:if test="${asAdmin}">
                    <span class="label label-danger"><g:message code="as.admin"/></span>
                    <span class="label label-danger"><g:message code="as.admin.person.consulted" args="[person.username]"/></span>
                </g:if>
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
                                <li class="list-group-item"><g:message code="band.magical.stones" args="[band.magicalStones]"/></li>
                                <li class="list-group-item">
                                    <div class="btn-group">

                                        <g:link controller="band" action="show" id="${band.id}" class="btn btn-success">
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

%{--


<a href="#list-band" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-band" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="note" title="${message(code: 'band.note.label', default: 'Note')}"/>

            <g:sortableColumn property="gold" title="${message(code: 'band.gold.label', default: 'Gold')}"/>

            <g:sortableColumn property="magicalStones"
                              title="${message(code: 'band.magicalStones.label', default: 'Magical Stones')}"/>

            <g:sortableColumn property="name" title="${message(code: 'band.name.label', default: 'Name')}"/>

            <g:sortableColumn property="reserve"
                              title="${message(code: 'band.reserve.label', default: 'Reserve')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'band.dateCreated.label', default: 'Date Created')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${bandInstanceList}" status="i" var="bandInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${bandInstance.id}">${fieldValue(bean: bandInstance, field: "note")}</g:link></td>

                <td>${fieldValue(bean: bandInstance, field: "gold")}</td>

                <td>${fieldValue(bean: bandInstance, field: "magicalStones")}</td>

                <td>${fieldValue(bean: bandInstance, field: "name")}</td>

                <td>${fieldValue(bean: bandInstance, field: "reserve")}</td>

                <td><g:formatDate date="${bandInstance.dateCreated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${bandInstanceCount ?: 0}"/>
    </div>
</div>--}%
</body>
</html>
