<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="thumbnail pull-right">
            <asset:image src="Mordheim.gif" class="imgband"/>
        </div>

        <div>

            <h1>
                <g:message
                        code="band.end.games"/> <small>${bandInstance.name}</small>
            </h1>

            <hr/>

            <div class="clearfix">&nbsp;</div>
            <ol class="breadcrumb">
                <li class="active"><g:message code="end.howto"/></li>
                <li><g:message code="end.wrenchmen.states"/></li>
                <li><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.gains"/></li>
                <g:if test="${bandInstance.mavericks}">
                    <li><g:message code="end.mavericks.states"/></li>
                </g:if>
                <li><g:message code="end.recap"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12 col-xs-12">
    <g:form action="go" method="POST" data-toggle="validator" class="form-horizontal">
        <g:hiddenField name="band" value="${bandInstance.id}"/>

        <div class="panel panel-default">
            <div class="panel-body">

                <g:set var="step" value="${new Integer(1)}"/>

                <h4>${step++}. <g:message code="end.howto.xp.ref"/></h4><hr/>

                <div class="form-group">

                    <label for="xpRef" class="col-sm-2 control-label"><g:message code="end.xpref"/> *</label>

                    <div class="col-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><span
                                    class="glyphicon glyphicon-info-sign"></span></span>
                            <g:field type="number" name="xpRef" required="" value="1" class="form-control"
                                     min="1" max="5" autofocus=""/>
                        </div>

                        <div class="help-block with-errors">
                            <g:message code="end.xpref.hint"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">

                    <label class="col-sm-2 control-label"><g:message code="your.band.value"/></label>

                    <div class="col-sm-10">
                        <p class="form-control-static"><span class="label label-primary">${bandInstance.bandValue}</span></p>
                    </div>
                </div>&nbsp;

                <h4>${step++}. <g:message code="end.howto.wrench.dices"/></h4><hr/>

                <p><g:message code="end.howto.wrench.dices.text" encodeAs="raw"/></p>&nbsp;

                <h4>${step++}. <g:message code="end.howto.heroes.dices"/></h4><hr/>

                <p><g:message code="end.howto.heroes.dices.text" encodeAs="raw"/></p>&nbsp;

                <h4>${step++}. <g:message code="end.howto.go.next"/></h4>

            </div>

            <div class="panel-footer clearfix">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success  pull-right">
                            <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step', default: 'Save')}
                        </button>

                    </div>
                </div>

            </div>
        </div>
    </g:form>
</div>

</body>
</html>