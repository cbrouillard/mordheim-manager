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
        <div class="thumbnail pull-right">
            <asset:image src="Mordheim.gif" class="imgband"/>
        </div>

        <div class="clearfix">
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
    <g:render template="recruits" model="[from: wrenchmenInstance]"/>
</div>

<div class="col-sm-9 col-xs-12">

    <g:form url="[action: 'savewrench']" class="form-horizontal" data-toggle="validator">
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
                                          from="${wrenchmenInstance.band.race.wrenches}"
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
                    <g:render template="/wrenchmen/form"/>
                    <g:hiddenField name="band" value="${bandId}"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <div class="btn-group">
                            <g:if test="${wrenchmenInstance.band.wrenches.size() < 5}">
                                <button type="submit" class="btn btn-success" value="addwrench" name="next">
                                    <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.wrench', default: 'Save')}
                                </button>
                            </g:if>

                            <g:if test="${wrenchmenInstance.band.heroes.size() < 5}">
                                <button type="submit" class="btn btn-success" value="addhero" name="next">
                                    <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.hero', default: 'Save')}
                                </button>
                            </g:if>

                            <button type="submit" class="btn btn-success" value="addmaverick" name="next">
                                <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.maverick', default: 'Save')}
                            </button>
                        </div>

                        <div class="btn-group pull-right">
                            <button type="submit" class="btn btn-success" value="show" name="next">
                                <span class="glyphicon glyphicon-save"></span> ${message(code: 'next.step.done', default: 'Save')}
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>
</body>
</html>
