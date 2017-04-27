import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router} from '@angular/router';


@Component({
  selector: 'admin-home',
  templateUrl: './adminHome.component.html'
  
})

export class AdminHomeComponent {

  constructor(private projetService: ProjetService,private router : Router ) { }

  onGestionProjetComponentClick(){
     this.router.navigate(['adminHome/gestionProjets']);
  }

  onStatistiquesComponentClick(){
    this.router.navigate(['adminHome/statistiques']);
  }
  
  ngOnInit(){
     this.router.navigate(['adminHome/statistiques']);
  }
}