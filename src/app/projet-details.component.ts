import { Component,Input } from '@angular/core';
import { ProjetService } from './services/projet.service';
import * as $ from "jquery";

@Component({
  selector: 'projet-details',
  templateUrl: './templates/projet-details.component.html'
})

export class ProjetDetailsComponent {

 @Input()projetDetails;
}