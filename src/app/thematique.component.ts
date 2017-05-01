import {Component,Input,Output,EventEmitter} from '@angular/core';
import {ProjetService} from './services/projet.service';

@Component({
    selector : 'thematique',
    templateUrl :'./templates/thematique.component.html'
})

export class ThematiqueComponent{ 

    @Input() thematique;
}