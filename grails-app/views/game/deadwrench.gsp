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

        var wrenchNotApply = function (wrenchId) {
            var value = $('#' + wrenchId + 'notin').is(":checked");
            console.log(value);

            var message = "<g:message code="endgame.ignored"/>";
            if (value) {
                $('#' + wrenchId + 'container').hide();
                $('#' + wrenchId + "progress").hide();
                $('#' + wrenchId + "results").html(message);
            } else {
                $('#' + wrenchId + 'container').show();
                result(wrenchId);
            }
        }

        var recalculExperience = function (heroId) {
            var howManyBonus = $("#" + heroId + "bonus").val();
            var alive = ${parameters.xpRef};

            var total = Number(howManyBonus) + alive
            console.log("Total " + total);

            $("#" + heroId + "warrioralive").width("" + (alive * 100 / total) + "%");
            $("#" + heroId + "warriorbonus").width("" + (Number(howManyBonus) * 100 / total) + "%");
            $("#" + heroId + "warriorbonus").html("+" + howManyBonus)
        }
    </script>
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">
        <div class="thumbnail pull-right">
            <g:render template="/band/image"/>
        </div>

        <div>

            <h1>
                <g:message
                        code="band.end.games"/> <small>${bandInstance.name}</small>
            </h1>

            <hr/>

            <div class="clearfix">&nbsp;</div>
            <ol class="breadcrumb">
                <li><g:message code="end.howto"/></li>
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
    <g:form action="savedeadwrench" method="POST" data-toggle="validator"><g:hiddenField name="band"
                                                                                         value="${bandInstance.id}"/>

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
                                            <g:render template="experience"
                                                      model="[from: wrenchgroup, maxXp: new Integer(parameters.xpRef)]"/>
                                            <div class="btn-group pull-right" data-toggle="buttons">
                                                <label class="btn btn-default"
                                                       id="${wrenchgroup.id}notin_label">
                                                    <input type="checkbox" autocomplete="off"
                                                           name='wrench.${wrenchgroup.id}.notin'
                                                           id='${wrenchgroup.id}notin'
                                                           onchange="javascript:wrenchNotApply('${wrenchgroup.id}');">
                                                    <span class="glyphicon glyphicon-hand-right"></span> <g:message
                                                        code="wrench.notapply"/>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive" id="${wrenchgroup.id}container">
                                    <table class="table">
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
                                        <tr>
                                            <td colspan="2">
                                                <div class="form-group">

                                                    <label for="${wrenchgroup.id}[bonus]"
                                                           class="col-sm-12 control-label"><g:message
                                                            code="how.many.bonus.label"/></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span
                                                                    class="glyphicon glyphicon-plus-sign"></span>
                                                            </span>
                                                            <g:field maxlength="2" pattern="^([0-9])*"
                                                                     name="${wrenchgroup.id}.bonus"
                                                                     type="number"
                                                                     value="0" min="0" required="" class="form-control"
                                                                     id="${wrenchgroup.id}bonus"
                                                                     onchange="javascript:recalculExperience('${wrenchgroup.id}')"/>
                                                        </div>

                                                        <div class="help-block with-errors">
                                                            <g:message code="how.many.bonus.label.hint"/>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="form-group">

                                                    <label for="${wrenchgroup.id}[specialRules]"
                                                           class="col-sm-12 control-label"><g:message
                                                            code="wrench.specialRules.label"/></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span
                                                                    class="glyphicon glyphicon-plus-sign"></span></span>
                                                            <g:textArea name="${wrenchgroup.id}.specialRules" cols="40"
                                                                        rows="5"
                                                                        value="${wrenchgroup?.specialRules}"
                                                                        class="form-control editor"/>
                                                        </div>

                                                        <div class="help-block with-errors"></div>
                                                    </div>
                                                </div>

                                            </td>
                                        </tr>

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
    $(".legend_chief").hide();
    $(".legend_victims").hide();
</jq:jquery>
</body>
</html>