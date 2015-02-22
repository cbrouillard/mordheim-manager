<%@ page import="com.headbangers.mordheim.Band" %>



<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="band.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" value="${bandInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'gold', 'error')} required">
	<label for="gold">
		<g:message code="band.gold.label" default="Gold" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gold" type="number" value="${bandInstance.gold}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'magicalStones', 'error')} required">
	<label for="magicalStones">
		<g:message code="band.magicalStones.label" default="Magical Stones" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="magicalStones" type="number" value="${bandInstance.magicalStones}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="band.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${bandInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'reserve', 'error')} ">
	<label for="reserve">
		<g:message code="band.reserve.label" default="Reserve" />
		
	</label>
	<g:textArea name="reserve" cols="40" rows="5" value="${bandInstance?.reserve}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'heroes', 'error')} ">
	<label for="heroes">
		<g:message code="band.heroes.label" default="Heroes" />
		
	</label>
	<g:select name="heroes" from="${com.headbangers.mordheim.Hero.list()}" multiple="multiple" optionKey="id" size="5" value="${bandInstance?.heroes*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="band.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${bandInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'wrenches', 'error')} ">
	<label for="wrenches">
		<g:message code="band.wrenches.label" default="Wrenches" />
		
	</label>
	<g:select name="wrenches" from="${com.headbangers.mordheim.Wrenchmen.list()}" multiple="multiple" optionKey="id" size="5" value="${bandInstance?.wrenches*.id}" class="many-to-many"/>

</div>

