<g:each in="${bandInstance.wrenches.sort({ it.dateCreated })}" var="wrench" status="n">
    <div class="panel panel-warning">

        <div class="panel-heading">

            <div class="row">
                <div class="col-sm-4">
                    <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                    <h5><strong>${wrench.name}</strong></h5>
                    <span class="label label-default">${wrench.number} ${wrench.type}</span>
                    <g:if test="${wrench.cost > 0}">
                        <span class="label label-default"><g:message code="recruted.for" args="[wrench.cost]"/></span>
                    </g:if>
                </div>

                <g:if test="${!anonymous}">
                    <div class="col-sm-8">
                        <div class="form-inline">
                            <g:form url="[resource: wrench, action: 'delete']" method="DELETE"
                                    class="form-inline pull-right">
                                <g:hiddenField name="band" value="${bandInstance.id}"/>
                                <div class="btn-group">
                                    <g:link class="btn btn-success" controller="wrenchmen" action="edit"
                                            id="${wrench.id}">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </g:link>
                                    <button type="submit" class="btn btn-danger"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </button>
                                </div>

                                <g:link class="btn btn-warning" controller="wrenchmen" action="promote"
                                        id="${wrench.id}">
                                    <span class="glyphicon glyphicon-circle-arrow-up"></span>
                                    <g:message code="wrench.promote"/>
                                </g:link>
                            </g:form>
                        </div>
                    </div>
                </g:if>
            </div>

        </div>

        <div class="panel-body">

            <div>
                <span class="label label-info pull-right"><g:message code="experience.label"/> : ${wrench.fullXp}</span>

                <g:render template="/profilable/experience" model="[from: wrench, maxXp: 14]"/>
            </div>

            <g:render template="/profilable/showprofile" model="[warrior: wrench]"/>

            <div class="row">

                <div class="col-sm-6">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="wrench.equipment.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(wrench.equipment)}</div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="wrench.specialRules.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(wrench.specialRules)}</div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
</g:each>