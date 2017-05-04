import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'gestion-projet',
  templateUrl: './templates/gestion-projet.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css','../assets/font-awesome/css/font-awesome.css',
  '../assets/css/plugins/toastr/toastr.min.css','../assets/js/plugins/gritter/jquery.gritter.css',
  '../assets/css/animate.css','../assets/css/style.css']
  
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
}