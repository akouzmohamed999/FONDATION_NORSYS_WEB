import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import {RouterModule,Routes} from '@angular/router';
import { CookieService } from 'angular2-cookie/services/cookies.service';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import 'rxjs/Rx';


import { AppComponent } from './app.component';
import {LoginComponent} from './login.component';
import {AdminHomeComponent} from './adminHome.component';
import {ProjetComponent} from './projet.component';
import {ComposanteComponent} from './composante.component';
import {ActiviteComponent} from './activite.component';
import {LoginService} from './services/login.service';
import {ProjetService} from './services/projet.service';

const routes  : Routes = [
  { path:'',component :LoginComponent},
  { path:'adminHome',component :AdminHomeComponent}
];

@NgModule({
  declarations: [
    AppComponent,LoginComponent,AdminHomeComponent,ProjetComponent,ComposanteComponent,ActiviteComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    ReactiveFormsModule,
    RouterModule.forRoot(routes)
  ],
  providers: [LoginService,CookieService,ProjetService],
  bootstrap: [AppComponent]
})
export class AppModule { }
