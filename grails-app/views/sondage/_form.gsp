<%@ page import="questionnaire.Sondage" %>



<div class="fieldcontain ${hasErrors(bean: sondageInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="sondage.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="30" required="" value="${sondageInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sondageInstance, field: 'debut', 'error')} required">
	<label for="debut">
		<g:message code="sondage.debut.label" default="Debut" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="debut" precision="minute"  value="${sondageInstance?.debut}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: sondageInstance, field: 'fin', 'error')} required">
	<label for="fin">
		<g:message code="sondage.fin.label" default="Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fin" precision="minute"  value="${sondageInstance?.fin}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: sondageInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="sondage.note.label" default="Note" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sondageInstance?.note?}" var="n">
    <li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="note" action="create" params="['sondage.id': sondageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}</g:link>
</li>
</ul>


</div>

