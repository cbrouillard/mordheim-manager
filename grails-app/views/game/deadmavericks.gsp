<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <script type="text/javascript">

        var result = function (maverickId) {

            var state = $('#' + maverickId + ' input[type=radio]:checked').val();

            var message = "";
            if (state == "death") {
                message = "<g:message code="endgame.alldead.maverick"/>";
                $('#' + maverickId + "progress").hide();
            } else if (state == "notin") {
                message = "<g:message code="endgame.notin.maverick"/>";
                $('#' + maverickId + "progress").hide();
            } else {
                message = "<g:message code="endgame.alllife.maverick"/>";
                $('#' + maverickId + "progress").show();
            }

            $('#' + maverickId + "results").html(message);
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
                <li><g:message code="end.howto"/></li>
                <li><g:message code="end.wrenchmen.states"/></li>
                <li><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.gains"/></li>
                <li class="active"><g:message code="end.mavericks.states"/></li>
                <li><g:message code="end.recap"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${raw(flash.message)}</div>
        </g:if>
    </div>
</div>

<div class="col-sm-12 col-xs-12">
    <g:form action="savedeadmavericks" method="POST" data-toggle="validator"><g:hiddenField name="band"
                                                                                            value="${bandInstance.id}"/>

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">

                    <g:each in="${bandInstance.mavericks?.sort({ it.dateCreated })}" var="maverick">
                        <div class="col-lg-6 col-sm-12 col-xs-12">
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                                            <h5><strong>${maverick.name}</strong></h5>
                                            <span class="label label-default">${maverick.type}</span>
                                            <span class="label label-default"><g:message code="experience.current"
                                                                                         args="[maverick.fullXp]"/></span>
                                        </div>

                                        <div class="col-sm-6">
                                            <g:render template="experience"
                                                      model="[from: maverick, maxXp: new Integer(parameters.xpRef)]"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td class="text-right">

                                                <div class="btn-group" data-toggle="buttons" id="${maverick.id}">
                                                    <label class="btn btn-default active">
                                                        <input type="radio" name="${maverick.id}.state"
                                                               id="${maverick.id}_life"
                                                               onchange="javascript:result('${maverick.id}');"
                                                               autocomplete="off" checked="" value="life">
                                                        <span class="glyphicon glyphicon-thumbs-up"></span> <g:message
                                                            code="warrior.living"/>
                                                    </label>
                                                    <label class="btn btn-default">
                                                        <input type="radio" name="${maverick.id}.state"
                                                               id="${maverick.id}_notin"
                                                               onchange="javascript:result('${maverick.id}');"
                                                               autocomplete="off" value="notin">
                                                        <span class="glyphicon glyphicon-hand-right"></span> <g:message
                                                            code="warrior.notingame"/>
                                                    </label>
                                                    <label class="btn btn-default">
                                                        <input type="radio" name="${maverick.id}.state"
                                                               id="${maverick.id}_death"
                                                               onchange="javascript:result('${maverick.id}');"
                                                               autocomplete="off" value="death">
                                                        <span class="glyphicon glyphicon-thumbs-down"></span> <g:message
                                                            code="warrior.deceased"/>
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">

                                                <div class="form-group">

                                                    <label for="${maverick.id}[bonus]"
                                                           class="col-sm-12 control-label"><g:message
                                                            code="how.many.bonus.label"/></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span
                                                                    class="glyphicon glyphicon-plus-sign"></span>
                                                            </span>
                                                            <g:field maxlength="2" pattern="^([0-9])*"
                                                                     name="${maverick.id}.bonus"
                                                                     type="number"
                                                                     value="0" min="0" required="" class="form-control"
                                                                     id="${maverick.id}bonus"
                                                                     onchange="javascript:recalculExperience('${maverick.id}')"/>
                                                        </div>

                                                        <div class="help-block with-errors">
                                                            <g:message code="how.many.bonus.label.hint"/>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="form-group">

                                                    <label for="${maverick.id}[injuries]"
                                                           class="col-sm-12 control-label"><g:message
                                                            code="hero.injuries.label"/></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span
                                                                    class="glyphicon glyphicon-plus-sign"></span></span>
                                                            <g:textArea name="${maverick.id}.injuries" cols="40"
                                                                        rows="5"
                                                                        value="${maverick?.injuries}"
                                                                        class="form-control editor"/>
                                                        </div>

                                                        <div class="help-block with-errors"></div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="${maverick.id}[competences]"
                                                           class="col-sm-12 control-label"><g:message
                                                            code="hero.competences.label"/></label>

                                                    <div class="col-sm-12">
                                                        <div class="input-group">
                                                            <span class="input-group-addon"><span
                                                                    class="glyphicon glyphicon-lamp"></span></span>
                                                            <g:textArea name="${maverick.id}.competences" cols="40"
                                                                        rows="5"
                                                                        value="${maverick?.competences}"
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
                                    <span id="${maverick.id}results" class="label label-default">
                                        <g:message code="endgame.alllife.maverick"/>
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
                            <span class="glyphicon glyphicon-forward"></span> ${message(code: 'recap', default: 'Save')}
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