import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';

@Component({
  selector: 'admin-home',
  templateUrl: './adminHome.component.html'
})

export class AdminHomeComponent {

  projets;
  composantes;
  activites;

  constructor(private projetService: ProjetService) { }

  ngOnInit() {
    this.getAdministrateurProjects();
    this.getComposanteByProjet(1);
    this.getActivitiesByComposante(1);
  
  }

  getAdministrateurProjects() {
    this.projetService.getAdminProjets().subscribe(projets => {
      this.projets = projets;
    });
  }

  getComposanteByProjet(idProjet) {
    this.projetService.getComposanteByProjet(idProjet).subscribe(
      composantes => {
        this.composantes=composantes;
      }
    );
  }

  onClicked(projet){
    this.getComposanteByProjet(projet.idProjet);
  }

  onComposanteClicked(composante){
   this.getActivitiesByComposante(composante.idComposante)
  }

  getActivitiesByComposante(idComposante){
    this.projetService.getActivitiesByComposante(idComposante).subscribe(
      activities => {
        this.activites=activities;
      }
    );
  }
}