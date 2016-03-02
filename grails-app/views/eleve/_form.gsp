<%@ page import="questionnaire.Eleve" %>


<div class="fieldcontain ${hasErrors(bean: eleveInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="eleve.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${eleveInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eleveInstance, field: 'mdp', 'error')} required">
	<label for="mdp">
		<g:message code="eleve.mdp.label" default="Mot de passe" />
		<span class="required-indicator">*</span>
	</label>
	<input name="mdp" type="password" value="${eleveInstance?.mdp}"/>

</div>
<div class="fieldcontain ${hasErrors(bean: eleveInstance, field: 'mdp', 'error')} required">
	<label for="mdp">
		<g:message code="eleve.mdp.label" default="Confirmer mot de passe" />
		<span class="required-indicator">*</span>
	</label>
	<input type="password" name="mdp2" value="${eleveInstance?.mdp}"/>
</div>



