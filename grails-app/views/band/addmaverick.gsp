<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-xs-12">

        <div class="thumbnail pull-right">
            <asset:image src="Mordheim.gif" class="imgband"/>
        </div>

        <div class="clearfix">
            <h1><g:message
                    code="band.create.addmaverick"/> <small><g:message code="band.create.addmaverick.hint"/></small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${maverickInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${maverickInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>

<div class="col-sm-3 col-xs-12">
    <g:render template="recruits" model="[from: maverickInstance]"/>
</div>

<div class="col-sm-9 col-xs-12">

    <g:form url="[action: 'savemaverick']" class="form-horizontal" data-toggle="validator">
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="/maverick/form"/>
                    <g:hiddenField name="band" value="${bandId}"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <div class="btn-group">

                            <button type="submit" class="btn btn-success" value="addmaverick" name="next">
                                <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.maverick', default: 'Save')}
                            </button>

                            <g:if test="${maverickInstance.band.heroes.size() < 5}">
                                <button type="submit" class="btn btn-success" value="addhero" name="next">
                                    <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.hero', default: 'Save')}
                                </button>
                            </g:if>

                            <g:if test="${maverickInstance.band.wrenches.size() < 5}">
                                <button type="submit" class="btn btn-success" value="addwrench" name="next">
                                    <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step.wrench', default: 'Save')}
                                </button>
                            </g:if>
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
