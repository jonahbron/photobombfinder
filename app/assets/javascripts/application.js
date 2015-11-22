// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function () {
    var loadingIndicator = $('#loading-location');
    var errorIndicator = $('#error-location');
    var latitude = $('#bomb_latitude');
    var longitude = $('#bomb_longitude');
    var accuracy = $('#bomb_accuracy');
    $('#photobombed').click(function (e) {
        e.preventDefault();
        loadingIndicator.show();
        if ('geolocation' in navigator) {
            navigator.geolocation.getCurrentPosition(
                function(position) {
                    loadingIndicator.hide();
                    latitude.val(position.coords.latitude);
                    longitude.val(position.coords.longitude);
                    accuracy.val(position.coords.accuracy);
                },
                locationError,
                {
                    enableHighAccuracy: true,
                    timeout: 15000
                }
            );
        } else {
            locationError();
        }
    });

    function locationError() {
        errorIndicator.show();
    }
});
