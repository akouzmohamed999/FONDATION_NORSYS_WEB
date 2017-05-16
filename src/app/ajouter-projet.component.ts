import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {IMyDpOptions} from 'mydatepicker';
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

    private myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'yyyy-mm-dd',
    };
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
        //this.addScripts('assets/js/date-picker.js');
       
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
        var dateDebut = projet.dateDebut.formatted;
        var dateFin = projet.dateFin.formatted;
        projet.administrateur=this.administrateur;

        projet.dateDebut=dateDebut;
        projet.dateFin=dateFin;
        this.projetService.addProjet(projet).subscribe(projet =>{
            if(projet != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['gestionProjets']}}]); 
                        });
            }
        });
    }
}