import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'projet',
    templateUrl :'./templates/projet.component.html'
})

export class ProjetComponent{


  @Input()projet;
  @Output('clicked')click = new EventEmitter();


  onClick(){
    this.click.emit(this.projet);
  }



}