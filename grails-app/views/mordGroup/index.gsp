<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils; com.headbangers.mordheim.MordGroup" %>
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
    <div data-spy="affix" data-offset-top="200" class="band-infos-affixed">
        <div class="panel panel-default" data-clampedwidth=".band-infos-affixed">
            <div class="panel-heading clearfix">
                <g:if test="${ownedCount < 1}">
                    <g:link class="btn btn-success pull-right" controller="mordGroup" action="create">
                        <span class="glyphicon glyphicon-plus"></span> <g:message code="group.create"/>
                    </g:link>
                </g:if>
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
                            <td class="text-right">

                                <g:if test="${group.owner.equals(currentUser) || SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")}">
                                    <div class="form-inline">
                                        <g:form url="[resource: group, action: 'delete']" method="DELETE"
                                                class="form-inline pull-right">
                                            &nbsp;
                                            <g:hiddenField name="group" value="${group.id}"/>
                                            <div class="btn-group btn-group-xs">
                                                <g:link class="btn btn-success" controller="mordGroup" action="edit"
                                                        id="${group.id}">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </g:link>
                                                <button type="submit" class="btn btn-danger"
                                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </button>
                                            </div>
                                        </g:form>
                                    </div>
                                </g:if>

                                <g:if test="${!group.owner.equals(currentUser)}">
                                    <g:if test="${!group.buddies.contains(currentUser)}">
                                        <g:link action="asktojoin" id="${group.id}" class="btn btn-success btn-xs">
                                            <span class="glyphicon glyphicon-heart"></span> <g:message
                                                code="ask.to.join.group"/>
                                        </g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link action="leave" id="${group.id}" class="btn btn-danger btn-xs">
                                            <span class="glyphicon glyphicon-ban-circle"></span> <g:message
                                                code="leave.group"/>
                                        </g:link>
                                    </g:else>
                                </g:if>

                            </td>
                        </tr>
                    </g:each>
                </table>
            </g:else>

            <div class="panel-footer">
                <g:paginate total="${mordGroupInstanceCount ?: 0}"/>
            </div>
        </div>
    </div>
</div>

<div class="col-sm-8 col-xs-12">
    <g:if test="${!groups}">
        <div class="alert alert-info">
            <g:message code="no.joined.groups"/>
        </div>
    </g:if>
    <g:else>
        <div role="tabpanel">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <g:each in="${groups}" var="group" status="i">
                    <li role="presentation" class="${i == 0 ? 'active' : ''}">
                        <a href="#${group.id}" role="tab" data-toggle="tab">
                            ${group.name}
                        </a>
                    </li>
                </g:each>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <g:each in="${groups}" var="group" status="i">
                    <div role="tabpanel" class="tab-pane ${i == 0 ? 'active' : ''}" id="${group.id}">
                        <g:render template="buddies" model="[group: group]"/>
                    </div>
                </g:each>
            </div>
        </div>
    </g:else>
</div>

</body>
</html>
