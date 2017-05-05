import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'collaborateur',
    templateUrl :'./templates/collaborateur.component.html'
})

export class CollaborateurComponent{


  @Input()collaborateur; 
}