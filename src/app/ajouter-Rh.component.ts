
import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-Rh',
    templateUrl : './templates/ajouter-Rh.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

 export class AjouterRhComponent {

    form : FormGroup;
    //collaborateurs;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'Type' : [''],
            'cin' : [''],
            'password' : [''],
            'email' : []
        })
    }


    onSubmit(collaborateur){
        //console.log('RRRRRRRRRRR'+JSON.stringify(projet));
        //console.log('EEEEEEEEEEEEEEEEEEEEEEEEEEEE'+this.administrateur.idAdministrateur);
        //projet.administrateur=this.administrateur;
        this.projetService.addCollaborateur(collaborateur).subscribe(collaborateur =>{
            if(collaborateur != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]); 
                        });
                console.log("Ca passe redirection now");
            }
        });
    }
    
}