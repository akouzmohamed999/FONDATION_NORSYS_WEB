import { Component } from '@angular/core';
import {Location} from '@angular/common'
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-rapports',
  templateUrl: './templates/liste-rapports.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeRapportsComponent {

    rapports;
    rapportFilter:any = {intitule :'',fichierRapport:''}
    constructor(private projetService: ProjetService,
    private route:ActivatedRoute,private router:Router,private _location:Location){
    }

    ngOnInit() {
       this.getRapports();
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
         this.addScripts('assets/js/downloadRapport.js');
  }

  getRapports(){
    this.projetService.getAllRapports().subscribe(
      rapports => {
        this.rapports=rapports;
      }
    )
  }

}