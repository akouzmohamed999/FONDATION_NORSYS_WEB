import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'composante',
    templateUrl :'./templates/composante.component.html'
})

export class ComposanteComponent{


  @Input()composante;
  @Output('composanteClicked') composanteClick = new EventEmitter();

  onClick(){
    this.composanteClick.emit(this.composante);
  }
}