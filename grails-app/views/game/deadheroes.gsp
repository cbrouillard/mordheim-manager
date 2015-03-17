<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <script type="text/javascript">

        var result = function (heroId) {

            var state = $('#' + heroId + ' input[type=radio]:checked').val();

            var message = "";
            if (state == "death") {
                message = "<g:message code="endgame.alldead.hero"/>";
                $('#' + heroId + "progress").hide();
            } else {
                message = "<g:message code="endgame.alllife.hero"/>";
                $('#' + heroId + "progress").show();
            }

            $('#' + heroId + "results").html(message);
        }

        var recalculExperience = function (heroId) {
            console.log($("#"+heroId+"kill").val());
        }

        var noOtherChief = function (heroId) {
            console.log ($("#"+heroId+'chief').val());

            $(".chief-selector").hide();
            $("#"+heroId+'chief-selector').show();

            $(".progress-chief").hide();
            $("#"+heroId+"winnerchief").show();
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
                <li><g:message code="end.wrenchmen.states"/></li>
                <li class="active"><g:message code="end.heroes.states"/></li>
                <li><g:message code="end.gains"/></li>
            </ol>

        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<g:form action="savedeadheroes" method="POST"><g:hiddenField name="band" value="${bandInstance.id}"/>
    <div class="col-sm-12 col-xs-12">
        <div class="row">

            <g:each in="${bandInstance.heroes?.sort({ it.dateCreated })}" var="hero">
                <div class="col-lg-6 col-sm-12 col-xs-12">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-6">
                                    <asset:image src="Mordheim.gif" class="imgwarrior pull-left"/>
                                    <h5><strong>${hero.name}</strong></h5>
                                    <span class="label label-default">${hero.type}</span>
                                    <span class="label label-default"><g:message code="experience.current" args="[hero.fullXp]"/></span>
                                </div>

                                <div class="col-sm-6">
                                    <g:render template="experience" model="[from: hero, maxXp: 3]"/>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="checkbox chief-selector" id="${hero.id}chief-selector">
                                            <label>
                                                <input type="checkbox" name='${hero.id}[chief]' id='${hero.id}chief' onchange="javascript:noOtherChief('${hero.id}');"/>
                                                <g:message code="is.hero.chief"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="text-right">

                                        <div class="btn-group" data-toggle="buttons" id="${hero.id}">
                                            <label class="btn btn-default active">
                                                <input type="radio" name="${hero.id}"
                                                       id="${hero.id}_life"
                                                       onchange="javascript:result('${hero.id}');"
                                                       autocomplete="off" checked="" value="life">
                                                <span class="glyphicon glyphicon-thumbs-up"></span> <g:message
                                                    code="warrior.living"/>
                                            </label>
                                            <label class="btn btn-default">
                                                <input type="radio" name="${hero.id}"
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
                                        <div class="form-group">

                                            <label for="${hero.id}[kill]" class="col-sm-12 control-label"><g:message code="how.many.kill.label"/></label>

                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-remove-sign"></span></span>
                                                    <g:field maxlength="2" pattern="^([0-9])*" name="${hero.id}[kill]" type="number"
                                                             value="0" required="" class="form-control" id="${hero.id}kill"
                                                                onchange="javascript:recalculExperience('${hero.id}')"/>
                                                </div>

                                                <div class="help-block with-errors">
                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">

                                            <label for="${hero.id}[injuries]" class="col-sm-12 control-label"><g:message
                                                    code="hero.injuries.label"/></label>

                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-plus-sign"></span></span>
                                                    <g:textArea name="${hero.id}[injuries]" cols="40" rows="5"
                                                                value="${hero?.injuries}"
                                                                class="form-control editor"/>
                                                </div>

                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="${hero.id}[competences]" class="col-sm-12 control-label"><g:message
                                                    code="hero.competences.label"/></label>

                                            <div class="col-sm-12">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><span
                                                            class="glyphicon glyphicon-lamp"></span></span>
                                                    <g:textArea name="${hero.id}[competences]" cols="40" rows="5"
                                                                value="${hero?.competences}"
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
                            <span id="${hero.id}results" class="label label-default">
                                <g:message code="endgame.alllife.hero"/>
                            </span>
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
</g:form>

<jq:jquery>
    $(".progress-chief").hide();
</jq:jquery>

</body>
</html>