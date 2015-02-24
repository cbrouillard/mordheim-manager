<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div>
            <h1><g:message
                    code="band.show"/> <small>${bandInstance.name}</small>
            </h1>
            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-4 col-xs-12">

    <div class="panel panel-info">
        <div class="panel-heading">

            <div class="form-inline pull-right">
                <g:form url="[resource: bandInstance, action: 'delete']" method="DELETE"
                        class="form-inline pull-right">
                    <div class="btn-group">
                        <g:link class="btn btn-success" controller="band" action="edit" id="${bandInstance.id}">
                            <span class="glyphicon glyphicon-edit"></span>
                        </g:link>
                        <button type="submit" class="btn btn-danger"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <span class="glyphicon glyphicon-trash"></span> ${message(code: 'default.button.delete.label', default: 'Delete')}
                        </button>
                    </div>
                </g:form>
            </div>
            <h5><g:message code="band.infos"/></h5>

        </div>

        <table class="table">
            <tr>
                <td><strong><g:message code="band.name.label"/></strong></td>
                <td>${bandInstance.name}</td>
            </tr>
            <tr>
                <td><strong><g:message code="band.type.label"/></strong></td>
                <td>${bandInstance.type}</td>
            </tr>
            <tr>
                <td><strong><g:message code="date.created.label"/></strong></td>
                <td><g:formatDate formatName="date.format.short" date="${bandInstance.dateCreated}"/></td>
            </tr>
            <tr>
                <td><strong><g:message code="band.note.label"/></strong></td>
                <td><div class="well">${bandInstance.note}</div></td>
            </tr>
        </table>
    </div>

</div>

<div class="col-sm-8 col-xs-12">

    <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#heroes" role="tab" data-toggle="tab">
                    <g:message code="heroes"/>
                </a>
            </li>
            <li role="presentation">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <g:message code="wrenches"/>
                </a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="heroes">
                <br/>

                <g:each in="${bandInstance.heroes}" var="hero">
                    <div class="panel panel-default">

                    </div>
                </g:each>

            </div>

            <div role="tabpanel" class="tab-pane" id="wrenches">
                <br/>

            </div>
        </div>

    </div>

</div>
</body>
</html>
