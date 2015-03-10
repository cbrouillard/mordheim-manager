<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
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
                <li class="active"><g:message code="end.wrenchmen.states"/></li>
                <li><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.wrenchment.xp"/></li>
                <li><g:message code="end.heroes.xp"/></li>
                <li><g:message code="end.gains"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12 col-xs-12">
    <div class="row">

        <g:each in="${bandInstance.wrenches?.sort({ it.dateCreated })}" var="wrenchgroup">
            <div class="col-sm-6 col-xs-12">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-4">
                                <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                                <h5><strong>${wrenchgroup.name}</strong></h5>
                                <span class="label label-default pull-left">${wrenchgroup.number} ${wrenchgroup.type}</span>
                            </div>
                        </div>
                    </div>

                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                <g:set var="i" value="${new Integer(0)}"/>
                                <g:while test="${i < wrenchgroup.number}">
                                    <tr>
                                        <td>
                                            <span class="label label-warning">${wrenchgroup.type} #${i + 1}</span>
                                        </td>
                                        <td><g:message code="experience.current" args="[wrenchgroup.fullXp]"/></td>
                                        <td class="text-right">
                                            <div class="btn-group" data-toggle="buttons">
                                                <label class="btn btn-default">
                                                    <input type="radio" name="options" id="option1" autocomplete="off">
                                                    <span class="glyphicon glyphicon-thumbs-up"></span> <g:message
                                                        code="warrior.living"/>
                                                </label>
                                                <label class="btn btn-default">
                                                    <input type="radio" name="options" id="option2" autocomplete="off">
                                                    <span class="glyphicon glyphicon-thumbs-down"></span> <g:message
                                                        code="warrior.deceased"/>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <% i++ %>
                                </g:while>
                                </tbody>
                            </table>

                        </div>

                    </div>

                </div>
            </div>
        </g:each>

    </div>
</div>

<div class="col-sm-12 col-xs-12">

    <button type="submit" class="pull-right btn btn-success">
        <span class="glyphicon glyphicon-forward"></span> ${message(code: 'next.step', default: 'Save')}
    </button>

</div>

</body>
</html>