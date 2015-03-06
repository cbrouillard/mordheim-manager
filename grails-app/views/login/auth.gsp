<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="app.title"/></title>
</head>

<body>

<g:if test='${flash.message}'>
    <div class='alert-info alert'>${flash.message}</div>
</g:if>

<div class="col-sm-4 col-sm-offset-4">

    <div class="panel panel-warning">

        <div class="panel-heading">
            <h4><g:message code="login"/></h4>
        </div>

        <div class="panel-body">

            <form class="form-signin" action='${postUrl}' method='POST' id='loginForm' autocomplete='off'
                  data-toggle="validator">
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-user"></span></span>
                        <input type="text" name='j_username' id='username' class="form-control"
                               placeholder="${message(code: 'user.id')}"
                               required
                               autofocus>
                    </div>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-cog"></span></span>
                        <input type="password" name='j_password' id='password' class="form-control"
                               placeholder="${message(code: 'user.pass')}"
                               required>
                    </div>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="checkbox">
                    <label>
                        <input type="checkbox" name='${rememberMeParameter}' id='remember_me'
                               <g:if test='${hasCookie}'>checked='checked'</g:if>/> <g:message code="remember.me"/>
                    </label>
                </div>
                <button class="btn btn-lg btn-success btn-block" type="submit"><g:message code="login.go"/></button>

            </form>
        </div>

    </div>

    <div class="panel panel-warning">
        <div class="panel-body">
            <g:link controller="person" action="register" class="btn btn-lg btn-primary btn-block">
                <g:message code="register"/>
            </g:link>
        </div>
    </div>

</div>

%{--
<div class="col-xs-8">
</div>
--}%

</body>
</html>