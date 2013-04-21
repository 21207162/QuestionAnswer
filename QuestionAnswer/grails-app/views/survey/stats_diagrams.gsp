
<%@ page import="questionanswer.Survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
    <body>
    	<h3 style="text-align:center;color:black">The right answer was <span style="font-weight:bold;color:red">${ rightAnswer } </span>!</h3><br/>
    	 <!--Div that will hold the pie chart-->
    	<div id="chart_div"></div>
    	<div id="chart_div_2"></div>
	</body>
</html>
