import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'admin-home',
  templateUrl: './templates/adminHome.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css','../assets/font-awesome/css/font-awesome.css',
  '../assets/css/plugins/toastr/toastr.min.css','../assets/js/plugins/gritter/jquery.gritter.css',
  '../assets/css/animate.css','../assets/css/style.css']
  
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
   // this.addScripts('assets/js/metisMenu.min.js');
   // this.addScripts('assets/js/custom.js');
    this.addScripts('assets/js/bootstrap.min.js')
  }
}