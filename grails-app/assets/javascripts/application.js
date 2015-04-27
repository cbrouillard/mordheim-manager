// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require validator
//= require fileinput
//= require responsive-tabs
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);
}

var fillHeroForm = function (data){
    console.log(data);
    $("#type").val(data.type);
    $("#M").val(data.m);
    $("#CC").val(data.CC);
    $("#CT").val(data.CT);
    $("#F").val(data.f);
    $("#E").val(data.e);
    $("#PV").val(data.PV);
    $("#I").val(data.i);
    $("#A").val(data.a);
    $("#CD").val(data.CD);
    $("#experience").val(data.startingExperience);
    $("#cost").val(data.costWithoutEquipment);
    if (data.equipment) {
        tinyMCE.get('equipment').setContent(data.equipment);
    }
    if (data.competences) {
        tinyMCE.get('competences').setContent(data.competences);
    }

    $('form[data-toggle="validator"]').validator('validate');
    $('#name').focus();
}

var fillWrenchForm = function (data){
    console.log(data);
    $("#type").val(data.type);
    $("#M").val(data.m);
    $("#CC").val(data.CC);
    $("#CT").val(data.CT);
    $("#F").val(data.f);
    $("#E").val(data.e);
    $("#PV").val(data.PV);
    $("#I").val(data.i);
    $("#A").val(data.a);
    $("#CD").val(data.CD);
    $("#experience").val(data.startingExperience);
    $("#cost").val(data.costWithoutEquipment);
    if (data.equipment) {
        tinyMCE.get('equipment').setContent(data.equipment);
    }
    if (data.rules) {
        tinyMCE.get('specialRules').setContent(data.rules);
    }

    $('form[data-toggle="validator"]').validator('validate');
    $('#name').focus();
}