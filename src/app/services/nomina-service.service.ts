import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class NominaServiceService {
  private apiUrl = 'http://localhost:3000/';
  agregarEmpleado: any;

  constructor(private http: HttpClient) { }

  getDevengosTotalesPorEmpleado(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl+'devengosTotalesPorEmpleado');
  }
  
  getDescuentosTotalesPorEmpleado(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl+'descuentosTotalesPorEmpleado');
  }
  
  getMostrarMayoresSueldos(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl+'mostrarMayoresSueldos');
  }
  
  getMostrarPrimasOrdenadas(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl+'mostrarPrimasOrdenadas');
  }
  
  getInformacionCompletaEmpleados(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl+'informacionCompletaEmpleados');
  }


  
}
