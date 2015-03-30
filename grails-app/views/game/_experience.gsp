<div id="${from.id}progress">
    <span class="label label-success legend_alive"><g:message code="alive.legend"/></span>
    <span class="label label-warning legend_chief"><g:message code="chief.legend"/></span>
    <span class="label label-danger legend_victims"><g:message code="victims.legend"/></span>
    <span class="label label-info legend_bonus"><g:message code="bonus.legend"/></span>

    <div class="progress">
        <div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar"
             id="${from.id}warrioralive"
             style="width: ${new Integer(parameters.xpRef) * 100 / maxXp}%;">
            +${parameters.xpRef}
        </div>

        <div class="progress-bar progress-bar-striped progress-bar-warning progress-chief" role="progressbar"
             id="${from.id}winnerchief"
             style="width: 0%;">
            +1
        </div>

        <div class="progress-bar progress-bar-striped progress-bar-danger progress-kill" role="progressbar"
             id="${from.id}herokill"
             style="width: 0%;">
        </div>

        <div class="progress-bar progress-bar-striped progress-bar-info progress-bonus" role="progressbar"
             id="${from.id}warriorbonus"
             style="width: 0%;">
        </div>
    </div>

</div>


