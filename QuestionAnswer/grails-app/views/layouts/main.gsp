<%@ page import="questionanswer.Survey" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
		<title>QuestionAnswer</title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'demo.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style_app.css')}" type="text/css">
        <script type="text/javascript" src="../js/script.js"></script>
        <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
       function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Answer');
        data.addColumn('number', 'NbVotes');
        data.addRows(${listStats});
        
        // Set chart options
        var options = {'title':'Percentage per answer',
                       'width':830,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
       function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Answer');
        data.addColumn('number', 'NbVotes');
        data.addRows(${listGlobalStats});
        
        // Set chart options
        var options = {'title':'Percentage right/wrong answer',
                       'width':830,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div_2'));
        chart.draw(data, options);
      }
    </script>
    </head>
    <body>
	<div id="header">
		<div id="header-menu">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><img src="${resource(dir: 'images/skin', file: 'house.png')}" alt="Grails"/></a></li>
				<g:if test="${session.user}">
					<li><span>Login as ${session.user}</span> <g:link controller="User" action="logOut">(Logout)</g:link></li>
				</g:if>		
			</ul>
		</div>
		<div id="time">
			<script>
				dT();
			</script>
		</div>
	</div>
	<div class="container">
            <section>				
                <div id="container_demo" >
                    <div id="wrapper">
	                    <div id="body_structure">
	                    <h1><a href="http://localhost:8080/QuestionAnswer"><img src="${resource(dir: 'images', file: 'logoQA.png')}" alt="Grails"/></a></h1>
	                    <g:layoutBody/>	
	                    </div>
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>
