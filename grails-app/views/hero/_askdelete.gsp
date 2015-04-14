<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="popup">
</head>

<body>
<g:form url="[resource: heroInstance, action: 'delete']" method="DELETE"
        class="form-inline">

    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><g:message code="default.button.delete.label"/></h4>
    </div>

    <div class="modal-body">

        <p><g:message code="default.button.delete.confirm.message"/></p>

        <div class="panel panel-warning" xmlns="http://www.w3.org/1999/html">

            <div class="panel-heading">

                <div class="row clearfix">

                    <div class="col-sm-4">
                        <g:if test="${!heroInstance.photo}">
                            <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                        </g:if>
                        <g:else>
                            <img src="${createLink(action: 'photo', id: heroInstance.id, controller: 'hero')}"
                                 class="imgwarrior pull-left"/>
                        </g:else>
                        <div class="pull-left">
                            <h5><strong>${heroInstance.name}</strong></h5>
                            <span class="label label-default">${heroInstance.type}</span>
                            <g:if test="${heroInstance.cost > 0}">
                                <span class="label label-default"><g:message code="recruted.for"
                                                                             args="[heroInstance.cost]"/></span>
                            </g:if>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-body">

                <div>
                    <span class="label label-info pull-right"><g:message
                            code="experience.label"/> : ${heroInstance.fullXp}</span>

                    <g:render template="/profilable/experience" model="[from: heroInstance, maxXp: 90]"/>

                </div>

                <g:render template="/profilable/showprofile" model="[warrior: heroInstance]"/>

            </div>

        </div>

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