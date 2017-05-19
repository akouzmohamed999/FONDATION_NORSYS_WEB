
import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-responsable',
    templateUrl : './templates/ajouter-responsable.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

 export class AjouterResponsableComponent {

    form : FormGroup;

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


    onSubmit(responsable){
        this.projetService.addResponsable(responsable).subscribe(responsable =>{
            if(responsable != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeResponsable']}}]); 
                        });
            }
        }); 
    }
    onAnullerclick(){
         this._location.back();
    }

}