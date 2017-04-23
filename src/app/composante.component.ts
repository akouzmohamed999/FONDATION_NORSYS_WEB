import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'composante',
    templateUrl :'./composante.component.html'
})

export class ComposanteComponent{


  @Input()composante;
  @Output('composanteClicked') click = new EventEmitter();

  onClick(){
    this.click.emit(this.composante);
  }
}