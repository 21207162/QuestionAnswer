<%@ page import="questionanswer.Survey" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
		<title>QuestionAnswer</title>
        <link rel="stylesheet" type="text/css" href="../css/demo.css" />
        <link rel="stylesheet" type="text/css" href="../css/style_app.css" />
        <script type="text/javascript" src="../js/script.js"></script>
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
