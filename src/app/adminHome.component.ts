import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';

@Component({
  selector: 'admin-home',
  templateUrl: './adminHome.component.html'
})

export class AdminHomeComponent {

  projets;
  composantes;

  constructor(private projetService: ProjetService) { }

  ngOnInit() {
    this.getAdministrateurProjects();
    this.getComposanteByProjet(1);
  
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
        console.log(composantes);
      }
    );
  }

  onClicked(projet){
    this.getComposanteByProjet(projet.idProjet);
  }

  onComposanteClicked(composante){
      console.log("88888888888"+composante);
  }
}