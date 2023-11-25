import { Component, OnInit } from '@angular/core';
import { NominaServiceService } from 'src/app/services/nomina-service.service';


@Component({
  selector: 'app-devengos',
  templateUrl: './devengos.component.html',
  styleUrls: ['./devengos.component.css']
})
export class DevengosComponent implements OnInit {
  empleados: any[] = [];

  constructor(private nominaService: NominaServiceService) {}

  ngOnInit(): void {
    this.nominaService.getInformacionCompletaEmpleados().subscribe(data => {
      this.empleados = data;
    });
  }
}
