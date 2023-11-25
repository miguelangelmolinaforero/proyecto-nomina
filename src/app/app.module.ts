import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { EmpleadosComponent } from './components/empleados/empleados.component';
import { DescuentosComponent } from './components/descuentos/descuentos.component';
import { DevengosComponent } from './components/devengos/devengos.component';
import { EstadisticasComponent } from './components/estadisticas/estadisticas.component';
import { SideBarComponent } from './components/side-bar/side-bar.component';
import { IngresoEmpleadosComponent } from './components/ingreso-empleados/ingreso-empleados.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    EmpleadosComponent,
    DescuentosComponent,
    DevengosComponent,
    EstadisticasComponent,
    SideBarComponent,
    IngresoEmpleadosComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
