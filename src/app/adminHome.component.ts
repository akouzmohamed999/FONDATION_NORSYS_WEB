import { Component,ChangeDetectionStrategy } from '@angular/core';
import { ProjetService } from './services/projet.service';
import { PropositionService } from './services/proposition.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'admin-home',
  templateUrl: './templates/adminHome.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
}) 

export class AdminHomeComponent {

  constructor(private projetService: ProjetService,private propositionService:PropositionService,private router : Router ) {
  }

  collaborateur;
  role;
  nombrePropositions;

  ngOnInit(){

     if( window.localStorage )
  {
    if( !localStorage.getItem('firstLoad') )
    {
      localStorage['firstLoad'] = true;
      window.location.reload();
    }  
    else
      localStorage.removeItem('firstLoad');
  } 

    this.collaborateur=localStorage.getItem("loggedUserName");
    this.role=localStorage.getItem("loggedUserRole");
    this.getNonVuePropositions();
  }

  addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
    this.addScripts('assets/js/plugins/metisMenu/jquery.metisMenu.js'); 
  }

  getNonVuePropositions(){
    this.propositionService.getAllNonVueProposition().subscribe(
      
      propositions =>{
        this.nombrePropositions=propositions.length;
      }
    )
  }
}