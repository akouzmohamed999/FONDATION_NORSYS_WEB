import { Component,Input } from '@angular/core';
import { PropositionService } from './services/proposition.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'proposition-details',
  templateUrl: './templates/proposition-details.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class PropositionDetailsComponent {

  id;
  proposition;

  constructor (private propositionService : PropositionService,private route : ActivatedRoute,private router:Router){};
  ngOnInit() {
    this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getPropositionById(this.id);
    
  }


   addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
        this.addScripts('assets/js/downloadAnnexe.js');
  }


  getPropositionById(idProposition){
    this.propositionService.getPropositionByid(idProposition).subscribe(proposition => {
      if(proposition.etat=="NonVue"){
              proposition.etat="Vue";
          this.propositionService.updateProposition(proposition).subscribe(
            propositionFinale =>{
              
              this.proposition = propositionFinale;
            }
          )
      }else{
        this.proposition = proposition;
      }     
    })
  }

}