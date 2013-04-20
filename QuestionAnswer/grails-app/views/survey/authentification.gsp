<!DOCTYPE html>
    <head>
        <meta charset="UTF-8" />
        <title>QuestionAnswer</title>
        <link rel="stylesheet" type="text/css" href="../css/demo.css" />
        <link rel="stylesheet" type="text/css" href="../css/style_home.css" />
		<link rel="stylesheet" type="text/css" href="../css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form" >
                            <g:form controller="User" action="logIn" method="post"autocomplete="on"> 
                                <h1>Log in</h1> 
                                <g:if test="${flash.message}">
									<div class="message" role="status">${flash.message}</div>
								</g:if>
                                <p> 
                                    <label for="username" class="uname" data-icon="u" >User name</label>
                                    <input id="username" name="name" required="required" type="text" placeholder="Your name"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="Enter your password" /> 
                                </p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									<a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
								</p>
                            </g:form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>
