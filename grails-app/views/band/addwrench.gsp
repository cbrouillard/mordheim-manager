<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>
<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1><g:message
                    code="band.create.addwrench"/> <small><g:message code="band.create.addwrench.hint"/></small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${wrenchmenInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${wrenchmenInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>

<div class="col-sm-3 col-xs-12">
    <g:render template="recruits" model="[from:wrenchmenInstance]"/>
</div>

<div class="col-sm-9 col-xs-12">

    <g:form url="[action: 'savewrench']" class="form-horizontal" data-toggle="validator">
        <div class="panel panel-default">

            <div class="panel-heading">
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <div class="btn-group">
                            <button type="submit" class="btn btn-success" value="addwrench" name="next">
                                <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.wrench', default: 'Save')}
                            </button>

                            <button type="submit" class="btn btn-success" value="addhero" name="next">
                                <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.hero', default: 'Save')}
                            </button>
                        </div>

                        <div class="btn-group pull-right">
                            <button type="submit" class="btn btn-success" value="show" name="next">
                                <span class="glyphicon glyphicon-ok-circle"></span> ${message(code: 'next.step.done', default: 'Save')}
                            </button>
                            <g:link class="btn btn-warning" controller="band" action="show" id="${bandId}">
                                <span class="glyphicon glyphicon-ok-circle"></span> <g:message
                                    code="next.step.nosave.done"/>
                            </g:link>
                        </div>

                    </div>
                </div>
            </div>

            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="/wrenchmen/form"/>
                    <g:hiddenField name="band" value="${bandId}"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <div class="btn-group">
                            <button type="submit" class="btn btn-success" value="addwrench" name="next">
                                <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.wrench', default: 'Save')}
                            </button>

                            <button type="submit" class="btn btn-success" value="addhero" name="next">
                                <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.hero', default: 'Save')}
                            </button>
                        </div>

                        <div class="btn-group pull-right">
                            <button type="submit" class="btn btn-success" value="show" name="next">
                                <span class="glyphicon glyphicon-ok-circle"></span> ${message(code: 'next.step.done', default: 'Save')}
                            </button>
                            <g:link class="btn btn-warning" controller="band" action="show" id="${bandId}">
                                <span class="glyphicon glyphicon-ok-circle"></span> <g:message
                                    code="next.step.nosave.done"/>
                            </g:link>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>
</body>
</html>
