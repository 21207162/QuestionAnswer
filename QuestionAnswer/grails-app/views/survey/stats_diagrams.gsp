
<%@ page import="questionanswer.Survey" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'survey.label', default: 'Survey')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
    <body>
		<a href="${createLink(controller:'Survey', action:'list')}" ><< Go to survey list</a>
    	<h3 style="text-align:center;color:black">The right answer was <span style="font-weight:bold;color:red">${ rightAnswer } </span>!</h3><br/>
    	 <!--Div that will hold the pie chart-->
    	<div id="chart_div" style="background-color:rgb(247, 247, 247)"></div>
    	<div id="chart_div_2" style="background-color:blue"></div>
 
	</body>
</html>
