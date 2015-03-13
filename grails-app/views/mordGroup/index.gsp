<%@ page import="com.headbangers.mordheim.MordGroup" %>
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
                        code="buddies"/> <small><g:message code="buddies.hint"/></small>
            </h1>
            <hr/>
        </div>
        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-4 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <g:link class="btn btn-success pull-right" controller="mordGroup" action="create">
                <span class="glyphicon glyphicon-plus"></span> <g:message code="group.create"/>
            </g:link>
            <h5><g:message code="group.list"/></h5>
        </div>

        <g:if test="${!mordGroupInstanceList}">
            <div class="panel-body">
                <div class="alert alert-info">
                    <g:message code="no.groups"/>
                </div>
            </div>
        </g:if>
        <g:else>
            <table class="table">
                <g:each in="${mordGroupInstanceList}" var="group">
                    <tr>
                        <td>${group.name}</td>
                    </tr>
                </g:each>
            </table>
        </g:else>

        <div class="panel-footer">
            <g:paginate total="${mordGroupInstanceCount ?: 0}"/>
        </div>
    </div>
</div>

<div class="col-sm-8 col-xs-12">
    <g:if test="${!groups}">
        <div class="panel-body">
            <div class="alert alert-info">
                <g:message code="no.joined.groups"/>
            </div>
        </div>
    </g:if>
    <g:else>
        <div role="tabpanel">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <g:each in="${groups}" var="group">
                    <li role="presentation" class="active">
                        <a href="#${group.id}" role="tab" data-toggle="tab">
                            ${group.name}
                        </a>
                    </li>
                </g:each>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <g:each in="${groups}" var="group">
                    <div role="tabpanel" class="tab-pane" id="${group.id}">
                        ${group.buddies}
                    </div>
                </g:each>
            </div>
        </div>
    </g:else>
</div>

</body>
</html>
