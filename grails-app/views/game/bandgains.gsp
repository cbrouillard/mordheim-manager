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
                <li><g:message code="end.wrenchmen.states"/></li>
                <li><g:message code="end.heroes.states"/></li>
                <li class="active"><g:message code="end.gains"/></li>
                <g:if test="${bandInstance.mavericks}">
                    <li><g:message code="end.mavericks.states"/></li>
                </g:if>
                <li><g:message code="end.recap"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${raw(flash.message)}</div>
        </g:if>
    </div>
</div>

<div class="col-xs-12">

    <g:form action="savebandgains" method="POST" data-toggle="validator"><g:hiddenField name="band"
                                                                                        value="${bandInstance.id}"/>
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">

                    <div class="form-group ${hasErrors(bean: bandInstance, field: 'gold', 'has-error')}">

                        <label for="gold" class="col-sm-2 control-label"><g:message code="band.earned.gold.title"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-plus"></span></span>
                                <g:field type="number" name="gold" class="form-control" value="0" min="0"/>
                            </div>

                            <div class="help-block with-errors"><g:message code="band.earned.gold.hint"/></div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: bandInstance, field: 'magicalStones', 'has-error')}">

                        <label for="magicalStones" class="col-sm-2 control-label"><g:message
                                code="band.earned.magical.stones.title"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-plus"></span></span>
                                <g:field type="number" name="magicalStones" value="0"
                                         class="form-control" min="0" />
                            </div>

                            <div class="help-block with-errors">
                                <g:message
                                        code="band.earned.magical.stones.hint"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: bandInstance, field: 'reserve', 'has-error')}">

                        <label for="reserve" class="col-sm-2 control-label"><g:message code="reserve.label"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-scissors"></span></span>
                                <g:textArea name="reserve" cols="40" rows="5" value="${bandInstance?.reserve}"
                                            class="form-control editor"/>
                            </div>

                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    <div class="form-group ${hasErrors(bean: bandInstance, field: 'note', 'has-error')}">

                        <label for="note" class="col-sm-2 control-label"><g:message code="note.label"
                                                                                    default="note"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-edit"></span></span>

                                <g:textArea name="note" cols="40" rows="5" value="${bandInstance?.note}"
                                            class="form-control editor"/>
                            </div>

                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                </fieldset>

            </div>

            <div class="panel-footer clearfix">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">

                        <button type="submit" class="btn btn-success pull-right">
                            <span class="glyphicon glyphicon-forward"></span> ${message(code: 'recap', default: 'Save')}
                        </button>

                    </div>
                </div>
            </div>

        </div>

    </g:form>

</div>

</body>
</html>