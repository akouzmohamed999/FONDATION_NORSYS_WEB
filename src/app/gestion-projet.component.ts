import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'gestion-projet',
  templateUrl: './templates/gestion-projet.component.html'
  
})

export class GestionProjetComponent {

  projets;
  projetDetails;

  constructor(private projetService: ProjetService,private router : Router) { }

  ngOnInit() {
    this.getAdministrateurProjects();
    this.getProjetByIdProjet(1);
  }

  getAdministrateurProjects() {
    this.projetService.getAdminProjets().subscribe(projets => {
      this.projets = projets;
    });
  }

  getProjetByIdProjet(idProjet){
    this.projetDetails = this.projetService.getProjetByidProjet(idProjet).subscribe(
      projetDetails => {
        this.projetDetails = projetDetails;
      }
    );
  }

  onClicked(projet){
    this.getProjetByIdProjet(projet.idProjet);
  }


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