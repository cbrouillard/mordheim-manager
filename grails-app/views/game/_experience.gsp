<div id="${from.id}progress">
    <div class="progress">
        <div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar"
             id="${from.id}warrioralive"
             style="width: ${1 * 100 / maxXp}%;">
            +1
        </div>

        <div class="progress-bar progress-bar-striped progress-bar-warning progress-chief" role="progressbar"
             id="${from.id}winnerchief"
             style="width: ${1 * 100 / maxXp}%;">
            +1
        </div>
        <div class="progress-bar progress-bar-striped progress-bar-danger progress-kill" role="progressbar"
             id="${from.id}herokill"
             style="width: ${0 * 100 / maxXp}%;">

        </div>
    </div>
</div>