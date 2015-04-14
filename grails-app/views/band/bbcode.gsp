<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="popup">
</head>

<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title"><g:message code="generate.bbcode"/></h4>
</div>


<div class="modal-body">

    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <h5><g:message code="bbcode.copy.that"/></h5>
        </div>

        <div class="panel-body">

            <textarea class="form-control editor" cols="40" rows="10">
                <code>
                    [b]${bandInstance.name}[/b] ([i]${bandInstance.type}[/i])<br/>
                    [<g:message code="heroes"/>]---------------------------------------------------------<br/>
                    <g:each in="${bandInstance.heroes.sort({ it.dateCreated })}" var="hero">
                        [b]${hero.name}[/b] ([i]${hero.type}[/i]) [<g:message code="band.gold"
                                                                              args="[hero.cost]"/>]<br/>
                        <g:if test="${hero.equipment}">- <g:message
                                code="warrior.equipment.label"/> : ${raw(hero.equipment)}<br/></g:if>
                        <g:if test="${hero.competences}">- <g:message
                                code="hero.competences.label"/> : ${raw(hero.competences)}<br/></g:if>
                        <br/>
                    </g:each>
                    [<g:message code="wrenches"/>]------------------------------------------------<br/>
                    <g:each in="${bandInstance.wrenches.sort({ it.dateCreated })}" var="wrench">
                        [b]${wrench.name}[/b] ([i]${wrench.number} ${wrench.type}[/i]) [<g:message code="band.gold"
                                                                                                   args="[wrench.cost]"/>]<br/>
                        <g:if test="${wrench.equipment}">- <g:message
                                code="wrench.equipment.label"/> : ${raw(wrench.equipment)}<br/></g:if>
                        <g:if test="${wrench.specialRules}">- <g:message
                                code="wrench.specialRules.label"/> : ${raw(wrench.specialRules)}<br/></g:if>
                        <br/>
                    </g:each>
                    <g:if test="${bandInstance.mavericks.sort({ it.dateCreated })}">
                        [<g:message code="mavericks"/>]-------------------------------------------------<br/>
                        <g:each in="${bandInstance.mavericks}" var="maverick">
                            [b]${maverick.name}[/b] ([i]${maverick.type}[/i]) [<g:message code="band.gold"
                                                                                          args="[maverick.cost]"/>]<br/>
                            <g:if test="${maverick.equipment}">- <g:message
                                    code="warrior.equipment.label"/> : ${raw(maverick.equipment)}<br/></g:if>
                            <g:if test="${maverick.competences}">- <g:message
                                    code="hero.competences.label"/> : ${raw(maverick.competences)}<br/></g:if>
                            <br/>
                        </g:each>
                    </g:if>
                </code>
            </textarea>

        </div>
    </div>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal"><g:message code="close"/></button>
</div>
</body>
</html>