<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <style type="text/css">
    <!--
    body {
        font-family: Arial;
        font-size: 20px
    }

    .pos {
        position: absolute;
        z-index: 0;
        left: 0px;
        top: 0px
    }

    -->
    </style>
</head>

<body>
<div class="pos" id="0:0" style="top:0">
    <img name="_842:596" src="${resource(dir: 'images', file: 'page_001.jpg', absolute: true)}"
         border="0"/>
</div>

<div class="pos" id="365:23" style="top:65px;left:680px">
    <span id="31.4" style=" font-family:Arial; font-size:65px; color:#892a1a24">
        <g:message code="wrenches"/></span>
</div>

<div class="pos" id="22:88" style="top:190;left:35;width: 625px;">
    <span id="11.8" style=" font-family:Arial; font-size:20px; color:#892a1a24">
        <g:message code="warband.name" args="[band.name]"/></span>
</div>

<div class="pos" id="347:88" style="top:190;left:720;width: 475px;">
    <span id="11.8" style=" font-family:Arial; font-size:20px; color:#892a1a24">
        <g:message code="warband.type" args="[band.type]"/></span>
</div>

<div class="pos" id="41:126" style="top:260;left:35">
    <span id="11.8" style=" font-family:Arial; font-size:20px; color:#892a1a24">
        <g:message code="warband.treasure"/> :</span>
</div>

<div class="pos" id="142:126" style="top:260;left:290">
    <span id="11.8" style=" font-family:Arial; font-size:20px; color:#892a1a24">
        <g:message code="warband.value"/> :</span>
</div>

<div class="pos" id="280:126" style="top:260;left:575;width: 615px;">
    <span id="11.5" style=" font-family:Arial; font-size:20px; color:#892a1a24">
        <g:message code="warband.equipment" args="[raw(band.reserve ?: '')]"/></span>
</div>

<div class="pos" id="20:146" style="top:300;left:35">
    <span id="10.8" style=" font-family:Arial; font-size:15px; color:#892a1a24">
        <g:message code="warband.gold" args="[band.gold]"/></span>
</div>

<div class="pos" id="144:146" style="top:300;left:290">
    <span id="10.8" style=" font-family:Arial; font-size:15px; color:#892a1a24">
        <g:message code="warband.total.experience" args="[band.totalXp]"/></span>
</div>

<div class="pos" id="20:166" style="top:350;left:35">
    <span id="10.8" style=" font-family:Arial; font-size:15px; color:#892a1a24">
        <g:message code="warband.magical.stones" args="[band.magicalStones]"/></span>
</div>

<div class="pos" id="145:165" style="top:350;left:290">
    <span id="11.8" style=" font-family:Arial; font-size:15px; color:#892a1a24">
        <g:message code="warband.members" args="[band.nbWarriors, band.nbWarriors * 5]"/></span>
</div>

<div class="pos" id="145:185" style="top:400;left:290">
    <span id="11.8" style=" font-family:Arial; font-size:15px; color:#892a1a24">
        <g:message code="warband.total.value" args="[band.getBandValue()]"/></span>
</div>

<!-- PROFIL HOMME DE MAIN -->
<g:set var="top" value="${new java.lang.Integer(480)}"/>
<g:set var="left" value="${new java.lang.Integer(45)}"/>
<g:each in="${band.wrenches?.sort { it.dateCreated }}" var="wrench">
    <div class="pos" id="23:228" style="top:${top};left:${left};width: 385px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.name" args="[wrench.name]"/></span>
    </div>

    <div class="pos" id="221:228" style="top:${top};left:${left + 405};width: 380px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.equipment" args="[raw(wrench.equipment ?: '')]"/></span>
    </div>

    <div class="pos" id="404:228" style="top:${top};left:${left + 800};width: 355px;">
        <span id="9.3" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.specialrules" args="[raw(wrench.specialRules ?: '')]"/></span>
    </div>

    <div class="pos" id="23:243" style="top:${top + 35};left:${left};width: 125px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.number" args="[wrench.number]"/></span>
    </div>

    <div class="pos" id="88:243" style="top:${top + 35};left:${left + 140};width: 250px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.type" args="[wrench.type]"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 19}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.m"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 19}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.M}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 56}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.cc"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 60}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.CC}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 100}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.ct"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 104}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.CT}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 148}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.f"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 148}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.F}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 190}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.e"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 190}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.E}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 230}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.pv"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 234}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.PV}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 280}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.i"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 278}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.I}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 322}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.a"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 322}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.A}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 90};left:${left + 359}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.cd"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 123};left:${left + 363}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${wrench.CD}</span>
    </div>

    <div class="pos" id="219:288" style="top:${top + 132};left:${left + 485}">
        <span id="8.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.experience" args="[wrench.fullXp]"/></span>
    </div>

    <!-- XP &#x22A0; -->
    <g:set var="cpt" value="${new Integer(1)}"/>
    <g:set var="xpLeft" value="${new Integer(727)}"/>
    <g:set var="xpTop" value="${top + 122}"/>
    <g:while test="${cpt <= 14}">
        <div class="pos" id="219:288" style="top:${xpTop};left:${xpLeft}">
            <g:if test="${cpt == 2 || cpt == 5 || cpt == 9 || cpt == 14}">
                <span id="8.8" style=" font-family:Arial; font-size:29px; color: red;font-weight:bold">
            </g:if>
            <g:else>
                <span id="8.8" style=" font-family:Arial; font-size:29px; color: #892a1a24">
            </g:else>
            <g:if test="${wrench.fullXp >= cpt}">
                &#x25A3;
            </g:if>
            <g:else>
                &#x25A2;
            </g:else>
        </span>
        </div>
        <% cpt++ %>
        <% xpLeft += 29 %>
    </g:while>


    <g:set var="top" value="${top + 206}"/>
</g:each>


<div class="pos" id="0:0" style="top:1754">
    <img name="_842:596" src="${resource(dir: 'images', file: 'page_002.jpg', absolute: true)}" border="0"/></div>


<div class="pos" id="493:850" style="top:1790;left:990">
    <span id="35.3" style=" font-family:Arial; font-size:65px; color:#892a1a24">
        <g:message code="warband.heroes"/></span>
</div>

<!-- PROFIL HERO -->
<g:set var="top" value="${new java.lang.Integer(1908)}"/>
<g:set var="left" value="${new java.lang.Integer(45)}"/>
<g:each in="${band.heroes?.sort({ it.dateCreated })}" var="hero">
    <div class="pos" id="23:911" style="top:${top};left:${left};width: 385px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.name" args="[hero.name]"/></span>
    </div>

    <div class="pos" id="221:912" style="top:${top};left:${left + 405};width: 225px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24;">
            <g:message code="warband.warrior.equipment" args="[raw(hero.equipment ?: '')]"/></span>
    </div>

    <div class="pos" id="404:912" style="top:${top};left:${left + 645};width: 270px;">
        <span id="9.4" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.competences" args="[raw(hero.competences ?: '')]"/></span>
    </div>

    <div class="pos" id="404:912" style="top:${top};left:${left + 930};width: 220px;">
        <span id="9.4" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.injuries" args="[raw(hero.injuries ?: '')]"/></span>
    </div>

    <div class="pos" id="23:928" style="top:${top + 35};left:${left};width: 385px;">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.type" args="[hero.type]"/></span>
    </div>

    <div class="pos" id="28:951" style="top:${top + 85};left:${left + 19}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.m"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 19}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.M}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 56}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.cc"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 61}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.CC}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 100}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.ct"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 106}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.CT}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 148}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.f"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 149}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.F}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 190}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.e"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 191}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.E}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 230}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.pv"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 234}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.PV}</span>
    </div>


    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 280}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.i"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 279}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.I}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 322}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.a"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 322}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.A}</span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 85};left:${left + 359}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#fff">
            <g:message code="profile.cd"/></span>
    </div>

    <div class="pos" id="28:270" style="top:${top + 112};left:${left + 364}">
        <span id="9.8" style=" font-family:Arial; font-size:13px; color:#892a1a24">
            ${hero.CD}</span>
    </div>

    <div class="pos" id="159:983" style="top:${top + 147};left:${left + 220}">
        <span id="9.8" style=" font-family:Arial; font-size:14px; color:#892a1a24">
            <g:message code="warband.warrior.experience.hero" args="[hero.fullXp]"/></span>
    </div>

    <!-- XP &#x22A0; -->
    <g:set var="cpt" value="${new Integer(1)}"/>
    <g:set var="xpLeft" value="${new Integer(440)}"/>
    <g:set var="xpTop" value="${top + 140}"/>
    <g:set var="level" value="[2, 4, 6, 8, 11, 14, 17, 20, 24, 28, 32, 36, 41, 46, 51, 57, 63, 69, 76, 83, 90]"/>
    <g:while test="${cpt <= 90}">
        <div class="pos" id="219:288" style="top:${xpTop};left:${xpLeft}">
            <g:if test="${level.contains(cpt)}">
                <span id="8.8" style=" font-family:Arial; font-size:25px; color: red;font-weight:bold">
            </g:if>
            <g:else>
                <span id="8.8" style=" font-family:Arial; font-size:25px; color: #892a1a24">
            </g:else>
            <g:if test="${hero.fullXp >= cpt}">
                &#x25A3;
            </g:if>
            <g:else>
                &#x25A2;
            </g:else>
        </span>
        </div>
        <% cpt++ %>
        <% xpLeft += 25 %>
        <g:if test="${cpt == 31 || cpt == 61}">
            <g:set var="xpTop" value="${xpTop + 25}"/>
            <g:set var="xpLeft" value="${new Integer(440)}"/>
        </g:if>

    </g:while>

    <g:set var="top" value="${top + 263}"/>

</g:each>

</body>
</html>