import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {IMyDpOptions} from 'mydatepicker'
import * as $ from 'jquery'

@Component({
    selector : 'modifier-activite',
    templateUrl : './templates/modifier-activite.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class ModifierActiviteComponent {

    id;
    sub;
    form : FormGroup;
    activiteDetails;
    collaborateurs;
    benificiaires;
    composante;
    
     collaborateurFilter : any = {nom : '',prenom:''};
    benificiaireFilter : any = {nom : '',prenom:''};

      private myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'dd/mm/yyyy',
    };
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'intitule' : [''],
            'dateActivite' : [''],
            'dateFin' : [''],
            'etat' : [''],
            'lieu' : [''],
            'animateurTerrain' : [''],
            'collaborateurs' : [''],
            'benificiaires' : ['']
        })
    }

   ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getActiviteById(this.id);
    this.getAllCollaborateurs();
    this.getAllBenificiaire();
    }

    onSubmit(activite){
        this.activiteDetails.intitule=activite.intitule;
        this.activiteDetails.dateActivite=activite.dateActivite;
        this.activiteDetails.dureeActivite=activite.dureeActivite;
        this.activiteDetails.etat=activite.etat;
        this.activiteDetails.lieu=activite.lieu;
        this.activiteDetails.animateurTerrain=activite.animateurTerrain;
        this.activiteDetails.composante=activite.composante;
        this.activiteDetails.benificiaires=activite.benificiaires;
        this.activiteDetails.collaborateurs=activite.collaborateurs;

        this.projetService.updateActivite(this.activiteDetails).subscribe(activite =>{
            if(activite != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['activiteDetails',this.activiteDetails.idActivite]}}]); 
                        });
                console.log("Ca passe redirection now");
            }
        });
    }

    onAnullerclick(){
         this._location.back();
    }

    getActiviteById(idActivite){
        this.projetService.getActiviteById(idActivite).subscribe(activite =>
        {
            this.activiteDetails=activite;
            this.getComposanteByIdComposante(this.activiteDetails.composante.idComposante);
        })
    }

    getAllCollaborateurs(){
        this.projetService.getAllCollaborateur().subscribe( collaborateurs => {
            this.collaborateurs=collaborateurs;
        })
    }


    getAllBenificiaire(){
        this.projetService.getAllBenificiaires().subscribe(
            benificiaires => {
                this.benificiaires = benificiaires;
               // console.log('FFFFFFFFFFFFFFFFFFFFFF'+JSON.stringify(benificiaires));
            }
        )
    }
    getComposanteByIdComposante(idComposante){
        this.projetService.getComposanteByComposanteId(idComposante).subscribe(composante => {
            this.composante=composante;
        })
    }
}
