import { Component } from '@angular/core';
import {Location} from '@angular/common'
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-bilan-projet',
  templateUrl: './templates/liste-bilan-projet.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeBilansProjetComponent {

  
    id;
    sub;
    bilans;
    projet;
    bilanFilter:any = {intitule :'',fichierRapport:''}
    constructor(private projetService: ProjetService,
    private route:ActivatedRoute,private router:Router,private _location:Location){
    }

    ngOnInit() {
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
       this.getBilansByIdProjet(this.id);
       this.getProjetById(this.id);
    }

    getBilansByIdProjet(idProjet){
      this.projetService.getBilansByIdProjet(idProjet).subscribe(
        bilans => {
          this.bilans = bilans;
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
        this.addScripts('assets/js/downloadBilan.js');    
  }

  getProjetById(idProjet){
    this.projetService.getProjetByidProjet(idProjet).subscribe(
      projet => {
        this.projet=projet;
      }
    )
  }

}