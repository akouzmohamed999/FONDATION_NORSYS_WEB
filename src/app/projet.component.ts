import {Component,Input} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'projet',
    templateUrl :'./projet.component.html'
})

export class ProjetComponent{


  @Input()projet;

}