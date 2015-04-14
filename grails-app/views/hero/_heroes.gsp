<g:each in="${bandInstance.heroes.sort({ it.dateCreated })}" var="hero" status="n">
    <div class="panel panel-warning" xmlns="http://www.w3.org/1999/html">

        <div class="panel-heading">

            <div class="row clearfix">

                <div class="col-sm-4">
                    <g:link action="changephoto" id="${hero.id}" controller="hero">
                        <g:if test="${!hero.photo}">
                            <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                        </g:if>
                        <g:else>
                            <img src="${createLink(action: 'photo', id: hero.id, controller: 'hero')}"
                                 class="imgwarrior pull-left"/>
                        </g:else>
                    </g:link>
                    <div class="pull-left">
                        <h5><strong>${hero.name}</strong></h5>
                        <span class="label label-default">${hero.type}</span>
                        <g:if test="${hero.cost > 0}">
                            <span class="label label-default"><g:message code="recruted.for" args="[hero.cost]"/></span>
                        </g:if>
                    </div>
                </div>

                <g:if test="${!anonymous}">
                    <div class="col-sm-8 text-right">
                        <div class="btn-group">
                            <g:link class="btn btn-success" controller="hero" action="edit" id="${hero.id}">
                                <span class="glyphicon glyphicon-edit"></span>
                            </g:link>
                            <a class="btn btn-danger" data-toggle="modal" data-target="#globalModal"
                               href="${createLink(controller: 'hero', action: 'askdelete', id: hero.id)}">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                        </div>
                    </div>
                </g:if>
            </div>
        </div>

        <div class="panel-body">

            <div>
                <span class="label label-info pull-right"><g:message code="experience.label"/> : ${hero.fullXp}</span>

                <g:render template="/profilable/experience" model="[from: hero, maxXp: 90]"/>

            </div>

            <g:render template="/profilable/showprofile" model="[warrior: hero]"/>

            <div class="row">

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="warrior.equipment.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(hero.equipment)}</div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.competences.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(hero.competences)}</div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-info">
                        <div class="panel-heading"><g:message code="hero.injuries.label"/></div>

                        <div class="panel-body">
                            <div class="well">${raw(hero.injuries)}</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</g:each>
