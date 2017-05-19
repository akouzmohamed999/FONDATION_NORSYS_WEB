import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'modifier-Rh',
    templateUrl : './templates/modifier-Rh.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class ModifierCollaborateurComponent {

    form : FormGroup;
     id;
    sub;
    collaborateur;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,
    private _ngZone:NgZone,private _location:Location,
    private route:ActivatedRoute){
        this.form = formBuilder.group({
           'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'CIN' : [''],
            'numeroTelephone':[''],
            'password' : [''],
            'dateNaissance' : [''],
            'lieuNaissance' : [''],
            'email' : [],
        })
    }

    ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getCollaborateurByIdCollaborateur(this.id);
    }

    onSubmit(Collaborateur){
        this.collaborateur.nom=Collaborateur.nom;
        this.collaborateur.prenom=Collaborateur.prenom;
        this.collaborateur.adresse=Collaborateur.adresse;
        this.collaborateur.email=Collaborateur.email;
        this.collaborateur.numeroTelephone=Collaborateur.numeroTelephone;
        this.collaborateur.CIN=Collaborateur.CIN;
        this.collaborateur.password=Collaborateur.password;
        this.collaborateur.dateNaissance=Collaborateur.dateNaissance;
        this.collaborateur.lieuNaissance=Collaborateur.lieuNaissance;

        //console.log('RRRRRRRRRRR'+JSON.stringify(this.partenaire));

        this.projetService.updateCollaborateur(this.collaborateur).subscribe(Collaborateur =>{
            if(Collaborateur != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]); 
                        });
                //console.log("Ca passe redirection now");
            }
        });
    }

    onAnullerclick(){
         this._location.back();
    }

    getCollaborateurByIdCollaborateur(idCollaborateur){
        this.projetService.getollaborateurByidCollaborateur(idCollaborateur).subscribe(Collaborateur =>
        {
            this.collaborateur=Collaborateur;
            console.log('Collaborateur : '+JSON.stringify(this.collaborateur));
        })
    }
}