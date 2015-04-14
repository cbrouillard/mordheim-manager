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

    <script src="${resource(dir: 'js/tinymce', file: 'tinymce.min.js')}"></script>
    <script>
        tinymce.init({
            selector: 'textarea.editor',
            plugins: "textcolor",
            toolbar: "fontsizeselect | bullist numlist | bold italic underline | forecolor backcolor",
            menubar: false, statusbar: false,
            fontsize_formats: "6pt 7pt 8pt 9pt 10pt 11pt 12pt",
            language: '${message(code:'tinymce.lang', default: 'en_GB')}'});
    </script>
    <link rel="stylesheet" href="${resource(dir: 'css/fa/css', file: 'font-awesome.min.css')}"/>

    <g:layoutHead/>
</head>

<body>

<g:layoutBody/>

</body>
</html>
