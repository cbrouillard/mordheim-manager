<%@ page import="com.headbangers.mordheim.Band" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">

        <div class="pull-right">
            <g:if test="${!anonymous}">
                <g:link action="changephoto" id="${bandInstance.id}">
                    <div class="btn btn-default">
                        <g:render template="/band/image"/>
                    </div>
                </g:link>
            </g:if>
            <g:else>
                <div class="thumbnail pull-right">
                    <g:render template="/band/image"/>
                </div>
            </g:else>
        </div>


        <div>

            <h1>
                <g:message
                        code="band.show"/> <small>${bandInstance.name}</small>

                <g:if test="${!anonymous}">
                    <div class="btn-group">
                        <g:link class="btn btn-primary" controller="band" action="pdf" id="${bandInstance.id}">
                            <i class="fa fa-file-pdf-o"></i> <g:message code="pdf.band"/>
                        </g:link>
                        <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown"
                                aria-expanded="false">
                            <span class="glyphicon glyphicon-cog"></span>
                            <span class="caret"></span>
                            <span class="sr-only">Toggle</span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <g:link controller="band" action="previewpdf" id="${bandInstance.id}"
                                        target="_blank">
                                    <span class="glyphicon glyphicon-eye-open"></span> <g:message
                                        code="generate.preview.pdf.${bandInstance.owner.generateOnlyOnePDF}"/>
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="band" action="pdf" id="${bandInstance.id}">
                                    <i class="fa fa-file-pdf-o"></i> <g:message
                                        code="generate.pdf.${bandInstance.owner.generateOnlyOnePDF}"/>
                                </g:link>
                            </li>

                            <g:if test="${!bandInstance.owner.generateOnlyOnePDF}">
                                <li class="divider"></li>
                                <li>
                                    <g:link controller="band" action="previewcards" id="${bandInstance.id}"
                                            target="_blank">
                                        <span class="glyphicon glyphicon-eye-open"></span> <g:message
                                            code="generate.preview.cards"/>
                                    </g:link>
                                </li>
                                <li>
                                    <g:link controller="band" action="cards" id="${bandInstance.id}">
                                        <span class="glyphicon glyphicon-picture"></span> <g:message
                                            code="generate.cards"/>
                                    </g:link>
                                </li>
                            </g:if>

                            <li class="divider"></li>
                            <li>
                                <g:link controller="band" action="bbcode" id="${bandInstance.id}"
                                        data-toggle="modal" data-target="#globalModal">
                                    <span class="glyphicon glyphicon-console"></span> <g:message
                                        code="generate.bbcode"/>
                                </g:link>
                            </li>
                            <g:if test="${bandInstance.nbWarriors > 0}">
                                <li class="divider"></li>
                                <li>
                                    <g:link controller="game" action="endgame" id="${bandInstance.id}">
                                        <span class="glyphicon glyphicon-ok-circle"></span> <g:message code="end.game"/>
                                    </g:link>
                                </li>
                            </g:if>
                        </ul>
                    </div>

                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteBandModal">
                        <span class="glyphicon glyphicon-remove"></span> ${message(code: 'default.button.delete.label', default: 'Delete')}
                    </button>

                </g:if>
            </h1>

            <hr/>

            <div class="clearfix">&nbsp;</div>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>


<div class="col-sm-4 col-xs-12">
    <div data-spy="affix" data-offset-top="200" class="band-infos-affixed">
        <div class="panel panel-info" data-clampedwidth=".band-infos-affixed">
            <div class="panel-heading clearfix">

                <g:if test="${!anonymous}">
                    <div class="form-inline pull-right">
                        <div class="btn-group">
                            <g:link class="btn btn-success" controller="band" action="edit" id="${bandInstance.id}">
                                <span class="glyphicon glyphicon-edit"></span>
                                <g:message code="default.button.edit.label"/>
                            </g:link>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class="pull-right">
                        <div class="addthis_toolbox addthis_default_style">
                            <a class="addthis_button_facebook"></a>
                            <a class="addthis_button_twitter"></a>
                            <a class="addthis_button_email"></a>
                            <a class="addthis_button_compact"></a>
                            <a class="addthis_counter addthis_bubble_style"></a>
                        </div>
                    </div>
                </g:else>
                <h5><g:message code="band.infos"/></h5>

            </div>

            <table class="table">
                <tr>
                    <td><strong><g:message code="band.nbGame.title"/></strong></td>
                    <td><strong>${bandInstance.nbGame}</strong></td>
                </tr>
                <tr class="warning">
                    <td><strong><g:message code="band.value"/></strong></td>
                    <td><strong>${bandInstance.bandValue}</strong></td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.name.label"/></strong></td>
                    <td>${bandInstance.name}</td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.type.label"/></strong></td>
                    <td>${bandInstance.type}</td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.nbwarrior"/></strong></td>
                    <td>${bandInstance.nbWarriors}
                    <g:if test="${bandInstance.nbMavericks}">
                        <g:message code="band.plus.mavericks" args="[bandInstance.nbMavericks]"/>
                    </g:if>
                    </td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.gold.title"/></strong></td>
                    <td><g:message code="band.gold" args="[bandInstance.gold]"/></td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.magical.stones.title"/></strong></td>
                    <td><g:formatNumber number="${bandInstance.magicalStones}"/></td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.equipment"/></strong></td>
                    <td><div class="well">${raw(bandInstance.reserve)}</div></td>
                </tr>
                <tr>
                    <td><strong><g:message code="note.label"/></strong></td>
                    <td><div class="well">${raw(bandInstance.note)}</div></td>
                </tr>
                <tr>
                    <td><strong><g:message code="band.public.url"/></strong></td>
                    <td>
                        <g:link action="band" controller="public" id="${bandInstance.id}" absolute="true">
                            <span class="glyphicon glyphicon-link"></span>
                            ${bandInstance.name}
                        </g:link>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<div class="col-sm-8 col-xs-12">

    <div role="tabpanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs responsive" role="tablist">
            <li role="presentation" class=" ${!activeTab ? 'active' : ''}">
                <a href="#heroes" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.heroes.size()}</span>
                    <g:message code="heroes"/>
                    <g:if test="${!anonymous}">
                        <button class="btn btn-success btn-xs ${bandInstance.heroes.size() >= 6 ? "disabled" : ""}"
                                onclick="document.location = '${createLink(controller: 'hero', action:'create', params: [band:bandInstance.id])}'">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </g:if>
                </a>

            </li>
            <li role="presentation" class="${activeTab == 'wrench' ? 'active' : ''}">
                <a href="#wrenches" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.nbWrenches}</span>
                    <g:message code="wrenches"/>
                    <g:if test="${!anonymous}">
                        <button class="btn btn-success btn-xs ${bandInstance.nbWarriors >= 21 ? "disabled" : ""}"
                                onclick="document.location = '${createLink(controller: 'wrenchmen', action:'create', params: [band:bandInstance.id])}'">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </g:if>
                </a>
            </li>
            <li role="presentation" class="${activeTab == 'maverick' ? 'active' : ''}">
                <a href="#mavericks" role="tab" data-toggle="tab">
                    <span class="badge">${bandInstance.nbMavericks}</span>
                    <g:message code="mavericks"/>
                    <g:if test="${!anonymous}">
                        <button class="btn btn-success btn-xs"
                                onclick="document.location = '${createLink(controller: 'maverick', action:'create', params: [band:bandInstance.id])}'">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </g:if>
                </a>
            </li>
        </ul>



        <!-- Tab panes -->
        <div class="tab-content responsive">
            <div role="tabpanel" class="tab-pane ${!activeTab ? 'active' : ''}" id="heroes">
                <g:render template="/hero/heroes"/>
            </div>

            <div role="tabpanel" class="tab-pane ${activeTab == 'wrench' ? 'active' : ''}" id="wrenches">
                <g:render template="/wrenchmen/wrenches"/>
            </div>

            <div role="tabpanel" class="tab-pane ${activeTab == 'maverick' ? 'active' : ''}" id="mavericks">
                <g:render template="/maverick/mavericks"/>
            </div>
        </div>

    </div>

    <g:if test="${bandInstance.nbWarriors == 0}">&nbsp;
        <div class="alert alert-info">
            <g:message encodeAs="raw" code="help.nowarriors"
                       args="[createLink(controller: 'band', action: 'addhero', id: bandInstance.id)]"/>
        </div>
    </g:if>

</div>


<!-- Modal -->
<g:form url="[resource: bandInstance, action: 'delete']" method="DELETE">
    <div class="modal fade" id="deleteBandModal" tabindex="-1" role="dialog" aria-labelledby="deleteBandModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="deleteBandModalLabel">
                        <g:message code="default.button.delete.label"/>
                    </h4>
                </div>

                <div class="modal-body">
                    <g:message code="default.button.delete.confirm.message"/>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <g:message code="cancel"/>
                    </button>
                    <button type="submit" class="btn btn-danger">
                        ${message(code: 'default.button.delete.label', default: 'Delete')}
                    </button>
                </div>
            </div>
        </div>
    </div>
</g:form>

<jq:jquery>
    fakewaffle.responsiveTabs(['xs']);
</jq:jquery>

</body>
</html>
