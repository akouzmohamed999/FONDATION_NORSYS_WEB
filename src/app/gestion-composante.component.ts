import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';

@Component({
    selector : 'gestion-composante',
    templateUrl :'./templates/gestion-composante.component.html'
})

export class GestionComposanteComponent{
    
  id;
  sub;
  composante;
  @Output('composanteClicked') composanteClick = new EventEmitter()
  collaborateurs;
  thematique; 
  activities;

  constructor (private projetService : ProjetService,private route : ActivatedRoute,private router:Router){};
  ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getComposanteByidComposante(this.id);
    //this.getActivitiesByIdComposante(this.id);
  }

  getComposanteByidComposante(idComposante){
    this.projetService.getComposanteByComposanteId(idComposante).subscribe(composante =>{
         this.composante=composante;
         //this.getThematiqueByComposante(this. composante.idComposante);
         this.getCollaborateurByComposante(this.composante.idComposante);
         //this.getActivitiesByIdComposante(this.composante.idComposante);
    });
}

 getCollaborateurByComposante(idComposante){
    this.projetService.getCollaborateurByComposante(idComposante).subscribe(
      collaborateurs => {
        this.collaborateurs=collaborateurs;
      }
    );
  }

  getThematiqueByComposante(idComposante){
    this.projetService.getThematiqueByComposante(idComposante).subscribe(
      thematique => {
        this.thematique=thematique;
      }
    );
  }

  getActivitiesByIdComposante(idCompsante){
      this.projetService.getActivitiesByComposante(idCompsante).subscribe(activities =>{
          this.activities = activities;
      });
  }
  onClick(){
    this.composanteClick.emit(this.composante);
  }
}