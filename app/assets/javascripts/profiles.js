// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function isProfilePage() {
    return $('#profile_card').length > 0;
}

function isWallPage() {
    return $('#wall_container').length > 0;
}
function activate_nav_links() {
    if (isProfilePage()) {
        $('#profile_nav_link').addClass('active');
    }
    if (isWallPage()) {
        $('#wall_nav_link').addClass('active');
    }
}
$(document).ready(function () {
    activate_nav_links();
});
