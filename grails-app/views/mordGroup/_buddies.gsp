<g:if test="${group.buddies.size() == 1}">
    &nbsp;
    <div class="alert alert-info">
        <g:message code="only.U.in.group"/>
    </div>
</g:if>
<g:else>
    <g:each in="${group.buddies}" var="buddy">

        <g:if test="${!buddy.equals(currentUser)}">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h4>${buddy.username}</h4>
                </div>

                <div class="panel-body">
                    <g:each in="${buddy.bands}" var="band">
                        <div class="col-lg-3 col-md-4 col-sm-5">
                            <div class="thumbnail panel-primary">
                                <g:render template="/band/image" model="[bandInstance: band]"/>
                                <div class="caption text-center">
                                    <ul class="list-group">
                                        <li class="list-group-item list-group-item-info"><strong>${band.name}</strong>
                                        </li>
                                        <li class="list-group-item">${band.type}</li>
                                        <li class="list-group-item">

                                            <div class="btn-group">
                                                <g:link controller="mordGroup" action="band" id="${band.id}"
                                                        class="btn btn-success">
                                                    <span class="glyphicon glyphicon-eye-open"></span>
                                                    <g:message code="show"/></g:link>

                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </g:each>
                </div>
            </div>
        </g:if>

    </g:each>
</g:else>