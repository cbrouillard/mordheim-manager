<g:if test="${!bandInstance.photo}">
    <asset:image src="Mordheim.gif" class="imgband"/>
</g:if>
<g:else>
    <img src="${createLink(action: 'photo', id: bandInstance.id, controller: 'band')}"/>
</g:else>