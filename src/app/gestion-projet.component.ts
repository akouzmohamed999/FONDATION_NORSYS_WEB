import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import * as $ from "jquery";

@Component({
  selector: 'gestion-projet',
  templateUrl: './templates/gestion-projet.component.html'
  
})

export class GestionProjetComponent {

  projets;
  projetDetails;

  constructor(private projetService: ProjetService) { }

  ngOnInit() {
    this.getAdministrateurProjects();
    this.getProjetByIdProjet(1);
    //this.getComposanteByProjet(1);
   // this.getCollaborateurByComposante(1);
  
  }

  getAdministrateurProjects() {
    this.projetService.getAdminProjets().subscribe(projets => {
      this.projets = projets;
    });
  }

 /* getComposanteByProjet(idProjet) {
    this.projetService.getComposanteByProjet(idProjet).subscribe(
      composantes => {
        this.composantes=composantes;
      }
    );
  }*/
  getProjetByIdProjet(idProjet){
    this.projetDetails = this.projetService.getProjetByidProjet(idProjet).subscribe(
      projetDetails => {
        this.projetDetails = projetDetails;
      }
    );
  }

  onClicked(projet){
    this.getProjetByIdProjet(projet.idProjet);
    //this.getComposanteByProjet(projet.idProjet);
  }

  /*onComposanteClicked(composante){
   this.getActivitiesByComposante(composante.idComposante)
  }*/


  addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
    this.addScripts('assets/js/metisMenu.min.js');
    this.addScripts('assets/js/custom.js');
    this.addScripts('assets/js/bootstrap.min.js')
  }
}