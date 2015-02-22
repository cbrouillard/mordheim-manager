<%@ page import="com.headbangers.mordheim.Hero" %>



<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="hero.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" value="${heroInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'competences', 'error')} ">
	<label for="competences">
		<g:message code="hero.competences.label" default="Competences" />
		
	</label>
	<g:textArea name="competences" cols="40" rows="5" value="${heroInstance?.competences}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'injuries', 'error')} ">
	<label for="injuries">
		<g:message code="hero.injuries.label" default="Injuries" />
		
	</label>
	<g:textArea name="injuries" cols="40" rows="5" value="${heroInstance?.injuries}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'equipment', 'error')} ">
	<label for="equipment">
		<g:message code="hero.equipment.label" default="Equipment" />
		
	</label>
	<g:textArea name="equipment" cols="40" rows="5" value="${heroInstance?.equipment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'experience', 'error')} required">
	<label for="experience">
		<g:message code="hero.experience.label" default="Experience" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="experience" type="number" value="${heroInstance.experience}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="hero.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${heroInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="hero.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${heroInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'CC', 'error')} required">
	<label for="CC">
		<g:message code="hero.CC.label" default="CC" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="CC" type="number" value="${heroInstance.CC}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'CD', 'error')} required">
	<label for="CD">
		<g:message code="hero.CD.label" default="CD" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="CD" type="number" value="${heroInstance.CD}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'CT', 'error')} required">
	<label for="CT">
		<g:message code="hero.CT.label" default="CT" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="CT" type="number" value="${heroInstance.CT}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'PV', 'error')} required">
	<label for="PV">
		<g:message code="hero.PV.label" default="PV" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="PV" type="number" value="${heroInstance.PV}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'a', 'error')} required">
	<label for="a">
		<g:message code="hero.a.label" default="A" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="a" type="number" value="${heroInstance.a}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'e', 'error')} required">
	<label for="e">
		<g:message code="hero.e.label" default="E" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="e" type="number" value="${heroInstance.e}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'f', 'error')} required">
	<label for="f">
		<g:message code="hero.f.label" default="F" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="f" type="number" value="${heroInstance.f}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'i', 'error')} required">
	<label for="i">
		<g:message code="hero.i.label" default="I" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="i" type="number" value="${heroInstance.i}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: heroInstance, field: 'm', 'error')} required">
	<label for="m">
		<g:message code="hero.m.label" default="M" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="m" type="number" value="${heroInstance.m}" required=""/>

</div>

