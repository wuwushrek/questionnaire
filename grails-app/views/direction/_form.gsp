<%@ page import="questionnaire.Direction" %>



<div class="fieldcontain ${hasErrors(bean: directionInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="direction.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" maxlength="30" required="" value="${directionInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: directionInstance, field: 'mdp', 'error')} required">
	<label for="mdp">
		<g:message code="direction.mdp.label" default="Mdp" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mdp" maxlength="25" required="" value="${directionInstance?.mdp}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: directionInstance, field: 'sondages', 'error')} ">
	<label for="sondages">
		<g:message code="direction.sondages.label" default="Sondages" />
		
	</label>
	<g:select name="sondages" from="${questionnaire.Sondage.list()}" multiple="multiple" optionKey="id" size="5" value="${directionInstance?.sondages*.id}" class="many-to-many"/>

</div>

