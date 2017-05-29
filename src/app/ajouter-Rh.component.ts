
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


    onSubmit(dto){

        let collaborateur = {
            nom:dto.nom,
            prenom:dto.prenom,
            adresse:dto.adresse,
            cin:dto.cin,
            password:dto.password,
            email:dto.email
        }
        if(dto.Type=="Administrateur"){
            this.projetService.addAdministrateur(collaborateur).subscribe(
                collaborateur =>{
                    if(collaborateur != null){
                        this._ngZone.run(() => {
                                this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]); 
                                });
                    }
                            }
            )
        }else if(dto.Type=="Responsable"){
                this.projetService.addResponsable(collaborateur).subscribe(
                collaborateur =>{
                    if(collaborateur != null){
                        this._ngZone.run(() => {
                                this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]); 
                                });
                    }
                            }
            )
        }else{
            this.projetService.addCollaborateur(collaborateur).subscribe(
                collaborateur =>{
                    if(collaborateur != null){
                        this._ngZone.run(() => {
                                this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]); 
                                });
                    }
                            }
            )
        }
    }
    
}