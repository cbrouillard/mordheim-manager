<div class="clearfix">

    <h4>${from.band.name} <small>${from.band.type}</small><span class="badge pull-right"><g:message code="band.gold"
                                                                                                    args="[from.band.gold]"/></span>
    </h4>

    <hr/>
</div>

<div class="panel panel-warning">
    <div class="panel-heading"><g:message code="recruit.heroes"/></div>

    <div class="table-responsive">

        <table class="table">
            <g:each in="${from.band.heroes.sort({ it.dateCreated })}" var="hero">
                <tr>
                    <td><strong>${hero.name}</strong></td>
                    <td><span class="label label-default">${hero.type}</span></td>
                    <td class="text-right"><span class="badge">${hero.cost} CO</span></td>
                </tr>
            </g:each>
        </table>
    </div>

    <g:if test="${from.band.heroes.size() < 6}">
        <div class="panel-footer clearfix">
            <g:link class="btn btn-warning pull-right" controller="band" action="addhero" id="${bandId}">
                <span class="glyphicon glyphicon-forward"></span> <g:message
                    code="next.step.nosave.hero"/>
            </g:link>
        </div>
    </g:if>
</div>

<div class="panel panel-warning">
    <div class="panel-heading"><g:message code="recruit.wrenches"/></div>

    <div class="table-responsive">
        <table class="table">
            <g:each in="${from.band.wrenches.sort({ it.dateCreated })}" var="wrench">
                <tr>
                    <td><strong>${wrench.name}</strong></td>
                    <td><span class="label label-default">${wrench.type}</span></td>
                    <td class="text-right"><span class="badge">${wrench.cost} CO</span></td>
                </tr>
            </g:each>
        </table>
    </div>

    <g:if test="${from.band.wrenches.size() < 6}">
        <div class="panel-footer clearfix">
            <g:link class="btn btn-warning pull-right" controller="band" action="addwrench" id="${bandId}">
                <span class="glyphicon glyphicon-forward"></span> <g:message
                    code="next.step.nosave.wrench"/>
            </g:link>
        </div>
    </g:if>
</div>

<div class="panel panel-warning">
    <div class="panel-heading"><g:message code="recruit.mavericks"/></div>

    <div class="table-responsive">
        <table class="table">
            <g:each in="${from.band.mavericks.sort({ it.dateCreated })}" var="maverick">
                <tr>
                    <td><strong>${maverick.name}</strong></td>
                    <td><span class="label label-default">${maverick.type}</span></td>
                    <td class="text-right"><span class="badge">${maverick.cost} CO</span></td>
                </tr>
            </g:each>
        </table>
    </div>

    <div class="panel-footer clearfix">
        <g:link class="btn btn-warning pull-right" controller="band" action="addmaverick" id="${bandId}">
            <span class="glyphicon glyphicon-forward"></span> <g:message
                code="next.step.nosave.maverick"/>
        </g:link>
    </div>
</div>

<g:link class="btn btn-primary btn-block" controller="band" action="show" id="${bandId}">
    <span class="glyphicon glyphicon-ok-circle"></span> <g:message
        code="recruit.done"/>
</g:link>

<div class="alert alert-info">
    <g:message code="recruit.done.hint"/>
</div>