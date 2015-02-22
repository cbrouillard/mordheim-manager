
<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'band.label', default: 'Band')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-band" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-band" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list band">
			
				<g:if test="${bandInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="band.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${bandInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.gold}">
				<li class="fieldcontain">
					<span id="gold-label" class="property-label"><g:message code="band.gold.label" default="Gold" /></span>
					
						<span class="property-value" aria-labelledby="gold-label"><g:fieldValue bean="${bandInstance}" field="gold"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.magicalStones}">
				<li class="fieldcontain">
					<span id="magicalStones-label" class="property-label"><g:message code="band.magicalStones.label" default="Magical Stones" /></span>
					
						<span class="property-value" aria-labelledby="magicalStones-label"><g:fieldValue bean="${bandInstance}" field="magicalStones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="band.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bandInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.reserve}">
				<li class="fieldcontain">
					<span id="reserve-label" class="property-label"><g:message code="band.reserve.label" default="Reserve" /></span>
					
						<span class="property-value" aria-labelledby="reserve-label"><g:fieldValue bean="${bandInstance}" field="reserve"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="band.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bandInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.heroes}">
				<li class="fieldcontain">
					<span id="heroes-label" class="property-label"><g:message code="band.heroes.label" default="Heroes" /></span>
					
						<g:each in="${bandInstance.heroes}" var="h">
						<span class="property-value" aria-labelledby="heroes-label"><g:link controller="hero" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="band.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bandInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="band.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${bandInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bandInstance?.wrenches}">
				<li class="fieldcontain">
					<span id="wrenches-label" class="property-label"><g:message code="band.wrenches.label" default="Wrenches" /></span>
					
						<g:each in="${bandInstance.wrenches}" var="w">
						<span class="property-value" aria-labelledby="wrenches-label"><g:link controller="wrenchmen" action="show" id="${w.id}">${w?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bandInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bandInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
