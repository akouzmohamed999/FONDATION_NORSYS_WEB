import { Component,Input } from '@angular/core';
import { ProjetService } from './services/projet.service';
import * as $ from "jquery";

@Component({
  selector: 'projet-details',
  templateUrl: './templates/projet-details.component.html'
})

export class ProjetDetailsComponent {

 @Input()projetDetails;

  addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
   this.addScripts('assets/js/bootstrap.min.js');
    this.addScripts('assets/js/custom.js');
     this.addScripts('assets/js/metisMenu.min.js');
  }
}