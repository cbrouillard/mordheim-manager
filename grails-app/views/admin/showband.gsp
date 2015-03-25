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

            <h1>
                <g:message
                        code="band.show"/> <small>${bandInstance.name}</small>

            </h1>

            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="clearfix">&nbsp;</div>

            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-4 col-xs-12">

    <div class="panel panel-info">
        <div class="panel-heading clearfix">

            <div class="form-inline pull-right">
                <g:form url="[action: 'deleteband', controller: 'admin']" method="DELETE"
                        class="form-inline pull-right">
                    <g:hiddenField name="band" value="${bandInstance.id}"/>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-danger"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <span class="glyphicon glyphicon-remove"></span> ${message(code: 'default.button.delete.label', default: 'Delete')}
                        </button>
                    </div>
                </g:form>
            </div>
            <h5><g:message code="band.infos"/></h5>

        </div>

        <table class="table">
            <tr class="danger">
                <td><strong><g:message code="band.owner"/></strong></td>
                <td>
                    <g:link controller="person" action="edit" id="${bandInstance.owner.id}">
                        <span class="glyphicon glyphicon-pencil"></span>
                        ${bandInstance.owner.username}
                    </g:link>
                </td>
            </tr>
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

                </a>

            </li>
            <li role="presentation" class="${activeTab == 'wrench' ? 'active' : ''}">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.nbWrenches}</span>
                    <g:message code="wrenches"/>

                </a>
            </li>
            <li role="presentation" class="${activeTab == 'maverick' ? 'active' : ''}">
                <a href="#mavericks" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.nbMavericks}</span>
                    <g:message code="mavericks"/>
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

            <div role="tabpanel" class="tab-pane ${activeTab == 'maverick' ? 'active' : ''}" id="mavericks">
                <g:render template="/maverick/mavericks"/>
            </div>
        </div>

    </div>

    <g:if test="${bandInstance.nbWarriors == 0}">&nbsp;
        <div class="alert alert-info">
            <g:message encodeAs="raw" code="help.nowarriors.admin"/>
        </div>
    </g:if>

</div>
</body>
</html>
