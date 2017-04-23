import {Component} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'admin-home',
    templateUrl :'./adminHome.component.html'
})

export class AdminHomeComponent{

    constructor(private projetService : ProjetService){}
  projets;

  ngOnInit(){
    this.getAdministrateurProjects();
   // console.log(this.projets);
  }

  getAdministrateurProjects(){
    return this.projetService.getAdminProjets();
    /*.subscribe(projets => {
      this.projets=projets,
    console.log(projets)},
      err => console.error(err)
      );*/
  }



}