
<%@ page import="com.headbangers.mordheim.Wrenchmen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wrenchmen.label', default: 'Wrenchmen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-wrenchmen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-wrenchmen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="note" title="${message(code: 'wrenchmen.note.label', default: 'Note')}" />
					
						<g:sortableColumn property="competences" title="${message(code: 'wrenchmen.competences.label', default: 'Competences')}" />
					
						<g:sortableColumn property="injuries" title="${message(code: 'wrenchmen.injuries.label', default: 'Injuries')}" />
					
						<g:sortableColumn property="equipment" title="${message(code: 'wrenchmen.equipment.label', default: 'Equipment')}" />
					
						<g:sortableColumn property="experience" title="${message(code: 'wrenchmen.experience.label', default: 'Experience')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'wrenchmen.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wrenchmenInstanceList}" status="i" var="wrenchmenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${wrenchmenInstance.id}">${fieldValue(bean: wrenchmenInstance, field: "note")}</g:link></td>
					
						<td>${fieldValue(bean: wrenchmenInstance, field: "competences")}</td>
					
						<td>${fieldValue(bean: wrenchmenInstance, field: "injuries")}</td>
					
						<td>${fieldValue(bean: wrenchmenInstance, field: "equipment")}</td>
					
						<td>${fieldValue(bean: wrenchmenInstance, field: "experience")}</td>
					
						<td>${fieldValue(bean: wrenchmenInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wrenchmenInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
