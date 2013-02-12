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

function init_high_charts() {
    Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')]
            ]
        };
    });
}

function draw_language_chart() {
    chart = new Highcharts.Chart({
        chart: {renderTo: 'container'},
        title: {text: 'Project count based on Programming languages'},
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage}%</b>',
            percentageDecimals: 1
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'hand',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    formatter: function () {
                        return '<b>' + this.point.name + '</b>: ' + Math.round(this.percentage * 10) / 10 + ' %';
                    }
                }
            }
        },
        series: [
            {
                type: 'pie',
                name: 'Language',
                data: [
                    ['Java', 20],
                    ['Javascript', 3],
                    ['Python', 4],
                    ['Ruby', 18],
                    ['Objective-C', 2]
                ]
            }
        ]
    });
}

$(document).ready(function () {
    init_high_charts();
    activate_nav_links();
});
