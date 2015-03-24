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

            <div class="table-responsive">
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th class="text-center"><g:message code="profile.m"/></th>
                        <th class="text-center"><g:message code="profile.cc"/></th>
                        <th class="text-center"><g:message code="profile.ct"/></th>
                        <th class="text-center"><g:message code="profile.f"/></th>
                        <th class="text-center"><g:message code="profile.e"/></th>
                        <th class="text-center"><g:message code="profile.pv"/></th>
                        <th class="text-center"><g:message code="profile.i"/></th>
                        <th class="text-center"><g:message code="profile.a"/></th>
                        <th class="text-center"><g:message code="profile.cd"/></th>
                    </tr
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center"><span
                                class="label label-${maverick?.M <= 2 ? "danger" : (maverick?.M <= 4 ? 'warning' : 'success')}">${maverick?.M}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${maverick?.CC <= 2 ? "danger" : (maverick?.CC <= 3 ? 'warning' : 'success')}">${maverick?.CC}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${maverick?.CT <= 2 ? "danger" : (maverick?.CT <= 3 ? 'warning' : 'success')}">${maverick?.CT}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${maverick?.F <= 2 ? "danger" : (maverick?.F <= 3 ? 'warning' : 'success')}">${maverick?.F}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${maverick?.E <= 2 ? "danger" : (maverick?.E <= 3 ? 'warning' : 'success')}">${maverick?.E}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${maverick?.PV >= 2 ? "success" : "default"}">${maverick?.PV}</span></td>
                        <td class="text-center"><span
                                class="label label-${maverick?.I <= 2 ? "danger" : (maverick?.I <= 3 ? 'warning' : 'success')}">${maverick?.I}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${maverick?.A >= 2 ? "success" : "default"}">${maverick?.A}</span></td>
                        <td class="text-center"><span
                                class="label label-${maverick?.CD <= 6 ? "danger" : (maverick?.CD <= 7 ? 'warning' : 'success')}">${maverick?.CD}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

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
