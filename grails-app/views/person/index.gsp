<%@ page import="com.headbangers.mordheim.security.Person" %>
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
                    code="person.list"/> <small><g:message code="person.list.hint"/></small>
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
            <h5><g:message code="last.created.bands"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <tbody>
                <g:each in="${bands}" var="band">
                    <tr>
                        <td class="col-md-3"><g:formatDate date="${band.dateCreated}"/></td>
                        <td class="col-md-5"><strong>${band.name}</strong> <span
                                class="label label-default">${band.type}</span></td>
                        <td class="text-right col-md-4">
                            <div class="btn-group">
                                <g:link controller="person" action="edit" id="${band.owner.id}"
                                        class="btn btn-warning btn-xs">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                    ${band.owner.username}
                                </g:link>
                                <g:link controller="admin" action="showband" id="${band.id}"
                                        class="btn btn-success btn-xs">
                                    <span class="glyphicon glyphicon-eye-open"></span>
                                </g:link>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>


<div class="col-sm-8 col-xs-12">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h5><span class="label label-default">Total : ${personInstanceCount}</span></h5>
        </div>

        <div class="table-responsive">
            <table class="table table-hover">
                <tr>

                    <g:sortableColumn property="username"
                                      title="${message(code: 'person.username.label', default: 'Username')}"/>



                    <g:sortableColumn property="email"
                                      title="${message(code: 'person.email.label', default: 'Email')}"/>

                    <g:sortableColumn property="enabled"
                                      title="${message(code: 'person.enabled.label', default: 'Enabled')}"/>

                    <g:sortableColumn property="accountExpired"
                                      title="${message(code: 'person.accountExpired.label', default: 'Account Expired')}"/>

                    <g:sortableColumn property="accountLocked"
                                      title="${message(code: 'person.accountLocked.label', default: 'Account Locked')}"/>

                    <g:sortableColumn property="passwordExpired"
                                      title="${message(code: 'person.passwordExpired.label', default: 'passwordExpired')}"/>

                    <g:sortableColumn property="dateCreated"
                                      title="${message(code: 'person.dateCreated.label', default: 'Date Created')}"/>

                    <td>Scribe</td>
                    <td>Actions</td>

                </tr>

                <g:each in="${personInstanceList}" var="person">
                    <tr>
                        <td><g:link controller="person" action="edit" id="${person.id}">
                            <span class="glyphicon glyphicon-pencil"></span> ${person.username}</g:link></td>

                        <td>${person.email}</td>
                        <td>
                            <g:link controller="person" action="toggle" id="${person.id}" params="[t: 'enabled']"
                                    class="btn btn-xs btn-${person.enabled ? 'success' : 'danger'}">
                                <span class="glyphicon glyphicon-option-vertical"></span> <g:formatBoolean
                                    boolean="${person.enabled}"/>
                            </g:link>
                        </td>
                        <td>
                            <g:link controller="person" action="toggle" id="${person.id}" params="[t: 'accountExpired']"
                                    class="btn btn-xs btn-${person.accountExpired ? 'danger' : 'success'}">
                                <span class="glyphicon glyphicon-option-vertical"></span> <g:formatBoolean
                                    boolean="${person.accountExpired}"/>
                            </g:link>
                        </td>
                        <td>
                            <g:link controller="person" action="toggle" id="${person.id}" params="[t: 'accountLocked']"
                                    class="btn btn-xs btn-${person.accountLocked ? 'danger' : 'success'}">
                                <span class="glyphicon glyphicon-option-vertical"></span> <g:formatBoolean
                                    boolean="${person.accountLocked}"/>
                            </g:link>
                        </td>
                        <td>
                            <g:link controller="person" action="toggle" id="${person.id}"
                                    params="[t: 'passwordExpired']"
                                    class="btn btn-xs btn-${person.passwordExpired ? 'danger' : 'success'}">
                                <span class="glyphicon glyphicon-option-vertical"></span> <g:formatBoolean
                                    boolean="${person.passwordExpired}"/>
                            </g:link>
                        </td>
                        <td><g:formatDate date="${person.dateCreated}" formatName="date.format.short"/></td>
                        <td>
                            <g:if test="${com.headbangers.mordheim.security.PersonRole.exists(person.id, roleScribe.id)}">
                                <g:link controller="person" action="setscribe" id="${person.id}" params="[value:false]" class="btn btn-success btn-xs">
                                    <span class="glyphicon glyphicon-tag"></span> Est scribe
                                </g:link>
                            </g:if>
                            <g:else>
                                <g:link controller="person" action="setscribe" id="${person.id}" params="[value:true]" class="btn btn-danger btn-xs">
                                    <span class="glyphicon glyphicon-tag"></span> N'est pas scribe
                                </g:link>
                            </g:else>
                        </td>
                        <td>
                            <g:if test="${sec.loggedInUserInfo(field: "username") != person.username}">
                                <sec:ifAllGranted roles='ROLE_ADMIN'>
                                    <div class="btn-group">
                                        <g:form url="[resource: person, action: 'delete']" method="DELETE"
                                                class="form-inline pull-right">&nbsp;
                                            <button type="submit" class="btn btn-danger btn-xs"
                                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </button>

                                        </g:form>
                                        <form action='${request.contextPath}/j_spring_security_switch_user'
                                              method='POST' class="form-inline pull-right">
                                            <g:hiddenField name="j_username" value="${person.username}"/>
                                            <button type="submit" class="btn btn-xs btn-danger">
                                                <span class="glyphicon glyphicon-user"></span> ${message(code: 'default.button.switch.label', default: 'Switch')}
                                            </button>
                                        </form>

                                    </div>

                                </sec:ifAllGranted>
                            </g:if>
                        </td>
                    </tr>
                </g:each>

            </table>
        </div>

        <div class="panel-footer">
            <g:paginate total="${personInstanceCount ?: 0}"/>
        </div>

    </div>
</div>
</body>
</html>
