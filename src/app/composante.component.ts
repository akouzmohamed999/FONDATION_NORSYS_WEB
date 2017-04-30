import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'composante',
    templateUrl :'./templates/composante.component.html'
})

export class ComposanteComponent{

  constructor (private projetService : ProjetService){

  }

  @Input()composante;
  collaborateurs;
  @Output('composanteClicked') composanteClick = new EventEmitter();

  ngOnInit() {
    this.getCollaborateurByComposante(this.composante.idComposante);
  
  }

 getCollaborateurByComposante(idComposante){
    this.projetService.getCollaborateurByComposante(idComposante).subscribe(
      collaborateurs => {
        this.collaborateurs=collaborateurs;
      }
    );
  }
  onClick(){
    this.composanteClick.emit(this.composante);
  }
}