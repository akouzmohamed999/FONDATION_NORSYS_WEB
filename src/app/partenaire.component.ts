import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'partenaire',
    templateUrl :'./templates/partenaire.component.html'
})

export class PartenaireComponent{
  @Input()partenaire;
}