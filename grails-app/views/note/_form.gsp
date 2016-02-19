<%@ page import="questionnaire.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="note.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="note" type="number" min="1" max="6" value="${noteInstance.note}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'sondage', 'error')} required">
	<label for="sondage">
		<g:message code="note.sondage.label" default="Sondage" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sondage" name="sondage.id" from="${questionnaire.Sondage.list()}" optionKey="id" required="" value="${noteInstance?.sondage?.id}" class="many-to-one"/>

</div>

