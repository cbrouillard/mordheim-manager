<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="thumbnail pull-right">
            <g:render template="/band/image"/>
        </div>

        <div>

            <h1>
                <g:message
                        code="band.end.games"/> <small>${bandInstance.name}</small>
            </h1>

            <hr/>

            <div class="clearfix">&nbsp;</div>
            <ol class="breadcrumb">
                <li><g:message code="end.wrenchmen.states"/></li>
                <li><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.gains"/></li>
                <g:if test="${bandInstance.mavericks}">
                    <li><g:message code="end.mavericks.states"/></li>
                </g:if>
                <li class="active"><g:message code="end.recap"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-4 col-xs-12">

    <div class="alert alert-info">
        <g:message code="end.xpref.value" args="[parameters.xpRef]"/>
    </div>


    <div class="panel panel-primary">
        <div class="panel-heading">
            <h5><g:message code="end.gains"/></h5>
        </div>

        <div class="table-responsive">
            <table class="table">
                <tr>
                    <td><strong><g:message code="band.gold.title"/></strong></td>
                    <td>
                        + <g:message code="band.gold" args="[data.band.gold]"/>
                    </td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.magical.stones.title"/></strong></td>
                    <td>
                        + ${data.band.magicalStones}
                    </td>
                </tr>
                <tr>
                    <td><strong><g:message code="reserve.label"/></strong></td>
                    <td>
                        <div class="well">
                            ${raw(data.band.reserve)}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong><g:message code="note.label"/></strong></td>
                    <td>
                        <div class="well">
                            ${raw(data.band.note)}
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-8 col-xs-12">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <g:message code="please.verify.end.game"/>
        </div>

        <div class="table-responsive">
            <table class="table table-hover">
                <tr class="info">
                    <td colspan="5" class="text-center"><strong><g:message code="end.wrenchmen.states"/></strong></td>
                </tr>
                <g:each in="${bandInstance.wrenches.sort({ it.dateCreated })}" var="wrench">
                    <tr>
                        <td><strong>${wrench.name}</strong> <span
                                class="label label-default">#${wrench.number} ${wrench.type}</span></td>
                        <td>
                            <g:set var="infos" value="${data.wrenches.wrench[wrench.id]}"/>
                            <g:set var="notin" value="${data.wrenches.wrench[wrench.id]["notin"]}"/>
                            <g:set var="bonus"
                                   value="${new java.lang.Integer(data.wrenches[wrench.id]["bonus"] ?: 0)}"/>
                            <g:set var="rules" value="${data.wrenches[wrench.id]["specialRules"]}"/>
                            <g:set var="alive" value="${infos.count { it.value == 'life' }}"/>
                            <g:set var="dead" value="${infos.count { it.value == 'death' }}"/>

                            <g:if test="${notin}">
                                <span class="label label-warning"><g:message code="notin.hero"/></span>
                            </g:if>
                            <g:else>
                                <g:if test="${alive}">
                                    <span class="label label-success"><g:message code="alive"
                                                                                 args="[alive]"/></span>
                                </g:if>
                                <g:if test="${dead}">
                                    <span class="label label-danger"><g:message code="dead"
                                                                                args="[dead]"/></span>
                                </g:if>
                                <g:if test="${bonus}">
                                    <span class="label label-info"><g:message code="bonus"
                                                                              args="[bonus]"/></span>
                                </g:if>
                            </g:else>

                        </td>
                        <td>
                            <div class="well">
                                ${raw(rules) ?: message(code: 'no.competences')}
                            </div>
                        </td>
                        <td class="text-right" colspan="2">
                            <span class="badge">
                                <g:if test="${notin}">
                                    + 0 xp
                                </g:if>
                                <g:else>
                                    <g:if test="${alive}">
                                        + ${new java.lang.Integer(parameters.xpRef) + bonus} xp
                                    </g:if>
                                    <g:else>
                                        + 0 xp
                                    </g:else>
                                </g:else>
                            </span>
                        </td>
                    </tr>
                </g:each>
                <tr class="info">
                    <td colspan="5" class="text-center"><strong><g:message code="end.heroes.states"/></strong></td>
                </tr>
                <g:each in="${bandInstance.heroes.sort({ it.dateCreated })}" var="hero">
                    <tr>
                        <td><strong>${hero.name}</strong>
                            <span class="label label-default">${hero.type}</span>
                        </td>
                        <td>
                            <g:set var="infos" value="${data.heroes[hero.id]}"/>
                            <g:set var="bonus" value="${new java.lang.Integer(data.heroes[hero.id]["bonus"] ?: 0)}"/>

                            <g:set var="xp" value="${bonus}"/>

                            <g:if test="${infos.state == "life"}">
                                <span class="label label-success"><g:message code="alive.hero"/></span>
                                <g:set var="xp" value="${xp + new java.lang.Integer(parameters.xpRef)}"/>
                            </g:if>
                            <g:if test="${infos.victoriouschief}">
                                <span class="label label-warning"><g:message code="victorious.hero"/></span>
                                <g:set var="xp" value="${xp + 1}"/>
                            </g:if>
                            <g:set var="xp" value="${xp + new Integer(infos.kill)}"/>
                            <span class="label label-danger"><g:message code="hero.kill"
                                                                        args="[new Integer(infos.kill)]"/></span>

                            <g:if test="${bonus}">
                                <span class="label label-info"><g:message code="bonus"
                                                                          args="[bonus]"/></span>
                            </g:if>
                            <g:if test="${infos.state == "death"}">
                                <span class="label label-danger"><g:message code="dead.hero"/></span>
                                <g:set var="xp" value="${new Integer(0)}"/>
                            </g:if>
                            <g:if test="${infos.state == "notin"}">
                                <span class="label label-warning"><g:message code="notin.hero"/></span>
                                <g:set var="xp" value="${new Integer(0)}"/>
                            </g:if>
                        </td>
                        <td>
                            <div class="well">
                                ${raw(infos.injuries) ?: message(code: 'no.injuries')}
                            </div>
                        </td>
                        <td>
                            <div class="well">
                                ${raw(infos.competences) ?: message(code: 'no.competences')}
                            </div>
                        </td>
                        <td class="text-right">
                            <span class="badge">+ ${xp} xp</span>
                        </td>
                    </tr>
                </g:each>

                <g:if test="${bandInstance.mavericks}">
                    <tr class="info">
                        <td colspan="5" class="text-center"><strong><g:message code="end.mavericks.states"/></strong>
                        </td>
                    </tr>
                    <g:each in="${bandInstance.mavericks.sort({ it.dateCreated })}" var="maverick">
                        <tr>
                            <td><strong>${maverick.name}</strong>
                                <span class="label label-default">${maverick.type}</span>
                            </td>
                            <td>
                                <g:set var="infos" value="${data.mavericks[maverick.id]}"/>
                                <g:set var="bonus"
                                       value="${new java.lang.Integer(data.mavericks[maverick.id]["bonus"] ?: 0)}"/>
                                <g:set var="xp" value="${bonus}"/>

                                <g:if test="${infos.state == "life"}">
                                    <span class="label label-success"><g:message code="alive.hero"/></span>
                                    <g:set var="xp" value="${xp + new java.lang.Integer(parameters.xpRef)}"/>
                                </g:if>
                                <g:if test="${bonus}">
                                    <span class="label label-info"><g:message code="bonus"
                                                                              args="[bonus]"/></span>
                                </g:if>
                                <g:if test="${infos.state == "death"}">
                                    <span class="label label-danger"><g:message code="dead.hero"/></span>
                                    <g:set var="xp" value="${new Integer(0)}"/>
                                </g:if>
                                <g:if test="${infos.state == "notin"}">
                                    <span class="label label-warning"><g:message code="notin.hero"/></span>
                                    <g:set var="xp" value="${new Integer(0)}"/>
                                </g:if>
                            </td>
                            <td>
                                <div class="well">
                                    ${raw(infos.injuries) ?: message(code: 'no.injuries')}
                                </div>
                            </td>
                            <td>
                                <div class="well">
                                    ${raw(infos.competences) ?: message(code: 'no.competences')}
                                </div>
                            </td>
                            <td class="text-right">
                                <span class="badge">+ ${xp} xp</span>
                            </td>
                        </tr>
                    </g:each>
                </g:if>

            </table>

        </div>

        <div class="panel-footer clearfix">

            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">

                    <div class="pull-right">
                        <g:link class="btn btn-success" action="savegame" controller="game" id="${bandInstance.id}"
                                data-toggle="tooltip"
                                data-placement="top"
                                title="${message(code: "please.verify.end.game.tiny")}">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </g:link>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jq:jquery>
    $('[data-toggle="tooltip"]').tooltip();
</jq:jquery>

</body>
</html>