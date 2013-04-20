<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <title>QuestionAnswer</title>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style_home.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form" >
                                <h1><a href="http://localhost:8080/QuestionAnswer"><img src="${resource(dir: 'images', file: 'logoQA.png')}" alt="Grails"/></a></h1>

                                <div class="access_button"> 
									<a class="access" href="${createLink(controller:'Survey', action:'index')}">Acces to application</a>
								</div>
								<g:if test="${session.user}">
									<div align=center style="margin-bottom:10px;">Login as ${session.user} <g:link controller="User" action="logOut">(Logout)</g:link></div>
								</g:if>
                                <p class="change_link">
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                        </div>
                        <div id="register" class="animate form">
                            <g:form controller="User" action="save" method="post" autocomplete="on">
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your name</label>
                                    <input id="usernamesignup" name="namesignup" required="required" type="text" placeholder="Your name" />
                                </p>
                                <p> 
                                    <label for="forenamesignup" class="uname" data-icon="e" > Your forename</label>
                                    <input id="forenamesignup" name="forenamesignup" required="required" type="text" placeholder="Your forename"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="Enter your password"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="Confirm your password"/>
                                </p>
                                <p class="signin button">
									<input name="create" class="save" type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="${createLink(controller:'Survey', action:'index')}" class="to_register">Log in </a>
								</p>
                            </g:form>
                        </div>				
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>
