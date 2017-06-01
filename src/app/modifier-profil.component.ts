import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'modifier-profil',
    templateUrl : './templates/modifier-profil.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class ModifierProfilComponent {

    form : FormGroup;
    collaborateur;
    ancienPasswordError;
    confirmPasswordError;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,
    private _ngZone:NgZone,private _location:Location,
    private route:ActivatedRoute){
        this.form = formBuilder.group({
           'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'cin' : [''],
            'numeroTelephone':[''],
            'oldPassword' : [''],
            'newPassword' : [''],
            'confirmPassword' : [''],
            'dateNaissance' : [''],
            'lieuNaissance' : [''],
            'email' : [],
        })
    }

    ngOnInit(){
    this.getCollaborateurByIdCollaborateur(localStorage.getItem('loggedUserId'));
    }

    onSubmit(Collaborateur){
        this.ancienPasswordError=null;
        this.confirmPasswordError=null;
        console.log('old : '+Collaborateur.oldPassword+' new '+Collaborateur.newPassword);
        if(Collaborateur.oldPassword != this.collaborateur.password){
            this.ancienPasswordError="Ancien mot de passe est incorrect !"
        }else if(Collaborateur.newPassword != Collaborateur.confirmPassword){
            this.confirmPasswordError="les mot des passes sont pas les mêmmes"
        }else{
        this.collaborateur.nom=Collaborateur.nom;
        this.collaborateur.prenom=Collaborateur.prenom;
        this.collaborateur.adresse=Collaborateur.adresse;
        this.collaborateur.email=Collaborateur.email;
        this.collaborateur.numeroTelephone=Collaborateur.numeroTelephone;
        this.collaborateur.CIN=Collaborateur.CIN;
        this.collaborateur.password=Collaborateur.password;
        this.collaborateur.dateNaissance=Collaborateur.dateNaissance;
        this.collaborateur.lieuNaissance=Collaborateur.lieuNaissance;
        this.projetService.updateCollaborateur(this.collaborateur).subscribe(Collaborateur =>{
            if(Collaborateur != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['profil']}}]); 
                        });
            }
        });
        }       
    }

    onAnullerclick(){
         this._location.back();
    }

    getCollaborateurByIdCollaborateur(idCollaborateur){
        this.projetService.getCollaborateurByidCollaborateur(idCollaborateur).subscribe(Collaborateur =>
        {
            this.collaborateur=Collaborateur;
        })
    }
}