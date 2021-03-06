<div class="table-responsive">
    <table class="table table-condensed">
        <thead>
        <tr>
            <th class="text-center"><g:message code="profile.m"/></th>
            <th class="text-center"><g:message code="profile.cc"/></th>
            <th class="text-center"><g:message code="profile.ct"/></th>
            <th class="text-center"><g:message code="profile.f"/></th>
            <th class="text-center"><g:message code="profile.e"/></th>
            <th class="text-center"><g:message code="profile.pv"/></th>
            <th class="text-center"><g:message code="profile.i"/></th>
            <th class="text-center"><g:message code="profile.a"/></th>
            <th class="text-center"><g:message code="profile.cd"/></th>
        </tr
        </thead>
        <tbody>
        <tr>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="M" required=""
                         value="${profilable?.M}" class="form-control shortonphone" min="0" size="3"/></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="CC" required=""
                         value="${profilable?.CC}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="CT" required=""
                         value="${profilable?.CT}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="F" required=""
                         value="${profilable?.F}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="E" required=""
                         value="${profilable?.E}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="PV" required=""
                         value="${profilable?.PV}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="I" required=""
                         value="${profilable?.I}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="A" required=""
                         value="${profilable?.A}" class="form-control shortonphone" min="0" /></td>
            <td class="col-xs-1"><g:field type="number" maxlength="2" pattern="^([0-9]){1,2}" name="CD" required=""
                         value="${profilable?.CD}" class="form-control shortonphone" min="0" /></td>
        </tr>
        </tbody>
    </table>
</div>