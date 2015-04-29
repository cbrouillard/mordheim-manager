<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <script type="application/javascript">
        var loadwrench = function (wId) {
            $.get('${createLink(action:'loadwrench', controller: 'wrenchmen')}' + "/" + wId, function (data) {
                fillWrenchForm(data);
            });
        }
    </script>
</head>

<body>
<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1><g:message
                    code="wrench.create"/> <small><g:message code="wrench.create.hint"/></small>
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

<div class="col-xs-12">

    <g:form url="[resource: wrenchmenInstance, action: 'save']" class="form-horizontal" data-toggle="validator"
            id="form">
        <div class="panel panel-default">
            <g:if test="${wrenchmenInstance.band.race}">
                <div class="panel-heading">
                    <div class="form-group">

                        <label for="selector" class="col-sm-2 control-label"><g:message
                                code="referentiel.selector.wrench"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-text-background"></span></span>
                                <g:select class="form-control"
                                          name="selector"
                                          from="${wrenchmenInstance.band.race.wrenches.sort({it.dateCreated})}"
                                          optionKey="id"
                                          optionValue="type"
                                          noSelection="['NO': '']"
                                          onchange="javascript:loadwrench(this.value);"/>
                            </div>

                            <div class="help-block with-errors">
                                <g:message code="referentiel.selector.hint"/>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>
            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="form"/>
                    <g:hiddenField name="band" value="${bandId}"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </button>

                        <g:link class="btn btn-default" controller="band" action="show" id="${bandId}"
                                params="[tab: 'wrench']">
                            <span class="glyphicon glyphicon-triangle-left"></span> <g:message
                                code="cancel"/>
                        </g:link>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>
</body>
</html>
