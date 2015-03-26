<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="thumbnail pull-right">
            <asset:image src="Mordheim.gif" class="imgband"/>
        </div>

        <div>

            <h1>
                <g:message
                        code="band.show"/> <small>${bandInstance.name}</small>
            </h1>

            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="clearfix">&nbsp;</div>

            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12 col-xs-12">

    <div class="panel panel-default">
        <div class="panel-heading clearfix">
            <h5><g:message code="bbcode.copy.that"/></h5>
        </div>

        <div class="panel-body">

            <code>
                [b]${bandInstance.name}[/b] ([i]${bandInstance.type}[/i])<br/>
                [<g:message code="heroes"/>]---------------------------------------------------------<br/>
                <g:each in="${bandInstance.heroes}" var="hero">
                    [b]${hero.name}[/b] ([i]${hero.type}[/i]) [<g:message code="band.gold" args="[hero.cost]"/>]<br/>
                    - <g:message code="hero.equipment.label"/> : ${raw(hero.equipment)}<br/>
                    - <g:message code="hero.competences.label"/> : ${raw(hero.competences)}<br/>
                    <br/>
                </g:each>
                [<g:message code="wrenches"/>]------------------------------------------------<br/>
                <g:each in="${bandInstance.wrenches}" var="wrench">
                    [b]${wrench.name}[/b] ([i]${wrench.number} ${wrench.type}[/i]) [<g:message code="band.gold" args="[wrench.cost]"/>]<br/>
                    - <g:message code="wrench.equipment.label"/> : ${raw(wrench.equipment)}<br/>
                    - <g:message code="wrench.specialRules.label"/> : ${raw(wrench.competences)}<br/>
                    <br/>
                </g:each>
                <g:if test="${bandInstance.mavericks}">
                    [<g:message code="mavericks"/>]-------------------------------------------------<br/>
                    <g:each in="${bandInstance.mavericks}" var="maverick">
                        [b]${maverick.name}[/b] ([i]${maverick.type}[/i]) [<g:message code="band.gold" args="[maverick.cost]"/>]<br/>
                        - <g:message code="hero.equipment.label"/> : ${raw(maverick.equipment)}<br/>
                        - <g:message code="hero.competences.label"/> : ${raw(maverick.competences)}<br/>
                        <br/>
                    </g:each>
                </g:if>
            </code>

        </div>

        <div class="panel-footer clearfix">

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 ">

                    <g:link action="show" controller="band" id="${bandInstance.id}" class="btn btn-default">
                        <span class="glyphicon glyphicon-backward"></span> ${message(code: 'back', default: 'Back')}
                    </g:link>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>