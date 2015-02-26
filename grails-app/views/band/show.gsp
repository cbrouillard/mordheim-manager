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
                            <g:message code="default.button.edit.label"/>
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
                <td><strong>${bandInstance.bandValue}</strong></td>
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
        <div class="btn-group pull-right ">
            <g:link controller="hero" action="create" params="[band: bandInstance.id]"
                    class="btn btn-success ${bandInstance.heroes.size() >= 6 ? "disabled" : ""}">
                <span class="glyphicon glyphicon-plus"></span>
                <g:message code="hero"/>
            </g:link>
            <g:link controller="wrenchmen" action="create" params="[band: bandInstance.id]"
                    class="btn btn-success ${bandInstance.heroes.size() + bandInstance.wrenches.size() >= 21 ? "disabled" : ""}">
                <span class="glyphicon glyphicon-plus"></span>
                <g:message code="wrench"/>
            </g:link>
        </div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class=" ${!activeTab ? 'active' : ''}">
                <a href="#heroes" role="tab" data-toggle="tab">
                    <g:message code="heroes"/>
                    <span class="badge">${bandInstance.heroes.size()}</span>
                </a>
            </li>
            <li role="presentation" class="${activeTab == 'wrench' ? 'active' : ''}">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <g:message code="wrenches"/>
                    <span class="badge">${bandInstance.wrenches.size()}</span>
                </a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane ${!activeTab ? 'active' : ''}" id="heroes">
                <g:render template="/hero/heroes"/>

            </div>

            <div role="tabpanel" class="tab-pane ${activeTab == 'wrench' ? 'active' : ''}" id="wrenches">
                <g:render template="/wrenchmen/wrenches"/>
            </div>
        </div>

    </div>

</div>
</body>
</html>
