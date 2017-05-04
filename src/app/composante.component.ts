import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';

@Component({
    selector : 'composante',
    templateUrl :'./templates/composante.component.html'
})

export class ComposanteComponent{

  @Input()composante;
  @Output('composanteClicked') composanteClick = new EventEmitter()
  collaborateurs;
  thematique;
  nombreActivites;

  constructor (private projetService : ProjetService,private router:Router){};
  ngOnInit() {
    //this.getThematiqueByComposante(this.composante.idComposante);
    this.getCollaborateurByComposante(this.composante.idComposante);
    console.log("rrrrrrrrrrrrr"+JSON.stringify(this.composante));
    this.nombreActivites=this.composante.activites.length;
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
  onClick(idComposante){  
    this.router.navigate(['/gestionProjet',{outlets:{'adminHomeRoute':['gestionComposante/'+idComposante]}}]);
}
}