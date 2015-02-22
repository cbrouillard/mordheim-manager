
<%@ page import="com.headbangers.mordheim.Wrenchmen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wrenchmen.label', default: 'Wrenchmen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wrenchmen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wrenchmen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wrenchmen">
			
				<g:if test="${wrenchmenInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="wrenchmen.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${wrenchmenInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.competences}">
				<li class="fieldcontain">
					<span id="competences-label" class="property-label"><g:message code="wrenchmen.competences.label" default="Competences" /></span>
					
						<span class="property-value" aria-labelledby="competences-label"><g:fieldValue bean="${wrenchmenInstance}" field="competences"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.injuries}">
				<li class="fieldcontain">
					<span id="injuries-label" class="property-label"><g:message code="wrenchmen.injuries.label" default="Injuries" /></span>
					
						<span class="property-value" aria-labelledby="injuries-label"><g:fieldValue bean="${wrenchmenInstance}" field="injuries"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.equipment}">
				<li class="fieldcontain">
					<span id="equipment-label" class="property-label"><g:message code="wrenchmen.equipment.label" default="Equipment" /></span>
					
						<span class="property-value" aria-labelledby="equipment-label"><g:fieldValue bean="${wrenchmenInstance}" field="equipment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.experience}">
				<li class="fieldcontain">
					<span id="experience-label" class="property-label"><g:message code="wrenchmen.experience.label" default="Experience" /></span>
					
						<span class="property-value" aria-labelledby="experience-label"><g:fieldValue bean="${wrenchmenInstance}" field="experience"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="wrenchmen.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${wrenchmenInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="wrenchmen.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${wrenchmenInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.number}">
				<li class="fieldcontain">
					<span id="number-label" class="property-label"><g:message code="wrenchmen.number.label" default="Number" /></span>
					
						<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${wrenchmenInstance}" field="number"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.CC}">
				<li class="fieldcontain">
					<span id="CC-label" class="property-label"><g:message code="wrenchmen.CC.label" default="CC" /></span>
					
						<span class="property-value" aria-labelledby="CC-label"><g:fieldValue bean="${wrenchmenInstance}" field="CC"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.CD}">
				<li class="fieldcontain">
					<span id="CD-label" class="property-label"><g:message code="wrenchmen.CD.label" default="CD" /></span>
					
						<span class="property-value" aria-labelledby="CD-label"><g:fieldValue bean="${wrenchmenInstance}" field="CD"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.CT}">
				<li class="fieldcontain">
					<span id="CT-label" class="property-label"><g:message code="wrenchmen.CT.label" default="CT" /></span>
					
						<span class="property-value" aria-labelledby="CT-label"><g:fieldValue bean="${wrenchmenInstance}" field="CT"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.PV}">
				<li class="fieldcontain">
					<span id="PV-label" class="property-label"><g:message code="wrenchmen.PV.label" default="PV" /></span>
					
						<span class="property-value" aria-labelledby="PV-label"><g:fieldValue bean="${wrenchmenInstance}" field="PV"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.a}">
				<li class="fieldcontain">
					<span id="a-label" class="property-label"><g:message code="wrenchmen.a.label" default="A" /></span>
					
						<span class="property-value" aria-labelledby="a-label"><g:fieldValue bean="${wrenchmenInstance}" field="a"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="wrenchmen.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${wrenchmenInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.e}">
				<li class="fieldcontain">
					<span id="e-label" class="property-label"><g:message code="wrenchmen.e.label" default="E" /></span>
					
						<span class="property-value" aria-labelledby="e-label"><g:fieldValue bean="${wrenchmenInstance}" field="e"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.f}">
				<li class="fieldcontain">
					<span id="f-label" class="property-label"><g:message code="wrenchmen.f.label" default="F" /></span>
					
						<span class="property-value" aria-labelledby="f-label"><g:fieldValue bean="${wrenchmenInstance}" field="f"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.i}">
				<li class="fieldcontain">
					<span id="i-label" class="property-label"><g:message code="wrenchmen.i.label" default="I" /></span>
					
						<span class="property-value" aria-labelledby="i-label"><g:fieldValue bean="${wrenchmenInstance}" field="i"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="wrenchmen.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${wrenchmenInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${wrenchmenInstance?.m}">
				<li class="fieldcontain">
					<span id="m-label" class="property-label"><g:message code="wrenchmen.m.label" default="M" /></span>
					
						<span class="property-value" aria-labelledby="m-label"><g:fieldValue bean="${wrenchmenInstance}" field="m"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:wrenchmenInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${wrenchmenInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
