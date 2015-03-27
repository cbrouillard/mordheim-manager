<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-xs-12">
        <div>
            <h1><g:message
                    code="referentiel.hero.create"/> <small>${race.name}</small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${refHeroInstance}">
            <div class="alert-danger alert">
                <ul class="errors" role="alert">
                    <g:eachError bean="${refHeroInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>
    </div>
</div>


<div class="col-sm-3 col-xs-12">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h5><g:message code="referentiel.already.created.heroes"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <g:each in="${race.heroes.sort({ it.dateCreated })}" var="hero">
                    <tr>
                        <td><strong>${hero.type}</strong></td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-9 col-xs-12">
    <g:form url="[controller: 'referentiel', action: 'savehero']" class="form-horizontal" data-toggle="validator">
        <g:hiddenField name="race" value="${race.id}"/>
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">
                    <g:render template="formhero"/>
                </fieldset>

            </div>

            <div class="panel-footer">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </g:form>
</div>

</body>
</html>