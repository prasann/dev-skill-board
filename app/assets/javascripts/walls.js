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

function draw_chart(container_name, title, series_name, series_data) {
    new Highcharts.Chart({
        chart: {renderTo: container_name},
        title: {text: title},
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
                name: series_name,
                data: series_data
            }
        ]
    });
}