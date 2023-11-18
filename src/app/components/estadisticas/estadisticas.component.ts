import { Component, AfterViewInit } from '@angular/core';
import * as Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
import HC_exportData from 'highcharts/modules/export-data';

// Inicializa los módulos que desees utilizar (exporting, export-data, etc.)
HC_exporting(Highcharts);
HC_exportData(Highcharts);

@Component({
  selector: 'app-estadisticas',
  templateUrl: './estadisticas.component.html',
  styleUrls: ['./estadisticas.component.css'],
})
export class EstadisticasComponent implements AfterViewInit {
  chartOptions1: {};
  chartOptions2: {};

  constructor() {
    this.chartOptions1 = {
      chart: {
        type: 'bar',
      },
      title: {
        text: 'Ejemplo de Gráfico Highcharts',
      },
      series: [
        {
          data: [1, 2, 3, 4, 5],
        },
      ],
      credits: {
        enabled: false
      }
    };

    this.chartOptions2 = {
      chart: {
        type: 'line'
      },
      title: {
        text: 'Gráfico 2'
      },
      series: [{
        data: [5, 4, 3, 2, 1]
      }],
      credits: {
        enabled: false
      }
    };
  }

  ngAfterViewInit() {
    Highcharts.chart('tuContenedor1', this.chartOptions1);
    Highcharts.chart('tuContenedor2', this.chartOptions2);
  }
}
