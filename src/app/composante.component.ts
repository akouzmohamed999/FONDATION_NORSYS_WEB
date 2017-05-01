import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'composante',
    templateUrl :'./templates/composante.component.html'
})

export class ComposanteComponent{

  

  @Input()composante;
  @Output('composanteClicked') composanteClick = new EventEmitter()
  collaborateurs;
  thematique;

  constructor (private projetService : ProjetService){};
  ngOnInit() {
    this.getThematiqueByComposante(this.composante.idComposante);
    this.getCollaborateurByComposante(this.composante.idComposante);
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
        console.log("KKKKKKKKKKK"+this.thematique);
      }
    );
  }
  onClick(){
    this.composanteClick.emit(this.composante);
  }
}