import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import { CookieService } from 'angular2-cookie/services/cookies.service';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';
import 'rxjs/Rx';


import { AppComponent } from './app.component';
import {LoginComponent} from './login.component';
import {AdminHomeComponent} from './adminHome.component';
import {ProjetComponent} from './projet.component';
import {GestionProjetComponent} from './gestion-projet.component';
import {ComposanteComponent} from './composante.component';
import {ActiviteComponent} from './activite.component';
import {StatistiquesComponent} from './statistiques.component';
import {ProjetDetailsComponent} from './projet-details.component';
import {CollaborateurComponent} from './collaborateur.component';
import {ThematiqueComponent} from './thematique.component';
import {PartenaireComponent} from './partenaire.component';
import {GestionComposanteComponent} from './gestion-composante.component';
import {AjouterComponsanteComponent} from './ajouter-composante.component';
import {AjouterProjetComponent} from './ajouter-projet.component';

import {LoginService} from './services/login.service';
import {ProjetService} from './services/projet.service';

export const routes  : Routes = [
  { path:'',component :LoginComponent},
  { path:'adminHome',component :AdminHomeComponent,children :[
     { path: '', redirectTo: 'statistiques', pathMatch: 'full' },
     { path:'statistiques',component :StatistiquesComponent,outlet :'adminHomeRoute'},
     { path:'gestionProjets',component : GestionProjetComponent,outlet :'adminHomeRoute'},
     { path:'projetDetails/:id',component : ProjetDetailsComponent,outlet :'adminHomeRoute'},
     { path:'gestionComposante/:id',component : GestionComposanteComponent,outlet :'adminHomeRoute'},        
     { path:'ajouterComposante/:id',component : AjouterComponsanteComponent,outlet :'adminHomeRoute'},
     { path:'ajouterProjet',component : AjouterProjetComponent,outlet :'adminHomeRoute'}  
  ]},
];

@NgModule({
  declarations: [
    AppComponent,LoginComponent,AdminHomeComponent,ProjetComponent,ComposanteComponent,
    ActiviteComponent,GestionProjetComponent,StatistiquesComponent,ProjetDetailsComponent,
    CollaborateurComponent,ThematiqueComponent,PartenaireComponent,GestionComposanteComponent,
    AjouterComponsanteComponent,AjouterProjetComponent
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
