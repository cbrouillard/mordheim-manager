<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <script type="text/javascript">

        var result = function (wrenchgroupId) {
            var allDead = 1;
            var allLife = 1;
            var notInGame = 1;

            $('#' + wrenchgroupId + ' input[type=radio]:checked').each(
                    function (index) {
                        var val = $(this).val();
                        console.log(index + ": " + val);

                        if (val == 'death') {
                            allLife = 0;
                        } else {
                            allDead = 0;
                        }

                    });

            var message = "<g:message code="endgame.notalldead.notalllife"/>";
            if (allDead) {
                message = "<g:message code="endgame.alldead"/>";
                $('#' + wrenchgroupId + "progress").hide();
            } else if (allLife) {
                message = "<g:message code="endgame.alllife"/>";
                $('#' + wrenchgroupId + "progress").show();
            } else {
                $('#' + wrenchgroupId + "progress").show();
            }

            $('#' + wrenchgroupId + "results").html(message);
        }
    </script>
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
    <g:form action="savedeadwrench" method="POST"><g:hiddenField name="band" value="${bandInstance.id}"/>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <g:each in="${bandInstance.wrenches?.sort({ it.dateCreated })}" var="wrenchgroup">
                        <div class="col-lg-4 col-sm-6 col-xs-12">
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                                            <h5><strong>${wrenchgroup.name}</strong></h5>
                                            <span class="label label-default">${wrenchgroup.number} ${wrenchgroup.type}</span>
                                            <span class="label label-default"><g:message code="experience.current"
                                                                                         args="[wrenchgroup.fullXp]"/></span>
                                        </div>

                                        <div class="col-sm-6">
                                            <g:render template="experience" model="[from: wrenchgroup, maxXp: 1]"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <tbody>
                                        <g:set var="i" value="${new Integer(0)}"/>
                                        <g:while test="${i < wrenchgroup.number}">
                                            <tr>
                                                <td>
                                                    <span class="label label-warning">${wrenchgroup.type} #${i + 1}</span>
                                                </td>
                                                <td class="text-right">
                                                    <div class="btn-group" data-toggle="buttons" id="${wrenchgroup.id}">
                                                        <label class="btn btn-default active">
                                                            <input type="radio" name="wrench.${wrenchgroup.id}.${i}"
                                                                   id="${wrenchgroup.id}${i}_life"
                                                                   onchange="javascript:result('${wrenchgroup.id}');"
                                                                   autocomplete="off" checked="" value="life">
                                                            <span class="glyphicon glyphicon-thumbs-up"></span> <g:message
                                                                code="warrior.living"/>
                                                        </label>
                                                        %{--<label class="btn btn-default">
                                                            <input type="radio" name="wrench.${wrenchgroup.id}.${i}"
                                                                   id="${wrenchgroup.id}${i}_notingame"
                                                                   onchange="javascript:result('${wrenchgroup.id}');"
                                                                   autocomplete="off" value="notingame">
                                                            <span class="glyphicon glyphicon-hand-right"></span> <g:message
                                                                code="warrior.notingame"/>
                                                        </label>--}%
                                                        <label class="btn btn-default">
                                                            <input type="radio" name="wrench.${wrenchgroup.id}.${i}"
                                                                   id="${wrenchgroup.id}${i}_death"
                                                                   onchange="javascript:result('${wrenchgroup.id}');"
                                                                   autocomplete="off" value="death">
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


                                <div class="panel-footer text-right">
                                    <span id="${wrenchgroup.id}results" class="label label-default">
                                        <g:message code="endgame.alllife"/>
                                    </span>
                                </div>

                            </div>
                        </div>
                    </g:each>
                </div>
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

<jq:jquery>
    $(".progress-chief").hide();
    $(".progress-kill").hide();
</jq:jquery>
</body>
</html>