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

  /*addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
     $( document ).ready(function() {
        console.log("jQuery is ready");
      });
    this.addScripts('assets/js/jquery-2.1.1.js');
    this.addScripts('assets/js/bootstrap.min.js');
    this.addScripts('assets/js/plugins/metisMenu/jquery.metisMenu.js');
    //this.addScripts('assets/js/plugins/metisMenu/jquery.slimscroll.min.js');
    this.addScripts('assets/js/plugins/flot/jquery.flot.js');
    this.addScripts('assets/js/plugins/flot/jquery.flot.tooltip.min.js');
    this.addScripts('assets/js/plugins/flot/jquery.flot.spline.js');
    this.addScripts('assets/js/plugins/flot/jquery.flot.resize.js');
    this.addScripts('assets/js/plugins/flot/jquery.flot.pie.js');
    //this.addScripts('assets/js/welcome-message.js');
    this.addScripts('assets/js/plugins/peity/jquery.peity.min.js');
    this.addScripts('assets/js/demo/peity-demo.js');

    this.addScripts('assets/js/inspinia.js');
    this.addScripts('assets/js/plugins/pace/pace.min.js');
    
    this.addScripts('assets/js/plugins/jquery-ui/jquery-ui.min.js');

    this.addScripts('assets/js/plugins/gritter/jquery.gritter.min.js');

    this.addScripts('assets/js/plugins/sparkline/jquery.sparkline.min.js');

    this.addScripts('assets/js/demo/sparkline-demo.js');

    this.addScripts('assets/js/plugins/chartJs/Chart.min.js');

    this.addScripts('assets/js/plugins/toastr/toastr.min.js'); 

    
  }*/
}