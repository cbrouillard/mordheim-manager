<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <script type="application/javascript">
        var loadhero = function (heroId) {
            $.get('${createLink(action:'loadhero', controller: 'hero')}' + "/" + heroId, function (data) {
                fillHeroForm(data);
            });

        }
    </script>
</head>

<body>
<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1><g:message
                    code="hero.create"/> <small><g:message code="hero.create.hint"/></small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${heroInstance}">
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

    <g:form url="[resource: heroInstance, action: 'save']" class="form-horizontal" data-toggle="validator">
        <div class="panel panel-default">
            <g:if test="${heroInstance.band.race}">
                <div class="panel-heading">
                    <div class="form-group">

                        <label for="selector" class="col-sm-2 control-label"><g:message
                                code="referentiel.selector.hero"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-text-background"></span></span>
                                <g:select class="form-control"
                                          name="selector"
                                          from="${heroInstance.band.race.heroes.sort({it.dateCreated})}"
                                          optionKey="id"
                                          optionValue="type"
                                          noSelection="['NO': '']"
                                          onchange="javascript:loadhero(this.value);"/>
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
                    <div id="formContainer">
                        <g:render template="form"/>
                    </div>
                    <g:hiddenField name="band" value="${bandId}"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </button>

                        <g:link class="btn btn-default" controller="band" action="show" id="${bandId}">
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
