<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:message code="app.title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: 'textarea.editor',
            plugins: "textcolor",
            toolbar: "fontsizeselect | bullist numlist | bold italic underline | forecolor backcolor",
            menubar: false, statusbar: false,
            fontsize_formats: "6pt 7pt 8pt 9pt 10pt 11pt 12pt"});
    </script>
    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar-collapse-1">
                <span class="sr-only">Toggle</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <g:link controller="band" action="index" class="navbar-brand" style="vertical-align:middle;">
                <g:message code="app.name"/></g:link>

        </div>

        <div class="collapse navbar-collapse" id="navbar-collapse-1">

            <ul class="nav navbar-nav">

                <sec:ifLoggedIn>
                    <li><g:link controller="band" action="index"><span
                            class="glyphicon glyphicon-list-alt"></span> <g:message code="band.list"/></g:link>
                    </li>

                    <li><g:link controller="mordGroup" action="index"><span
                            class="glyphicon glyphicon-star"></span> <g:message code="buddies"/></g:link>
                    </li>

                    <li><g:link controller="person" action="myprofile"><span
                            class="glyphicon glyphicon-user"></span> <g:message code="my.profile"/></g:link>
                    </li>

                    <li><g:link controller="logout" class="logout"><span
                            class="glyphicon glyphicon-log-out"></span> <g:message code="logout"/></g:link>
                    </li>
                </sec:ifLoggedIn>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <sec:ifSwitched>
                    <li>
                        <a href='${request.contextPath}/j_spring_security_exit_user'>
                            <span class="label label-danger"><g:message code="as.admin"
                                                                        args="[sec.loggedInUserInfo(field: 'username')]"/></span>
                            <span class="label label-danger"><g:message
                                    code="admin.resume.as" args="[sec.switchedUserOriginalUsername()]"/></span>

                        </a>
                    </li>
                </sec:ifSwitched>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li>
                        <g:link controller="admin">
                            <span class="glyphicon glyphicon-cog"></span>
                            <g:message code="admin.console"/>
                        </g:link>
                    </li>
                </sec:ifAllGranted>
            </ul>

        </div>

    </div>
</nav>

<div class="container-fluid">
    <g:layoutBody/>
</div>

<footer>
    <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <div class="container-fluid clearfix">

            <p class="navbar-text pull-left">© BROUILLARD Cyril - 2015 <g:message
                    code="app.name"/></p>

            <div class="navbar-text pull-right dons">

                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                    <input type="hidden" name="cmd" value="_s-xclick">
                    <input type="hidden" name="encrypted"
                           value="-----BEGIN PKCS7-----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-----END PKCS7-----">
                    <input type="image" src="${resource(dir: 'images', file: 'btn_donate_SM.png')}" border="0"
                           name="submit"
                           alt="PayPal - la solution de paiement en ligne la plus simple et la plus sécurisée !">
                    <img alt="" border="0" src="https://www.paypalobjects.com/fr_FR/i/scr/pixel.gif" width="1"
                         height="1">
                </form>

            </div>

        </div>
    </nav>
</footer>

</body>
</html>
