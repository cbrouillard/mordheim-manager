<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="popup">
</head>

<body>
<g:form url="[resource: maverick, action: 'delete']" method="DELETE"
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
                        <g:if test="${!maverick.photo}">
                            <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                        </g:if>
                        <g:else>
                            <img src="${createLink(action: 'photo', id: maverick.id, controller: 'maverick')}"
                                 class="imgwarrior pull-left"/>
                        </g:else>
                        <div class="pull-left">
                            <h5><strong>${maverick.name}</strong></h5>
                            <span class="label label-default">${maverick.type}</span>
                            <g:if test="${maverick.cost > 0}">
                                <span class="label label-default"><g:message code="recruted.for"
                                                                             args="[maverick.cost]"/></span>
                            </g:if>
                            <g:if test="${maverick.bandSupValue}">
                                <span class="label label-default"><g:message code="increase.bandvalue.for"
                                                                             args="[maverick.bandSupValue]"/></span>
                            </g:if>
                            <g:if test="${maverick.retenueCost}">
                                <span class="label label-default"><g:message code="retenue.cost.for"
                                                                             args="[maverick.retenueCost]"/></span>
                            </g:if>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel-body">

                <div>
                    <span class="label label-info pull-right"><g:message
                            code="experience.label"/> : ${maverick.fullXp}</span>

                    <g:render template="/profilable/experience" model="[from: maverick, maxXp: 14]"/>

                </div>

                <g:render template="/profilable/showprofile" model="[warrior: maverick]"/>

            </div>

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