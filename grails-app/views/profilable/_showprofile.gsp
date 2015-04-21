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
            <td class="text-center"><span
                    class="label label-${warrior?.M <= 2 ? "danger" : (warrior?.M <= 4 ? 'warning' : 'success')}">${warrior?.M != null ? warrior.M :"&nbsp;".encodeAsRaw()}</span>
            </td>
            <td class="text-center"><span
                    class="label label-${warrior?.CC <= 2 ? "danger" : (warrior?.CC <= 3 ? 'warning' : 'success')}">${warrior?.CC}</span>
            </td>
            <td class="text-center"><span
                    class="label label-${warrior?.CT <= 2 ? "danger" : (warrior?.CT <= 3 ? 'warning' : 'success')}">${warrior?.CT}</span>
            </td>
            <td class="text-center"><span
                    class="label label-${warrior?.F <= 2 ? "danger" : (warrior?.F <= 3 ? 'warning' : 'success')}">${warrior?.F}</span>
            </td>
            <td class="text-center"><span
                    class="label label-${warrior?.E <= 2 ? "danger" : (warrior?.E <= 3 ? 'warning' : 'success')}">${warrior?.E}</span>
            </td>
            <td class="text-center"><span
                    class="label label-${warrior?.PV >= 2 ? "success" : "default"}">${warrior?.PV}</span></td>
            <td class="text-center"><span
                    class="label label-${warrior?.I <= 2 ? "danger" : (warrior?.I <= 3 ? 'warning' : 'success')}">${warrior?.I}</span>
            </td>
            <td class="text-center"><span
                    class="label label-${warrior?.A >= 2 ? "success" : "default"}">${warrior?.A}</span></td>
            <td class="text-center"><span
                    class="label label-${warrior?.CD <= 6 ? "danger" : (warrior?.CD <= 7 ? 'warning' : 'success')}">${warrior?.CD}</span>
            </td>
        </tr>
        </tbody>
    </table>
</div>