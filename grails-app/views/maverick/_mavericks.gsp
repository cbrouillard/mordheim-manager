<g:each in="${bandInstance.mavericks.sort({ it.dateCreated })}" var="maverick" status="n">
    <div class="panel panel-warning" xmlns="http://www.w3.org/1999/html">

        <div class="panel-heading">

            <div class="row">

                <div class="col-sm-4">
                    <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                    <h5><strong>${maverick.name}</strong></h5>
                    <span class="label label-default">${maverick.type}</span>
                    <g:if test="${maverick.cost > 0}">
                        <span class="label label-default"><g:message code="recruted.for" args="[maverick.cost]"/></span>
                    </g:if>
                    <g:if test="${maverick.bandSupValue}">
                        <span class="label label-default"><g:message code="increase.bandvalue.for" args="[maverick.bandSupValue]"/></span>
                    </g:if>
                    <g:if test="${maverick.retenueCost}">
                        <span class="label label-default"><g:message code="retenue.cost.for" args="[maverick.retenueCost]"/></span>
                    </g:if>
                </div>

                <g:if test="${!anonymous}">
                    <div class="col-sm-8">
                        <div class="form-inline">
                            <g:form url="[resource: maverick, action: 'delete']" method="DELETE"
                                    class="form-inline pull-right">
                                <g:hiddenField name="band" value="${bandInstance.id}"/>
                                <div class="btn-group">
                                    <g:link class="btn btn-success" controller="maverick" action="edit" id="${maverick.id}">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </g:link>
                                    <button type="submit" class="btn btn-danger"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </button>
                                </div>
                            </g:form>
                        </div>
                    </div>
                </g:if>
            </div>
        </div>

        <div class="panel-body">

            <div>
                <span class="label label-info pull-right"><g:message code="experience.label"/> : ${maverick.fullXp}</span>

                <g:render template="/profilable/experience" model="[from: maverick, maxXp: 14]"/>

            </div>

            <g:render template="/profilable/showprofile" model="[warrior: maverick]"/>

            <div class="row">

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.equipment.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(maverick.equipment)}</div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.competences.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(maverick.competences)}</div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.injuries.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(maverick.injuries)}</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</g:each>
