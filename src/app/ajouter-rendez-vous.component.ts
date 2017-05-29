import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {PropositionService} from './services/proposition.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {IMyDpOptions} from 'mydatepicker';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-rendez-vous',
    templateUrl : './templates/ajouter-rendez-vous.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class AjouterRendezVousComponent {

    form : FormGroup;
    proposition;
    administrateur;
    sub;
    id;

    private myDatePickerOptions: IMyDpOptions = {
        dateFormat: 'yyyy-mm-dd',
    };
    
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,
    private propositionService:PropositionService,private route:ActivatedRoute,private router : Router,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'sujet' : [''],
            'date' : ['']
        })
    }

    ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
            this.id= +params['id'];
            });
        this.getAdministrateurById(localStorage.getItem("loggedUserId"));
        this.getPropositionById(this.id);
    }

 
  getAdministrateurById(idAdministrateur){
    this.projetService.getAdministrateurById(idAdministrateur).subscribe(administrateur => {
        this.administrateur=administrateur;
    })
  }

  getPropositionById(idProposition){
    this.propositionService.getPropositionByid(idProposition).subscribe(proposition => {
        this.proposition=proposition;
    })
  }

    onSubmit(rendezVous){
        var date = rendezVous.date.formatted;
        rendezVous.administrateur=this.administrateur;
        rendezVous.porteurProjet=this.proposition.porteurProjet;
        rendezVous.date=date;
        this.propositionService.addRendezVous(rendezVous).subscribe(rendezVous =>{
            if(rendezVous != null){
                 this._ngZone.run(() => {
                            this.proposition.etat="Planifie";
                            this.propositionService.updateProposition(this.proposition).subscribe(
                                proposition => {
                                    this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['propositionDetails',this.proposition.idProposition]}}]); 
                                }
                            )
                          
                        });
            }
        });
    }
}