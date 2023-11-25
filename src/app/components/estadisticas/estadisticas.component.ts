import { Component, AfterViewInit } from '@angular/core';
import * as Highcharts from 'highcharts';
import HC_exporting from 'highcharts/modules/exporting';
import HC_exportData from 'highcharts/modules/export-data';
import { NominaServiceService } from 'src/app/services/nomina-service.service';

// Inicializa los módulos que desees utilizar (exporting, export-data, etc.)
HC_exporting(Highcharts);
HC_exportData(Highcharts);

@Component({
  selector: 'app-estadisticas',
  templateUrl: './estadisticas.component.html',
  styleUrls: ['./estadisticas.component.css'],
})
export class EstadisticasComponent {
  chartOptions1!: Highcharts.Options;
  chartOptions2!: Highcharts.Options;
  chartOptions3!: Highcharts.Options;
  chartOptions4!: Highcharts.Options;

  constructor(private nominaService: NominaServiceService) {
    this.chartOptions1 = {};
    this.chartOptions2 = {};
    this.chartOptions3 = {};
    this.chartOptions4 = {};

    this.nominaService.getDevengosTotalesPorEmpleado().subscribe(data => {
      const chartData = data.map(item => ({
        name: item.Nombre_Empleado,
        y: item.TotalDevengos
      }));

      this.chartOptions1 = {
        chart: {
          type: 'bar',
        },
        title: {
          text: 'Gráfico de Devengos por Empleado',
        },
        xAxis: {
          categories: chartData.map(item => item.name), // Ejemplo de categorías para el eje x
        },
        yAxis: {
          title: {
            text: 'Total Devengos',
          },
        },
        series: [{
          type: 'bar',
          name: 'Valor',
          data: chartData.map(item => item.y), // Datos para el eje y
        }],
        credits: {
          enabled: false,
        },
      };

      Highcharts.chart('tuContenedor1', this.chartOptions1);
    });

    this.nominaService.getDescuentosTotalesPorEmpleado().subscribe(data => {
      const chartData = data.map(item => ({
        name: item.Nombre_Empleado,
        y: item.TotalDescuentos
      }));

      this.chartOptions2 = {
        chart: {
          type: 'bar',
        },
        title: {
          text: 'Gráfico de Descuentos por Empleado',
        },
        xAxis: {
          categories: chartData.map(item => item.name), // Ejemplo de categorías para el eje x
        },
        yAxis: {
          title: {
            text: 'Total Descuentos',
          },
        },
        series: [{
          type: 'bar',
          name: 'Valor',
          data: chartData.map(item => item.y), // Datos para el eje y
          colorByPoint: true, // Esto permite que se apliquen colores por punto
        }],
        colors: ['#6460E9'], // Array de colores
        credits: {
          enabled: false,
        },
      };

      Highcharts.chart('tuContenedor2', this.chartOptions2);
    });

    this.nominaService.getMostrarMayoresSueldos().subscribe(data => {
      const chartData = data.map(item => ({
        name: item.Nombre_Empleado,
        y: item.Salario
      }));

      this.chartOptions3 = {
        chart: {
          type: 'pie', // Cambiar el tipo de gráfico a 'pie'
        },
        title: {
          text: 'Gráfico de Salarios por Empleado',
        },
        series: [{
          type: 'pie', // Cambiar el tipo de serie a 'pie'
          name: 'Valor',
          data: chartData,
        }],
        credits: {
          enabled: false,
        },
      };

      Highcharts.chart('tuContenedor3', this.chartOptions3);
    });

    this.nominaService.getMostrarPrimasOrdenadas().subscribe(data => {
      const chartData = data.map(item => ({
        name: item.Nombre_Empleado,
        y: item.Primas
      }));

      this.chartOptions4 = {
        chart: {
          type: 'column',
        },
        title: {
          text: 'Mayores Primas',
        },
        xAxis: {
          categories: chartData.map(item => item.name), // Ejemplo de categorías para el eje x
        },
        yAxis: {
          title: {
            text: 'Mayores Primas',
          },
        },
        series: [{
          type: 'column',
          name: 'Valor',
          data: chartData.map(item => item.y), // Datos para el eje y
          colorByPoint: true, // Esto permite que se apliquen colores por punto
        }],
        colors: ['#feb56a'], // Array de colores
        credits: {
          enabled: false,
        },
      };

      Highcharts.chart('tuContenedor4', this.chartOptions4);
    });

  }

}
