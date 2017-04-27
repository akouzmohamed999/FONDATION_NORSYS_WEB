import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'activite',
    templateUrl :'./templates/activite.component.html'
})

export class ActiviteComponent{


  @Input()activite;
  //@Output('activiteClicked')click = new EventEmitter();


 /* onClick(){
    this.click.emit(this.activite);
  }*/



}