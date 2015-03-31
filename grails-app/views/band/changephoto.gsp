<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
</head>

<body>

<div class="row-fluid">
    <div class="col-sm-12">

        <div>

            <h1>
                <g:message
                        code="band.changephoto"/> <small>${bandInstance.name}</small>

            </h1>

            <hr/>
        </div>

        <g:if test="${flash.message}">
            <div class="clearfix">&nbsp;</div>

            <div class="alert alert-info" role="status">${flash.message}</div>
        </g:if>
    </div>
</div>

<div class="col-xs-12">

    <g:uploadForm action="savephoto" class="form-horizontal"><g:hiddenField name="id" value="${bandInstance.id}"/>
        <div class="panel panel-default">
            <div class="panel-body">

                <fieldset class="form">

                    <div class="form-group">

                        <label class="col-sm-2 control-label"><g:message code="band.actual.photo.label"
                                                                         default="Photo"/></label>

                        <div class="col-sm-10">
                            <div class="input-group">

                                <div class="thumbnail form-control-static">
                                    <g:if test="${!bandInstance.photo}">
                                        <asset:image src="Mordheim.gif" class="imgband"/>
                                    </g:if>
                                    <g:else>
                                        <img src="${createLink(action: 'photo', id: bandInstance.id, controller: 'band')}"/>
                                    </g:else>
                                </div>
                            </div>

                            <div class="help-block with-errors"></div>
                        </div>
                    </div>


                    <div class="form-group">

                        <label for="photo" class="col-sm-2 control-label"><g:message code="band.photo.label"
                                                                                     default="Photo"/> *</label>

                        <div class="col-sm-10">
                            <div class="input-group">
                                <p class="form-control-static">
                                    <input id="photo" type="file" class="file" name="photo" data-show-preview="true"
                                           data-show-upload="false" data-show-caption="false">
                                </p>
                            </div>

                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                </fieldset>

            </div>

            <div class="panel-footer clearfix">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10 clearfix">

                        <button type="submit" class="btn btn-success" name="set" value="save">
                            <span class="glyphicon glyphicon-save"></span> ${message(code: 'default.button.create.label', default: 'Save')}
                        </button>

                        <button type="submit" class="btn btn-danger" name="set" value="reset">
                            <span class="glyphicon glyphicon-remove-sign"></span> ${message(code: 'reset', default: 'Reset')}
                        </button>
                    </div>
                </div>
            </div>

        </div>

    </g:uploadForm>

</div>

</body>
</html>