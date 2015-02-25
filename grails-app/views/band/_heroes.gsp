<g:each in="${bandInstance.heroes.sort({ it.dateCreated })}" var="hero" status="n">
    <div class="panel panel-default">

        <div class="panel-heading">

            <div class="row">
                <div class="col-sm-4">
                    <h5>${hero.name} :: ${hero.type}</h5>
                </div>

                <div class="col-sm-8">
                    <div class="form-inline">
                        <g:form url="[resource: hero, action: 'delete']" method="DELETE"
                                class="form-inline pull-right">
                            <g:hiddenField name="band" value="${bandInstance.id}"/>
                            <div class="btn-group">
                                <g:link class="btn btn-success" controller="hero" action="edit" id="${hero.id}">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </g:link>
                                <button type="submit" class="btn btn-danger"
                                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                    <span class="glyphicon glyphicon-trash"></span>
                                </button>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-body">

            <div class="progress">
                <div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar" style="width: ${hero.experience * 90 / 100}%;">
                    <strong><g:message code="hero.experience.label" /> : ${hero.experience}</strong>
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
                                class="label label-${hero?.M <= 2 ? "danger" : (hero?.M <= 4 ? 'warning' : 'success')}">${hero?.M}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${hero?.CC <= 2 ? "danger" : (hero?.CC <= 3 ? 'warning' : 'success')}">${hero?.CC}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${hero?.CT <= 2 ? "danger" : (hero?.CT <= 3 ? 'warning' : 'success')}">${hero?.CT}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${hero?.F <= 2 ? "danger" : (hero?.F <= 3 ? 'warning' : 'success')}">${hero?.F}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${hero?.E <= 2 ? "danger" : (hero?.E <= 3 ? 'warning' : 'success')}">${hero?.E}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${hero?.PV >= 2 ? "success" : "default"}">${hero?.PV}</span></td>
                        <td class="text-center"><span
                                class="label label-${hero?.I <= 2 ? "danger" : (hero?.I <= 3 ? 'warning' : 'success')}">${hero?.I}</span>
                        </td>
                        <td class="text-center"><span
                                class="label label-${hero?.A >= 2 ? "success" : "default"}">${hero?.A}</span></td>
                        <td class="text-center"><span
                                class="label label-${hero?.CD <= 6 ? "danger" : (hero?.CD <= 7 ? 'warning' : 'success')}">${hero?.CD}</span>
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
                            <pre>${hero.equipment}</pre>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.competences.label"/></div>

                        <div class="panel-body">
                            <pre>${hero.competences}</pre>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.injuries.label"/></div>

                        <div class="panel-body">
                            <pre>${hero.injuries}</pre>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</g:each>
