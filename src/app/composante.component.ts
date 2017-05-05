import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';

@Component({
    selector : 'composante',
    templateUrl :'./templates/composante.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css','../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/toastr/toastr.min.css','../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class ComposanteComponent{

  @Input()composante;
  nombreCollaborateurs;

  constructor (private projetService : ProjetService,private router:Router){};
  ngOnInit() {
    this.getCollaborateurByComposante(this.composante.idComposante);
  }

 getCollaborateurByComposante(idComposante){
    this.projetService.getCollaborateurByComposante(idComposante).subscribe(
      collaborateurs => {
        this.nombreCollaborateurs=collaborateurs.length;
      }
    );
  }

  onClick(idComposante){  
    this.router.navigate(['/gestionProjet',{outlets:{'adminHomeRoute':['gestionComposante/'+idComposante]}}]);
}
}