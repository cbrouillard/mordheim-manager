<g:each in="${bandInstance.wrenches.sort({ it.dateCreated })}" var="wrench" status="n">
    <div class="panel panel-warning">

        <div class="panel-heading">

            <div class="row">
                <div class="col-sm-4">
                    <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                    <h5><strong>${wrench.name}</strong></h5>
                    <span class="label label-default">${wrench.number} ${wrench.type}</span>
                    <span class="label label-default"><g:message code="recruted.for" args="[wrench.cost]"/></span>
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
                            </g:form>
                        </div>
                    </div>
                </g:if>
            </div>

        </div>

        <div class="panel-body">

            <div>
                <span class="label label-info pull-right"><g:message code="experience.label"/> : ${wrench.fullXp}</span>

                <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar"
                         style="width: ${wrench.experience * 100 / 14}%;">
                        ${wrench.experience}
                    </div>

                    <div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar"
                         style="width: ${wrench.earnedXp * 100 / 14}%;">
                        ${wrench.earnedXp}
                    </div>
                </div>
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
                                class="label label-${wrench?.M <= 2 ? "danger" : (wrench?.M <= 4 ? 'warning' : 'success')}">${wrench?.M}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${wrench?.CC <= 2 ? "danger" : (wrench?.CC <= 3 ? 'warning' : 'success')}">${wrench?.CC}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${wrench?.CT <= 2 ? "danger" : (wrench?.CT <= 3 ? 'warning' : 'success')}">${wrench?.CT}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${wrench?.F <= 2 ? "danger" : (wrench?.F <= 3 ? 'warning' : 'success')}">${wrench?.F}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${wrench?.E <= 2 ? "danger" : (wrench?.E <= 3 ? 'warning' : 'success')}">${wrench?.E}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${wrench?.PV >= 2 ? "success" : "default"}">${wrench?.PV}</span></td>
                        <td class="text-center"><span
                                class="label label-${wrench?.I <= 2 ? "danger" : (wrench?.I <= 3 ? 'warning' : 'success')}">${wrench?.I}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${wrench?.A >= 2 ? "success" : "default"}">${wrench?.A}</span></td>
                        <td class="text-center"><span
                                class="label label-${wrench?.CD <= 6 ? "danger" : (wrench?.CD <= 7 ? 'warning' : 'success')}">${wrench?.CD}</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

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