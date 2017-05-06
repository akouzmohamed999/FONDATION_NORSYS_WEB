import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';

@Component({
    selector : 'gestion-composante',
    templateUrl :'./templates/gestion-composante.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']

})

export class GestionComposanteComponent{
    
  id;
  sub;
  composante;
  collaborateurs;
  activities;

  constructor (private projetService : ProjetService,private route : ActivatedRoute,private router:Router){};
  ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getComposanteByidComposante(this.id);
    this.getActivitiesByIdComposante(this.id);
  }

  getComposanteByidComposante(idComposante){
    this.projetService.getComposanteByComposanteId(idComposante).subscribe(composante =>{
         this.composante=composante;
         this.getCollaborateurByComposante(this.composante.idComposante);
    });
}

 getCollaborateurByComposante(idComposante){
    this.projetService.getCollaborateurByComposante(idComposante).subscribe(
      collaborateurs => {
        this.collaborateurs=collaborateurs;
      }
    );
  }

  getActivitiesByIdComposante(idCompsante){
      this.projetService.getActivitiesByComposante(idCompsante).subscribe(activities =>{
          this.activities = activities;
          console.log('gggggggggggggg'+this.activities.length)
      });
  }
}