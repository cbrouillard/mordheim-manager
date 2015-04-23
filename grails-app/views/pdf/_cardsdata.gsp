<div class="pos" id="0:0" style="top:${startingTop ?: 0}">
    <img src="${resource(dir: 'images', file: 'cards.png', absolute: true)}"
         border="0"/>
</div>

<g:set var="topRef" value="${new Integer(72) + startingTop ?: 0}"/>
<g:set var="nb" value="${new Integer(0)}"/>
<g:set var="heroes" value="${band.heroes.sort({ it.dateCreated })}"/>
<g:while test="${nb < 6}">
    <g:set var="hero" value="${heroes.getAt(nb)}"/>

    <g:if test="${nb == 1 || nb == 3 || nb == 5}">
        <g:set var="leftRef" value="${new Integer(705)}"/>
    </g:if>
    <g:else>
        <g:set var="leftRef" value="${new Integer(230)}"/>
    </g:else>

    <g:if test="${nb % 2 == 0}">
        <g:set var="topRef" value="${new Integer(72) + (startingTop ?: 0) + 266 * nb}"/>
    </g:if>

    <g:if test="${!hero}">
        <div class="pos"
             style="top:${topRef - 20}px;left:${leftRef - 40}px;width:390px;height:525px;background:white;z-index:4;border:1px solid gray;">
            &nbsp;
        </div>
    </g:if>

    <div class="pos" style="top:${topRef}px;left:${leftRef}px;width:310px;font-weight: bold;">
        <span style=" font-family:Arial; font-size:12px; color:white">
            <g:message code="hero"/> #${nb + 1}
        </span>
    </div>

    <div class="pos" style="top:${topRef + 35}px;left:${leftRef}px;width:310px;">
        <div class="type">
            <span style=" font-family:Arial; font-size:14px;">
                ${hero?.name ?: "&nbsp;".encodeAsRaw()}
            </span>
        </div>
    </div>


    <div class="pos" style="top:${topRef + 70}px;left:${leftRef}px;width:150px;">
        <div class="photo">
            <g:if test="${hero?.photo}">
                <img src="${createLink(action: 'photo', id: hero?.id, controller: 'hero', absolute: true)}"
                     class="imgwarrior"/>
            </g:if>
            <g:else>
                <img src="${resource(dir: 'images', file: 'Mordheim.gif', absolute: true)}" class="imgwarrior"/>
            </g:else>
        </div>
    </div>

    <div class="pos" style="top:${topRef + 70}px;left:${leftRef + 155}px;width:155px;">
        <div class="well data">
            <div class="header">
                <g:message code="warrior.equipment.label"/>
            </div>

            <div class="body">
                <span style=" font-family:Arial; font-size:12px;">
                    <g:if test="${hero?.equipment}">
                        ${raw(hero?.equipment)}
                    </g:if>
                    <g:else>
                        <i><g:message code="no.equipment" encodeAs="raw"/></i>
                    </g:else>
                </span>
            </div>
        </div>
    </div>


    <div class="pos" style="top:${topRef + 215}px;left:${leftRef}px;width:310px;">
        <div class="type">
            <span style=" font-family:Arial; font-size:12px;">
                ${hero?.type}
            </span>
        </div>
    </div>

    <div class="pos" style="top:${topRef + 250}px;left:${leftRef}px;width:310px;">
        <div class="well data">
            <div class="header">
                <g:message code="warrior.competences.and.injuries.label"/>
            </div>

            <div class="body">

                <table class="table-light">
                    <tr>
                        <td style="border-right: 2px solid gray;">
                            <span style=" font-family:Arial; font-size:12px;">
                                <g:if test="${hero?.competences}">
                                    ${raw(hero?.competences)}
                                </g:if>
                                <g:else>
                                    <i><g:message code="no.competences.card" encodeAs="raw"/></i>
                                </g:else>
                            </span>
                        </td>

                        <td>
                            <span style=" font-family:Arial; font-size:12px;">
                                <g:if test="${hero?.injuries}">
                                    ${raw(hero?.injuries)}
                                </g:if>
                                <g:else>
                                    <i><g:message code="no.injuries.card" encodeAs="raw"/></i>
                                </g:else>
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>


    <div class="pos" style="top:${topRef + 400}px;left:${leftRef}px;width:310px;text-align: center;">
        <g:render template="/profilable/showprofile" model="[warrior: hero]"/>
    </div>

    <div class="pos" style="top:${topRef + 470}px;left:${leftRef}px;width:310px;font-weight: bold;text-align: center;">
        <span style="font-family:Arial; font-size:12px; color:white">
            <g:message code="experience.current" args="[hero?.fullXp ?: 0]"/>
        </span>
    </div>

    <% nb++ %>
</g:while>

<div class="pos" style="top:${1754 + (startingTop ?: 0)}">
    <img src="${resource(dir: 'images', file: 'cards2.png', absolute: true)}"
         border="0"/>
</div>

<g:set var="topRef" value="${new Integer(1826) + (startingTop ?: 0)}"/>
<g:set var="nb" value="${new Integer(0)}"/>
<g:set var="wrenches" value="${band.wrenches.sort({ it.dateCreated })}"/>
<g:while test="${nb < 6}">

    <g:set var="wrench" value="${wrenches.getAt(nb)}"/>

    <g:if test="${nb == 1 || nb == 3 || nb == 5}">
        <g:set var="leftRef" value="${new Integer(705)}"/>
    </g:if>
    <g:else>
        <g:set var="leftRef" value="${new Integer(230)}"/>
    </g:else>

    <g:if test="${nb % 2 == 0}">
        <g:set var="topRef" value="${new Integer(1826) + (startingTop ?: 0) + 266 * nb}"/>
    </g:if>

    <g:if test="${!wrench}">
        <div class="pos"
             style="top:${topRef - 20}px;left:${leftRef - 40}px;width:390px;height:525px;background:white;z-index:4;border:1px solid gray;">
            &nbsp;
        </div>
    </g:if>

    <div class="pos" style="top:${topRef}px;left:${leftRef}px;width:310px;font-weight: bold;">
        <span style=" font-family:Arial; font-size:12px; color:white">
            <g:message code="wrench"/> #${nb + 1}
        </span>
    </div>

    <div class="pos" style="top:${topRef + 35}px;left:${leftRef}px;width:310px;">
        <div class="type">
            <span style=" font-family:Arial; font-size:14px;">
                ${wrench?.name}
            </span>
        </div>
    </div>


    <div class="pos" style="top:${topRef + 70}px;left:${leftRef}px;width:150px;">
        <div class="photo">
            <g:if test="${wrench?.photo}">
                <img src="${createLink(action: 'photo', id: wrench?.id, controller: 'wrenchmen', absolute: true)}"
                     class="imgwarrior"/>
            </g:if>
            <g:else>
                <img src="${resource(dir: 'images', file: 'Mordheim.gif', absolute: true)}" class="imgwarrior"/>
            </g:else>
        </div>
    </div>

    <div class="pos" style="top:${topRef + 70}px;left:${leftRef + 155}px;width:155px;">
        <div class="well data">
            <div class="header">
                <g:message code="warrior.equipment.label"/>
            </div>

            <div class="body">
                <span style=" font-family:Arial; font-size:12px;">
                    <g:if test="${wrench?.equipment}">
                        ${raw(wrench?.equipment)}
                    </g:if>
                    <g:else>
                        <i><g:message code="no.equipment" encodeAs="raw"/></i>
                    </g:else>
                </span>
            </div>
        </div>
    </div>


    <div class="pos" style="top:${topRef + 215}px;left:${leftRef}px;width:310px;">
        <div class="type">
            <span style=" font-family:Arial; font-size:12px;">
                ${wrench?.number} ${wrench?.type}
            </span>
        </div>
    </div>

    <div class="pos" style="top:${topRef + 250}px;left:${leftRef}px;width:310px;">
        <div class="well data">
            <div class="header">
                <g:message code="wrench.specialRules.label"/>
            </div>

            <div class="body">
                <span style=" font-family:Arial; font-size:12px;">
                    <g:if test="${wrench?.specialRules}">
                        ${raw(wrench?.specialRules)}
                    </g:if>
                    <g:else>
                        <i><g:message code="no.specialrules.card" encodeAs="raw"/></i>
                    </g:else>
                </span>
            </div>
        </div>
    </div>


    <div class="pos" style="top:${topRef + 400}px;left:${leftRef}px;width:310px;text-align: center;">
        <g:render template="/profilable/showprofile" model="[warrior: wrench]"/>
    </div>

    <div class="pos" style="top:${topRef + 470}px;left:${leftRef}px;width:310px;font-weight: bold;text-align: center;">
        <span style="font-family:Arial; font-size:12px; color:white">
            <g:message code="experience.current" args="[wrench?.fullXp ?: 0]"/>
        </span>
    </div>

    <% nb++ %>
</g:while>

<g:if test="${band.mavericks}">

    <div class="pos" style="top:${3508 + (startingTop ?: 0)}">
        <img src="${resource(dir: 'images', file: 'cards3.png', absolute: true)}"
             border="0"/>
    </div>

    <g:set var="topRef" value="${new Integer(3580)}"/>
    <g:set var="nb" value="${new Integer(0)}"/>
    <g:set var="mavericks" value="${band.mavericks.sort({ it.dateCreated })}"/>
    <g:while test="${nb < 6}">
        <g:set var="maverick" value="${mavericks.getAt(nb)}"/>

        <g:if test="${nb == 1 || nb == 3 || nb == 5}">
            <g:set var="leftRef" value="${new Integer(705)}"/>
        </g:if>
        <g:else>
            <g:set var="leftRef" value="${new Integer(230)}"/>
        </g:else>

        <g:if test="${nb % 2 == 0}">
            <g:set var="topRef" value="${new Integer(3580) + (startingTop ?: 0) + 266 * nb}"/>
        </g:if>

        <g:if test="${!maverick}">
            <div class="pos"
                 style="top:${topRef - 20}px;left:${leftRef - 40}px;width:390px;height:525px;background:white;z-index:4;border:1px solid gray;">
                &nbsp;
            </div>
        </g:if>

        <div class="pos" style="top:${topRef}px;left:${leftRef}px;width:310px;font-weight: bold;">
            <span style=" font-family:Arial; font-size:12px; color:white">
                <g:message code="maverick"/> #${nb + 1}
            </span>
        </div>

        <div class="pos" style="top:${topRef + 35}px;left:${leftRef}px;width:310px;">
            <div class="type">
                <span style=" font-family:Arial; font-size:14px;">
                    ${maverick?.name ?: "&nbsp;".encodeAsRaw()}
                </span>
            </div>
        </div>


        <div class="pos" style="top:${topRef + 70}px;left:${leftRef}px;width:150px;">
            <div class="photo">
                <g:if test="${maverick?.photo}">
                    <img src="${createLink(action: 'photo', id: maverick?.id, controller: 'maverick', absolute: true)}"
                         class="imgwarrior"/>
                </g:if>
                <g:else>
                    <img src="${resource(dir: 'images', file: 'Mordheim.gif', absolute: true)}" class="imgwarrior"/>
                </g:else>
            </div>
        </div>

        <div class="pos" style="top:${topRef + 70}px;left:${leftRef + 155}px;width:155px;">
            <div class="well data">
                <div class="header">
                    <g:message code="warrior.equipment.label"/>
                </div>

                <div class="body">
                    <span style=" font-family:Arial; font-size:12px;">
                        <g:if test="${maverick?.equipment}">
                            ${raw(maverick?.equipment)}
                        </g:if>
                        <g:else>
                            <i><g:message code="no.equipment" encodeAs="raw"/></i>
                        </g:else>
                    </span>
                </div>
            </div>
        </div>


        <div class="pos" style="top:${topRef + 215}px;left:${leftRef}px;width:310px;">
            <div class="type">
                <span style=" font-family:Arial; font-size:12px;">
                    ${maverick?.type}
                </span>
            </div>
        </div>

        <div class="pos" style="top:${topRef + 250}px;left:${leftRef}px;width:310px;">
            <div class="well data">
                <div class="header">
                    <g:message code="warrior.competences.and.injuries.label"/>
                </div>

                <div class="body">

                    <table class="table-light">
                        <tr>
                            <td style="border-right: 2px solid gray;">
                                <span style=" font-family:Arial; font-size:12px;">
                                    <g:if test="${maverick?.competences}">
                                        ${raw(maverick?.competences)}
                                    </g:if>
                                    <g:else>
                                        <i><g:message code="no.competences.card" encodeAs="raw"/></i>
                                    </g:else>
                                </span>
                            </td>

                            <td>
                                <span style=" font-family:Arial; font-size:12px;">
                                    <g:if test="${maverick?.injuries}">
                                        ${raw(maverick?.injuries)}
                                    </g:if>
                                    <g:else>
                                        <i><g:message code="no.injuries.card" encodeAs="raw"/></i>
                                    </g:else>
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>


        <div class="pos" style="top:${topRef + 400}px;left:${leftRef}px;width:310px;text-align: center;">
            <g:render template="/profilable/showprofile" model="[warrior: maverick]"/>
        </div>

        <div class="pos"
             style="top:${topRef + 470}px;left:${leftRef}px;width:310px;font-weight: bold;text-align: center;">
            <span style="font-family:Arial; font-size:12px; color:white">
                <g:message code="experience.current" args="[maverick?.fullXp ?: 0]"/>
            </span>
        </div>

        <% nb++ %>
    </g:while>
</g:if>
