
import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-administrateur',
    templateUrl : './templates/ajouter-administrateur.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

 export class AjouterAdministrateurComponent {

    form : FormGroup;
    //collaborateurs;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'cin' : [''],
            'password' : [''],
            'email' : []
        })
    }


    onSubmit(administrateur){
        //console.log('RRRRRRRRRRR'+JSON.stringify(projet));
        //console.log('EEEEEEEEEEEEEEEEEEEEEEEEEEEE'+this.administrateur.idAdministrateur);
        //projet.administrateur=this.administrateur;
        this.projetService.addAdministrateur(administrateur).subscribe(administrateur =>{
            if(administrateur != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeAdministrateur']}}]); 
                        });
                console.log("Ca passe redirection now");
            }
            
        });
    }
    onAnullerclick(){
         this._location.back();
    }

}