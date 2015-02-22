
<%@ page import="com.headbangers.mordheim.Hero" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hero.label', default: 'Hero')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hero" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hero" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hero">
			
				<g:if test="${heroInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="hero.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${heroInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.competences}">
				<li class="fieldcontain">
					<span id="competences-label" class="property-label"><g:message code="hero.competences.label" default="Competences" /></span>
					
						<span class="property-value" aria-labelledby="competences-label"><g:fieldValue bean="${heroInstance}" field="competences"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.injuries}">
				<li class="fieldcontain">
					<span id="injuries-label" class="property-label"><g:message code="hero.injuries.label" default="Injuries" /></span>
					
						<span class="property-value" aria-labelledby="injuries-label"><g:fieldValue bean="${heroInstance}" field="injuries"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.equipment}">
				<li class="fieldcontain">
					<span id="equipment-label" class="property-label"><g:message code="hero.equipment.label" default="Equipment" /></span>
					
						<span class="property-value" aria-labelledby="equipment-label"><g:fieldValue bean="${heroInstance}" field="equipment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.experience}">
				<li class="fieldcontain">
					<span id="experience-label" class="property-label"><g:message code="hero.experience.label" default="Experience" /></span>
					
						<span class="property-value" aria-labelledby="experience-label"><g:fieldValue bean="${heroInstance}" field="experience"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="hero.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${heroInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="hero.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${heroInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.CC}">
				<li class="fieldcontain">
					<span id="CC-label" class="property-label"><g:message code="hero.CC.label" default="CC" /></span>
					
						<span class="property-value" aria-labelledby="CC-label"><g:fieldValue bean="${heroInstance}" field="CC"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.CD}">
				<li class="fieldcontain">
					<span id="CD-label" class="property-label"><g:message code="hero.CD.label" default="CD" /></span>
					
						<span class="property-value" aria-labelledby="CD-label"><g:fieldValue bean="${heroInstance}" field="CD"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.CT}">
				<li class="fieldcontain">
					<span id="CT-label" class="property-label"><g:message code="hero.CT.label" default="CT" /></span>
					
						<span class="property-value" aria-labelledby="CT-label"><g:fieldValue bean="${heroInstance}" field="CT"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.PV}">
				<li class="fieldcontain">
					<span id="PV-label" class="property-label"><g:message code="hero.PV.label" default="PV" /></span>
					
						<span class="property-value" aria-labelledby="PV-label"><g:fieldValue bean="${heroInstance}" field="PV"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.a}">
				<li class="fieldcontain">
					<span id="a-label" class="property-label"><g:message code="hero.a.label" default="A" /></span>
					
						<span class="property-value" aria-labelledby="a-label"><g:fieldValue bean="${heroInstance}" field="a"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="hero.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${heroInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.e}">
				<li class="fieldcontain">
					<span id="e-label" class="property-label"><g:message code="hero.e.label" default="E" /></span>
					
						<span class="property-value" aria-labelledby="e-label"><g:fieldValue bean="${heroInstance}" field="e"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.f}">
				<li class="fieldcontain">
					<span id="f-label" class="property-label"><g:message code="hero.f.label" default="F" /></span>
					
						<span class="property-value" aria-labelledby="f-label"><g:fieldValue bean="${heroInstance}" field="f"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.i}">
				<li class="fieldcontain">
					<span id="i-label" class="property-label"><g:message code="hero.i.label" default="I" /></span>
					
						<span class="property-value" aria-labelledby="i-label"><g:fieldValue bean="${heroInstance}" field="i"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="hero.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${heroInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${heroInstance?.m}">
				<li class="fieldcontain">
					<span id="m-label" class="property-label"><g:message code="hero.m.label" default="M" /></span>
					
						<span class="property-value" aria-labelledby="m-label"><g:fieldValue bean="${heroInstance}" field="m"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:heroInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${heroInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
