<div class="form-group ${hasErrors(bean: raceInstance, field: 'name', 'has-error')}">

    <label for="name" class="col-sm-2 control-label"><g:message code="band.name.label"
                                                                default="Name"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-font"></span></span>
            <g:textField name="name" required="" value="${raceInstance?.name}" class="form-control" autofocus=""/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: raceInstance, field: 'minFigures', 'has-error')}">

    <label for="minFigures" class="col-sm-2 control-label"><g:message code="race.minFigures.title"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-info-sign"></span></span>
            <g:field type="number" name="minFigures" required="" value="${raceInstance?.minFigures}" class="form-control"
                     min="0"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: raceInstance, field: 'maxFigures', 'has-error')}">

    <label for="maxFigures" class="col-sm-2 control-label"><g:message code="race.maxFigures.title"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-info-sign"></span></span>
            <g:field type="number" name="maxFigures" required="" value="${raceInstance?.maxFigures}" class="form-control"
                     min="0"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>

<div class="form-group ${hasErrors(bean: raceInstance, field: 'initialTreasure', 'has-error')}">

    <label for="initialTreasure" class="col-sm-2 control-label"><g:message code="race.initialTreasure.title"/> *</label>

    <div class="col-sm-10">
        <div class="input-group">
            <span class="input-group-addon"><span
                    class="glyphicon glyphicon-info-sign"></span></span>
            <g:field type="number" name="initialTreasure" required="" value="${raceInstance?.initialTreasure}" class="form-control"
                     min="0"/>
        </div>

        <div class="help-block with-errors"></div>
    </div>
</div>