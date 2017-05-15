import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-rapport',
    templateUrl : './templates/ajouter-rapport.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class AjouterRapportComponent {

    form : FormGroup;
    responsables;
    partenaires;
    administrateur;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'intitule' : [''],
            'description' : [''],
            'dateDebut' : [''],
            'dateFin' : [''],
            'partenaires':[''],
            'responsable':['']
        })
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


        this.addScripts('assets/js/plugins/chosen/chosen.jquery.js');
        this.addScripts('assets/js/plugins/datapicker/bootstrap-datepicker.js');
        
        //this.addScripts('assets/js/multi-select.js');
        //this.addScripts('assets/js/wizard.js');
        this.addScripts('assets/js/submit.js');
       
  }
}