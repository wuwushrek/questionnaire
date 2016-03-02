<%@ page import="questionnaire.Sondage" %>



<div class="fieldcontain ${hasErrors(bean: sondageInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="sondage.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="30" required="" value="${sondageInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sondageInstance, field: 'fin', 'error')} required">
	<label for="fin">
		<g:message code="sondage.fin.label" default="Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fin" precision="minute"  value="${sondageInstance?.fin}"  />

</div>


