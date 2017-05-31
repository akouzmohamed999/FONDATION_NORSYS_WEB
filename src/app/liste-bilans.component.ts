import { Component } from '@angular/core';
import {Location} from '@angular/common'
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-bilans',
  templateUrl: './templates/liste-bilans.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeBilansComponent {

    bilans;
    bilanFilter:any = {intitule :'',fichierRapport:''}
    constructor(private projetService: ProjetService,
    private route:ActivatedRoute,private router:Router,private _location:Location){
    }

    ngOnInit() {
       this.getRapports();
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
    this.projetService.getAllBilans().subscribe(
      bilans => {
        this.bilans=bilans;
      }
    )
  }

}