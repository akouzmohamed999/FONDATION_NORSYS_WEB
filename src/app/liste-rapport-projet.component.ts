import { Component } from '@angular/core';
import {Location} from '@angular/common'
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-rapport-projet',
  templateUrl: './templates/liste-rapport-projet.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeRapportProjetComponent {

  
    id;
    sub;
    rapports;

    constructor(private projetService: ProjetService,
    private route:ActivatedRoute,private router:Router,private _location:Location){
    }

    ngOnInit() {
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
       this.getRapportsByIdProjet(this.id);
    }

    getRapportsByIdProjet(idProjet){
      this.projetService.getRapportByIdProjet(idProjet).subscribe(
        rapports => {
          this.rapports = rapports;
        }
      )
    }

     addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
     $( document ).ready(function() {
        console.log("jQuery is ready");
      });


        this.addScripts('assets/js/downloadRapport.js');
       
  }

}