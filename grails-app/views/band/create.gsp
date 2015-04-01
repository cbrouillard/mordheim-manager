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
                    code="band.create"/> <small><g:message code="band.create.hint"/></small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${bandInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${bandInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>

<div class="col-xs-12">

    <g:if test="${races}">
        <div class="panel panel-primary">
            <div class="panel-body">
                <div class="form-horizontal">

                    <div class="form-group">

                        <label for="selector" class="col-sm-2 control-label"><g:message
                                code="referentiel.selector.race"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-text-background"></span></span>
                                <g:select class="form-control"
                                          name="selector"
                                          from="${races}"
                                          optionKey="id"
                                          optionValue="name"
                                          noSelection="['-1': '']"
                                          onchange="${remoteFunction(action: 'loadrace',
                                                  update: [success: 'formContainer'],
                                                  params: '\'race=\' + this.value')}"/>

                            </div>

                            <div class="help-block with-errors">
                                <g:message code="referentiel.selector.hint"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </g:if>

    <g:form url="[resource: bandInstance, action: 'save']" class="form-horizontal" data-toggle="validator">

        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">
                    <div id="formContainer">
                        <g:render template="form"/>
                    </div>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step', default: 'Save')}
                        </button>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>
</body>
</html>
