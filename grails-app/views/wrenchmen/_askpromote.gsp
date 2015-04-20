<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="popup">
</head>

<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title"><g:message code="wrench.ask.promote" args="[wrench.name]"/></h4>
</div>

<div class="modal-body">

    <p><g:message code="confirm.wrench.promotion"/></p>
    <ul>
        <g:if test="${wrench.number > 1}">
            <li><g:message code="new.number" args="[wrench.number, wrench.number - 1]"/></li>
        </g:if>
        <g:else>
            <li><g:message code="new.hero.delete.group"/></li>
        </g:else>
        <li><g:message code="new.hero"/></li>
    </ul>

</div>


<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><g:message code="cancel"/></button>
    <g:link class="btn btn-warning" controller="wrenchmen" action="promote"
            id="${wrench.id}">
        <span class="glyphicon glyphicon-circle-arrow-up"></span>
        <g:message code="wrench.promote"/>
    </g:link>
</div>

</body>
</html>