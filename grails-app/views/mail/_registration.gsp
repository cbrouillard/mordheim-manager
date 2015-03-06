<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:message code="app.name"/></title>
</head>

<body>
<g:message code="registration.email.body" args="[person.username]"/><br/>
<g:link controller="person" action="validate" absolute="true" params="[token:person.token]" id="${person.id}">
${createLink(controller: 'person', action:'validate', absolute: true, params: [token:person.token], id:person.id)}
</g:link>

</body>
</html>