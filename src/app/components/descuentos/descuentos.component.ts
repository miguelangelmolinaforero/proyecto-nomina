import { Component, OnInit } from '@angular/core';
import { NominaServiceService } from 'src/app/services/nomina-service.service';

@Component({
  selector: 'app-descuentos',
  templateUrl: './descuentos.component.html',
  styleUrls: ['./descuentos.component.css']
})
export class DescuentosComponent implements OnInit  {
  empleados: any[] = [];

  constructor(private nominaService: NominaServiceService) {}

  ngOnInit(): void {
    this.nominaService.getInformacionCompletaEmpleados().subscribe(data => {
      this.empleados = data;
    });
  }
}
