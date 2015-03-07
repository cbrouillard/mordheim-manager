<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="thumbnail pull-right">
            <asset:image src="Mordheim.gif" class="imgband"/>
        </div>
        <div>

            <h1><g:message
                    code="band.show"/> <small>${bandInstance.name}</small>

                <div class="btn-group">
                    <g:link controller="band" action="pdf" id="${bandInstance.id}" class="btn btn-primary">
                        <span class="glyphicon glyphicon-list-alt"></span> <g:message code="generate.pdf"/>
                    </g:link>
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <g:link controller="band" action="previewpdf" id="${bandInstance.id}">
                                <span class="glyphicon glyphicon-info-sign"></span> <g:message
                                    code="generate.preview.pdf"/>
                            </g:link>
                        </li>
                    </ul>
                </div>
            </h1>
            <g:if test="${asAdmin}">
                <span class="label label-danger"><g:message code="as.admin"/></span>
            </g:if>



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
            <tr>
                <td><strong><g:message code="band.nbwarrior"/></strong></td>
                <td>${bandInstance.nbWarriors}</td>
            </tr>
            <tr>
                <td><strong><g:message code="band.gold.title"/></strong></td>
                <td><g:message code="band.gold" args="[bandInstance.gold]"/></td>
            </tr>
            <tr>
                <td><strong><g:message code="band.magical.stones.title"/></strong></td>
                <td><g:formatNumber number="${bandInstance.magicalStones}"/></td>
            </tr>
            <tr>
                <td><strong><g:message code="band.equipment"/></strong></td>
                <td><div class="well">${raw(bandInstance.reserve)}</div></td>
            </tr>
            <tr>
                <td><strong><g:message code="note.label"/></strong></td>
                <td><div class="well">${raw(bandInstance.note)}</div></td>
            </tr>
        </table>
    </div>

</div>

<div class="col-sm-8 col-xs-12">

    <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class=" ${!activeTab ? 'active' : ''}">
                <a href="#heroes" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.heroes.size()}</span>
                    <g:message code="heroes"/>

                    <button class="btn btn-success btn-xs ${bandInstance.heroes.size() >= 6 ? "disabled" : ""}"
                            onclick="document.location = '${createLink(controller: 'hero', action:'create', params: [band:bandInstance.id])}'">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </a>

            </li>
            <li role="presentation" class="${activeTab == 'wrench' ? 'active' : ''}">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.nbWrenches}</span>
                    <g:message code="wrenches"/>
                    <button class="btn btn-success btn-xs ${bandInstance.nbWarriors >= 21 ? "disabled" : ""}"
                            onclick="document.location = '${createLink(controller: 'wrenchmen', action:'create', params: [band:bandInstance.id])}'">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
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
