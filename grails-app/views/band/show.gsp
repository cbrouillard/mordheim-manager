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
                    code="band.show"/> <small>${bandInstance.name}</small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-4 col-xs-12">

    <div class="panel panel-info">
        <div class="panel-heading">

            <div class="form-inline pull-right">
                <g:form url="[resource: bandInstance, action: 'delete']" method="DELETE"
                        class="form-inline pull-right">
                    <div class="btn-group">
                        <g:link class="btn btn-success" controller="band" action="edit" id="${bandInstance.id}">
                            <span class="glyphicon glyphicon-edit"></span>
                        </g:link>
                        <button type="submit" class="btn btn-danger"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <span class="glyphicon glyphicon-trash"></span> ${message(code: 'default.button.delete.label', default: 'Delete')}
                        </button>
                    </div>
                </g:form>
            </div>
            <h5><g:message code="band.infos"/></h5>

        </div>

        <table class="table">
            <tr class="warning">
                <td><strong><g:message code="band.value"/></strong></td>
                <td></td>
            </tr>
            <tr>
                <td><strong><g:message code="band.name.label"/></strong></td>
                <td>${bandInstance.name}</td>
            </tr>
            <tr>
                <td><strong><g:message code="band.type.label"/></strong></td>
                <td>${bandInstance.type}</td>
            </tr>
            %{--<tr>
                <td><strong><g:message code="date.created.label"/></strong></td>
                <td><g:formatDate formatName="date.format.short" date="${bandInstance.dateCreated}"/></td>
            </tr>--}%
            <tr>
                <td><strong><g:message code="band.gold.title"/></strong></td>
                <td><g:formatNumber number="${bandInstance.gold}"/> CO</td>
            </tr>
            <tr>
                <td><strong><g:message code="band.magical.stones.title"/></strong></td>
                <td><g:formatNumber number="${bandInstance.magicalStones}"/></td>
            </tr>
            <tr>
                <td><strong><g:message code="note.label"/></strong></td>
                <td>${bandInstance.note}</td>
            </tr>
        </table>
    </div>

</div>

<div class="col-sm-8 col-xs-12">

    <div role="tabpanel">

        <!-- Nav tabs -->
        <g:if test="${bandInstance.heroes.size() < 6}">
            <div class="btn-group pull-right">
                <g:link controller="hero" action="create" params="[band: bandInstance.id]" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span>
                    <g:message code="hero.create"/>
                </g:link>
            </div>
        </g:if>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#heroes" role="tab" data-toggle="tab">
                    <g:message code="heroes" />
                    <span class="badge">${bandInstance.heroes.size()}</span>
                </a>
            </li>
            <li role="presentation">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <g:message code="wrenches"/>
                    <span class="badge">${bandInstance.wrenches.size()}</span>
                </a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="heroes">
                <g:render template="heroes"/>

            </div>

            <div role="tabpanel" class="tab-pane" id="wrenches">
                <br/>test
            </div>
        </div>

    </div>

</div>
</body>
</html>
