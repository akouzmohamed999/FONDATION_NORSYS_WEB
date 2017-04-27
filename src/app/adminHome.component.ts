import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'admin-home',
  templateUrl: './templates/adminHome.component.html'
  
})

export class AdminHomeComponent {

  constructor(private projetService: ProjetService,private router : Router ) { 
  }

  addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
    this.addScripts('assets/js/jquery.min.js');
    this.addScripts('assets/js/metisMenu.min.js');
    this.addScripts('assets/js/custom.js');
  }
}