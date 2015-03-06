<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="app.name"/></title>
</head>

<body>
<g:message code="new.registration.validated.email.body" args="[person.username]"/><br/>
<g:link controller="person" action="index" absolute="true">
    ${createLink(controller: 'person', action:'index', absolute: true)}
</g:link>

</body>
</html>