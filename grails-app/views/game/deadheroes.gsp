<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <script type="text/javascript">

        var result = function (heroId) {

            var state = $('#' + heroId + ' input[type=radio]:checked').val();
            var notin = $("#" + heroId + "_notin").is(":checked")

            var message = "";

            if (notin) {
                message = "<g:message code="endgame.notin.hero"/>";
                $('#' + heroId + "progress").hide();
                $("#" + heroId).hide();
            } else {
                $("#" + heroId).show();
                if (state == "death") {
                    message = "<g:message code="endgame.alldead.hero"/>";
                    $('#' + heroId + "progress").hide();
                    $("#"+heroId+"_infosnotdead").hide();
                } else {
                    message = "<g:message code="endgame.alllife.hero"/>";
                    $('#' + heroId + "progress").show();
                    $("#"+heroId+"_infosnotdead").show();
                }
            }

            $('#' + heroId + "results").html(message);
        }

        var recalculExperience = function (heroId) {
            var howManyKill = $("#" + heroId + "kill").val();
            var state = $("#" + heroId + " input[type=radio]:checked").val();
            var victoriousChief = $("#" + heroId + "chief").is(":checked");
            var howManyBonus = $("#" + heroId + "bonus").val();
            var alive = ${parameters.xpRef};

            var total = Number(howManyBonus) + Number(howManyKill) + (state == "life" ? alive : 0) + (victoriousChief ? 1 : 0)
            console.log("Total " + total);

            $("#" + heroId + "warrioralive").width("" + (alive * 100 / total) + "%");
            $("#" + heroId + "herokill").width("" + (Number(howManyKill) * 100 / total) + "%");
            $("#" + heroId + "herokill").html("+" + howManyKill)
            $("#" + heroId + "winnerchief").width("" + ((victoriousChief ? 1 : 0) * 100 / total) + "%");
            $("#" + heroId + "warriorbonus").width("" + (Number(howManyBonus) * 100 / total) + "%");
            $("#" + heroId + "warriorbonus").html("+" + howManyBonus)
        }

        var noOtherChief = function (heroId) {
            var value = $("#" + heroId + 'chief').is(":checked");
            console.log("Value " + value);

            if (value) {
                $(".chief-selector").hide();
                $("#" + heroId + 'chief-selector').show();
            } else {
                $(".chief-selector").show();
            }

            recalculExperience(heroId);
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
                <li><g:message code="end.wrenchmen.states"/></li>
                <li class="active"><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.gains"/></li>
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

<div class="col-sm-12 col-xs-12">
<g:form action="savedeadheroes" method="POST" data-toggle="validator"><g:hiddenField name="band"
                                                                                     value="${bandInstance.id}"/>

<div class="panel panel-default">
<div class="panel-body">
    <div class="row">

        <g:each in="${bandInstance.heroes?.sort({ it.dateCreated })}" var="hero">
            <div class="col-lg-6 col-sm-12 col-xs-12">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-sm-6 col-xs-12">
                                <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                                <div class="pull-left">
                                    <h5><strong>${hero.name}</strong></h5>
                                    <span class="label label-default">${hero.type}</span>
                                    <span class="label label-default"><g:message code="experience.current"
                                                                                 args="[hero.fullXp]"/></span>
                                </div>
                            </div>

                            <div class="col-sm-6 col-xs-12 text-right">
                                <g:render template="experience"
                                          model="[from: hero, maxXp: new Integer(parameters.xpRef)]"/>

                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default">
                                        <input type="checkbox" name="${hero.id}.notin"
                                               id="${hero.id}_notin"
                                               onchange="javascript:result('${hero.id}');"
                                               autocomplete="off" value="notin">
                                        <span class="glyphicon glyphicon-hand-right"></span> <g:message
                                            code="ignore"/>
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="table-responsive" id="${hero.id}">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td class="text-right">

                                    <div class="btn-group" data-toggle="buttons">

                                        <label class="btn btn-default active">
                                            <input type="radio" name="${hero.id}.state"
                                                   id="${hero.id}_life"
                                                   onchange="javascript:result('${hero.id}');"
                                                   autocomplete="off" checked="" value="life">
                                            <span class="glyphicon glyphicon-thumbs-up"></span> <g:message
                                                code="warrior.living"/>
                                        </label>
                                        <label class="btn btn-default chief-selector"
                                               id="${hero.id}chief-selector">
                                            <input type="checkbox" autocomplete="off"
                                                   name='${hero.id}.victoriouschief'
                                                   id='${hero.id}chief'
                                                   onchange="javascript:noOtherChief('${hero.id}');">
                                            <span class="glyphicon glyphicon-star"></span> <g:message
                                                code="is.hero.chief"/>
                                        </label>
                                        <label class="btn btn-default">
                                            <input type="radio" name="${hero.id}.state"
                                                   id="${hero.id}_death"
                                                   onchange="javascript:result('${hero.id}');"
                                                   autocomplete="off" value="death">
                                            <span class="glyphicon glyphicon-thumbs-down"></span> <g:message
                                                code="warrior.deceased"/>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="${hero.id}_infosnotdead">
                                        <div class="form-group">

                                            <label for="${hero.id}[kill]"
                                                   class="col-sm-12 col-xs-12 control-label"><g:message
                                                    code="how.many.kill.label"/></label>

                                            <div class="col-sm-12 col-xs-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-remove-sign"></span>
                                                    </span>
                                                    <g:field maxlength="2" pattern="^([0-9])*"
                                                             name="${hero.id}.kill"
                                                             type="number"
                                                             value="0" min="0" required="" class="form-control"
                                                             id="${hero.id}kill"
                                                             onchange="javascript:recalculExperience('${hero.id}')"/>
                                                </div>

                                                <div class="help-block with-errors">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">

                                            <label for="${hero.id}[bonus]"
                                                   class="col-sm-12 col-xs-12 control-label"><g:message
                                                    code="how.many.bonus.label"/></label>

                                            <div class="col-sm-12 col-xs-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-plus-sign"></span>
                                                    </span>
                                                    <g:field maxlength="2" pattern="^([0-9])*"
                                                             name="${hero.id}.bonus"
                                                             type="number"
                                                             value="0" min="0" required="" class="form-control"
                                                             id="${hero.id}bonus"
                                                             onchange="javascript:recalculExperience('${hero.id}')"/>
                                                </div>

                                                <div class="help-block with-errors">
                                                    <g:message code="how.many.bonus.label.hint"/>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">

                                            <label for="${hero.id}[injuries]"
                                                   class="col-sm-12 col-xs-12 control-label"><g:message
                                                    code="hero.injuries.label"/></label>

                                            <div class="col-sm-12 col-xs-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-plus-sign"></span></span>
                                                    <g:textArea name="${hero.id}.injuries" cols="40" rows="5"
                                                                value="${hero?.injuries}"
                                                                class="form-control editor"/>
                                                </div>

                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="${hero.id}[competences]"
                                                   class="col-sm-12 col-xs-12 control-label"><g:message
                                                    code="hero.competences.label"/></label>

                                            <div class="col-sm-12 col-xs-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-lamp"></span></span>
                                                    <g:textArea name="${hero.id}.competences" cols="40"
                                                                rows="5"
                                                                value="${hero?.competences}"
                                                                class="form-control editor"/>
                                                </div>

                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>


                    <div class="panel-footer text-right">
                        <span id="${hero.id}results" class="label label-default">
                            <g:message code="endgame.alllife.hero"/>
                        </span>
                    </div>

                </div>
            </div>

            <jq:jquery>
                recalculExperience('${hero.id}');
            </jq:jquery>
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

</body>
</html>