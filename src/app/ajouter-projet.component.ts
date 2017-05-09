import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-projet.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class AjouterProjetComponent {

    form : FormGroup;
    responsables;
    partenaires;
    administrateur;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router){
        this.form = formBuilder.group({
            'intitule' : [''],
            'description' : [''],
            'dateDebut' : [''],
            'dateFin' : [''],
            'partenaires':[''],
            'responsable':['']
        })
    }

    ngOnInit(){
        this.getAllResponsable();
        this.getAllPartenaires();
        this.getAdministrateurById(localStorage.getItem("loggedUserId"));
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
        this.addScripts('assets/js/date-picker.js');
       
  }


  getAllResponsable(){
      this.projetService.getAllResponsables().subscribe(responsable => {
          this.responsables = responsable;
      })
  }

  getAllPartenaires(){
      this.projetService.getAllPartenaire().subscribe(partenaires =>{
          this.partenaires = partenaires;
      })
  }

  getAdministrateurById(idAdministrateur){
    this.projetService.getAdministrateurById(idAdministrateur).subscribe(administrateur => {
        this.administrateur=administrateur;
    })
  }

    onSubmit(projet){
        console.log('RRRRRRRRRRR'+JSON.stringify(projet));
        console.log('EEEEEEEEEEEEEEEEEEEEEEEEEEEE'+this.administrateur.idAdministrateur);
        projet.administrateur=this.administrateur;
        this.projetService.addProjet(projet).subscribe(projet =>{
            if(projet != null){
                console.log("Ca passe redirection now");
                this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['gestionProjets']}}]);
            }
        });
    }
}