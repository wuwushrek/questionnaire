<%@ page import="questionnaire.Sondage" %>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <asset:stylesheet src="application.css"/>
  <asset:javascript src="application.js"/>
	<link rel="stylesheet"
	href="${resource(dir:'css',file:'custombutton.css')}" />
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Notes', 'Enregistres'],
          ['1 ', 1],
          ['2 ', 0],
          ['3 ', 0],
          ['4 ', 0],
          ['5 ', 0],
          ['6 ', 0]
        ]);
        var data2 = google.visualization.arrayToDataTable([
          ['Notes', 'Enregistres',{ role: "style" } ],
          ['Note: 1 ', 0,"#b87333"],
          ['Note: 2 ', 0,"silver"],
          ['Note: 3 ', 0,"gold"],
          ['Note: 4 ', 0,"cyan"],
          ['Note: 5 ', 0,"blue"],
          ['Note: 6 ', 0,"orange"]
        ]);
        data2.setValue(0,1,${note1});
        data2.setValue(1,1,${note2});
        data2.setValue(2,1,${note3});
        data2.setValue(3,1,${note4});
        data2.setValue(4,1,${note5});
        data2.setValue(5,1,${note6});
        
        data.setValue(0,1,${note1});
        data.setValue(1,1,${note2});
        data.setValue(2,1,${note3});
        data.setValue(3,1,${note4});
        data.setValue(4,1,${note5});
        data.setValue(5,1,${note6});
        var view = new google.visualization.DataView(data2);
        view.setColumns([0, 1,
                         { calc: "stringify",
                           sourceColumn: 1,
                           type: "string",
                           role: "annotation" },2]);
        var options1 = {
          title: 'Carembert repartition notes',
          slices: {
                    2: {offset: 0.2},
                    5: {offset: 0.1},
          },
          is3D: true,
        };
        var options2 = {
        	title: "Repartition des notes",
            bar: {groupWidth: "95%"},
            legend: { position: 'top', maxLines: 2 },
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        var histo = new google.visualization.BarChart(document.getElementById('histograme'));
        chart.draw(data, options1);
        histo.draw(view,options2);
      }
    </script>
  <title>Statistique sondage ${params.id}</title>
  </head>
  <body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="indexChoix"><g:message code="Accueil Admin" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="sondage" action="create"><g:message code="créer sondage" args="[entityName]" /></g:link></li>
				<li><g:link class="create" controller="sondage" action="edit" resource="${Sondage.findByNom(params.id)}"><g:message code="Modifier sondage" args="[entityName]" /></g:link></li>
			</ul>
		</div>
    <div id="piechart_3d" style="width: 70%; height: 45%;border: 1px solid #0a3c59;float:left;"></div>
    <div style="width: 29%; height: 90%;float:right;">
    <br><br><br><br><br><br><br><br><br><br><br><br>
    	<table border="1" style="text-align:center;margin:auto;">
    		<tr>
    			<th style="background:#FF9933;">Sondages remplis</th>
    			<th style="background:#FF9933;">${enregistre}</th>
    		</tr>
    		<tr>
    			<th style="background:#FF9933;">Moyenne </th>
    			<th style="background:#FF9933;">${moyenne}</th>
    		</tr>
    		<tr>
    			<th style="background:#FF9933;">Variance sondages</th>
    			<th style="background:#FF9933;">${variance}</th>
    		</tr>
    	</table>
    	<br/>
    	<div style="text-align:center;">
    	<g:link controller="direction" action="statSondageEleve">
    		Registre sondages/Eleves
    	</g:link>
    	</div>
    </div>
    <div id="histograme" style="width: 70%; height: 45%;border: 1px solid #0a3c59;float:left;"></div>
    <div class="buttons">
    <g:form  action="index" methode="post">
		<input class="retourbutton" type="submit" value="Listes Sondages">
	</g:form>
	</div>
  </body>
</html>