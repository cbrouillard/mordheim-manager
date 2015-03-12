<h4>${from.band.name} <small>${from.band.type}</small></h4>
<hr/>
<div class="panel panel-warning">
    <div class="panel-heading"><g:message code="recruit.heroes"/></div>
    <div class="panel-body">
        <g:each in="${from.band.heroes.sort({it.dateCreated})}" var="hero">
            <div class="thumbnail">
                <strong>${hero.name}</strong> <span class="label label-default">${hero.type}</span>
                <span class="badge">${hero.cost} CO</span>
            </div>
        </g:each>
    </div>
    <div class="panel-footer">
        <g:link class="btn btn-warning" controller="band" action="addhero" id="${bandId}">
            <span class="glyphicon glyphicon-forward"></span> <g:message
                code="next.step.nosave.hero"/>
        </g:link>
    </div>
</div>

<div class="panel panel-warning">
    <div class="panel-heading"><g:message code="recruit.wrenches"/></div>
    <div class="panel-body">
        <g:each in="${from.band.wrenches.sort({it.dateCreated})}" var="wrench">
            <div class="thumbnail">
                <strong>${wrench.name}</strong> <span class="label label-default">${wrench.type}</span>
                <span class="badge">${wrench.cost} CO</span>
            </div>
        </g:each>
    </div>
    <div class="panel-footer">
        <g:link class="btn btn-warning" controller="band" action="addwrench" id="${bandId}">
            <span class="glyphicon glyphicon-forward"></span> <g:message
                code="next.step.nosave.wrench"/>
        </g:link>
    </div>
</div>