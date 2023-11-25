import { Component, OnInit } from '@angular/core';
import { NominaServiceService } from 'src/app/services/nomina-service.service';

@Component({
  selector: 'app-empleados',
  templateUrl: './empleados.component.html',
  styleUrls: ['./empleados.component.css']
})
export class EmpleadosComponent implements OnInit {
  empleados: any[] = [];
  nuevoEmpleado: {} | undefined;

  constructor(private nominaService: NominaServiceService) {}

  ngOnInit(): void {
    this.nominaService.getInformacionCompletaEmpleados().subscribe(data => {
      this.empleados = data;
    });
  }

  actualizarEmpleados() {
    this.nominaService.getInformacionCompletaEmpleados().subscribe(data => {
      this.empleados = data;
    });
  }

  agregarEmpleado() {
    // Envía el objeto nuevoEmpleado al servicio para agregar el nuevo empleado
    this.nominaService.agregarEmpleado(this.nuevoEmpleado).subscribe(() => {
      // Después de agregar el empleado, actualiza la lista de empleados
      this.actualizarEmpleados();
      // Limpia los datos del nuevo empleado para el siguiente ingreso
      this.nuevoEmpleado = {};
    });
  }

}
