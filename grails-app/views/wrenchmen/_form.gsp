<%@ page import="com.headbangers.mordheim.Wrenchmen" %>



<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="wrenchmen.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" value="${wrenchmenInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'competences', 'error')} ">
	<label for="competences">
		<g:message code="wrenchmen.competences.label" default="Competences" />
		
	</label>
	<g:textArea name="competences" cols="40" rows="5" value="${wrenchmenInstance?.competences}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'injuries', 'error')} ">
	<label for="injuries">
		<g:message code="wrenchmen.injuries.label" default="Injuries" />
		
	</label>
	<g:textArea name="injuries" cols="40" rows="5" value="${wrenchmenInstance?.injuries}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'equipment', 'error')} ">
	<label for="equipment">
		<g:message code="wrenchmen.equipment.label" default="Equipment" />
		
	</label>
	<g:textArea name="equipment" cols="40" rows="5" value="${wrenchmenInstance?.equipment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'experience', 'error')} required">
	<label for="experience">
		<g:message code="wrenchmen.experience.label" default="Experience" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="experience" type="number" value="${wrenchmenInstance.experience}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="wrenchmen.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${wrenchmenInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="wrenchmen.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${wrenchmenInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="wrenchmen.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${wrenchmenInstance.number}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'CC', 'error')} required">
	<label for="CC">
		<g:message code="wrenchmen.CC.label" default="CC" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="CC" type="number" value="${wrenchmenInstance.CC}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'CD', 'error')} required">
	<label for="CD">
		<g:message code="wrenchmen.CD.label" default="CD" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="CD" type="number" value="${wrenchmenInstance.CD}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'CT', 'error')} required">
	<label for="CT">
		<g:message code="wrenchmen.CT.label" default="CT" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="CT" type="number" value="${wrenchmenInstance.CT}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'PV', 'error')} required">
	<label for="PV">
		<g:message code="wrenchmen.PV.label" default="PV" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="PV" type="number" value="${wrenchmenInstance.PV}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'a', 'error')} required">
	<label for="a">
		<g:message code="wrenchmen.a.label" default="A" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="a" type="number" value="${wrenchmenInstance.a}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'e', 'error')} required">
	<label for="e">
		<g:message code="wrenchmen.e.label" default="E" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="e" type="number" value="${wrenchmenInstance.e}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'f', 'error')} required">
	<label for="f">
		<g:message code="wrenchmen.f.label" default="F" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="f" type="number" value="${wrenchmenInstance.f}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'i', 'error')} required">
	<label for="i">
		<g:message code="wrenchmen.i.label" default="I" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="i" type="number" value="${wrenchmenInstance.i}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: wrenchmenInstance, field: 'm', 'error')} required">
	<label for="m">
		<g:message code="wrenchmen.m.label" default="M" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="m" type="number" value="${wrenchmenInstance.m}" required=""/>

</div>

