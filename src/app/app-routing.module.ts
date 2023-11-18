import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DescuentosComponent } from './components/descuentos/descuentos.component';
import { EmpleadosComponent } from './components/empleados/empleados.component';
import { EstadisticasComponent } from './components/estadisticas/estadisticas.component';
import { LoginComponent } from './components/login/login.component';
import { DevengosComponent } from './components/devengos/devengos.component';
import { IngresoEmpleadosComponent } from './components/ingreso-empleados/ingreso-empleados.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' }, // Ruta por defecto
  { path: 'login', component: LoginComponent },
  { path: 'devengos', component: DevengosComponent },
  { path: 'descuentos', component: DescuentosComponent },
  { path: 'empleados', component: EmpleadosComponent },
  { path: 'estadisticas', component: EstadisticasComponent },
  { path: 'ingresoEmpleados', component: IngresoEmpleadosComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
