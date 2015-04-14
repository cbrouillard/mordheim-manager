<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="popup">
</head>

<body>
<g:form controller="referentiel" action="deleterace" method="DELETE" class="form-inline">
    <g:hiddenField name="id" value="${race.id}"/>

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><g:message code="default.button.delete.label"/></h4>
    </div>

    <div class="modal-body">

        <p><g:message code="default.button.delete.confirm.message"/></p>

    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><g:message code="cancel"/></button>
        <button type="submit" class="btn btn-danger">
            ${message(code: 'default.button.delete.label', default: 'Delete')}
        </button>
    </div>
</g:form>

</body>
</html>