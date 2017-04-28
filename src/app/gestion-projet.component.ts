import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import * as $ from "jquery";

@Component({
  selector: 'gestion-projet',
  templateUrl: './templates/gestion-projet.component.html'
  
})

export class GestionProjetComponent {

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

  addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
    this.addScripts('assets/js/jquery.min.js');
    this.addScripts('assets/js/metisMenu.min.js');
    this.addScripts('assets/js/custom.js');
    this.addScripts('assets/js/bootstrap.min.js')
  }
}