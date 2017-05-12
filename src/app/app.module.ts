import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
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
import {ModifierComponsanteComponent} from './modifier-composante.component';
import {SupprimerComponsanteComponent} from './supprimer-composante.component';
import {AjouterComponsanteComponent} from './ajouter-composante.component';
import {AjouterProjetComponent} from './ajouter-projet.component';
import {ActiviteDetailsComponent} from './activite-details.component';
import {AjouterActiviteComponent} from './ajouter-activite.component';
import {AjouterBenificiaireActiviteComponent} from './ajouter-benificiaire-activite.component';
import {ListePartenairesComponent} from './liste-partenaires.component';
import {AjouterPartenaireComponent} from './ajouter-partenaire.component';
import {ModifierPartenaireComponent} from './modifier-partenaire.component';
import {SupprimerPartenaireComponent} from './supprimer-partenaire.component';
import {ListeCollaborateurComponent} from './liste-Rh.component';
// import {AjouterCollaborateurComponent} from './ajouter-Rh.component';
// import {ModifierCollaborateurComponent} from './modifier-Rh.component';
// import {SupprimerCollaborateurComponent} from './supprimer-Rh.component';
import {ModifierActiviteComponent} from './modifier-activite.component';
import {ListeBenificiairesComponent} from './liste-benificiaires.component';
import{ModifierBenificiaireActiviteComponent} from './modifier-benificiaire.comonent';
import {SupprimerBenificiaireComponent} from './supprimer-benificiaire.component';

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
     { path:'ajouterProjet',component : AjouterProjetComponent,outlet :'adminHomeRoute'},
     { path:'modifierComposante/:id',component : ModifierComponsanteComponent,outlet :'adminHomeRoute'},
     { path:'supprimerComposante/:id',component : SupprimerComponsanteComponent,outlet :'adminHomeRoute'},
     { path:'activiteDetails/:id',component :ActiviteDetailsComponent,outlet :'adminHomeRoute'},
     { path:'ajouterActivite/:id',component :AjouterActiviteComponent,outlet :'adminHomeRoute'},
     { path:'listePartenaire',component :ListePartenairesComponent,outlet :'adminHomeRoute'},
     { path:'ajouterPartenaire',component :AjouterPartenaireComponent,outlet :'adminHomeRoute'},
     { path:'modifierPartenaire/:id',component :ModifierPartenaireComponent,outlet :'adminHomeRoute'},
     { path:'deletePartenaire/:id',component :SupprimerPartenaireComponent,outlet :'deletePartenaireRoute'},
     { path:'listeCollaborateur',component :ListeCollaborateurComponent,outlet :'adminHomeRoute'},
     { path:'modifierActivite/:id',component :ModifierActiviteComponent,outlet :'adminHomeRoute'},
     { path:'listeBenificiaire',component :ListeBenificiairesComponent,outlet :'adminHomeRoute'},
     { path:'modifierBenificiaire/:id',component :ModifierBenificiaireActiviteComponent,outlet :'adminHomeRoute'},
  ]},
];

@NgModule({
  declarations: [
    AppComponent,LoginComponent,AdminHomeComponent,ProjetComponent,ComposanteComponent,
    ActiviteComponent,GestionProjetComponent,StatistiquesComponent,ProjetDetailsComponent,
    CollaborateurComponent,ThematiqueComponent,PartenaireComponent,GestionComposanteComponent,
    AjouterComponsanteComponent,AjouterProjetComponent,ModifierComponsanteComponent,SupprimerComponsanteComponent,
    ActiviteDetailsComponent,AjouterActiviteComponent,ListePartenairesComponent,AjouterPartenaireComponent,ModifierPartenaireComponent,
    SupprimerPartenaireComponent,ListeCollaborateurComponent,ModifierActiviteComponent,AjouterBenificiaireActiviteComponent,
    ListeBenificiairesComponent,ModifierBenificiaireActiviteComponent,SupprimerBenificiaireComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    ReactiveFormsModule,
    RouterModule.forRoot(routes)
  ],
  providers: [LoginService,ProjetService],
  bootstrap: [AppComponent]
})
export class AppModule { }
