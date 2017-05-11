import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-partenaire.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class AjouterPartenaireComponent {

    form : FormGroup;
    responsables;
    partenaires;
    administrateur;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,private _ngZone:NgZone,private _location:Location){
        this.form = formBuilder.group({
            'nom' : [''],
            'type' : [''],
            'adresse' : [''],
            'email' : [''],
            'numeroTelephone':['']
        })
    }

    ngOnInit(){
    }

    onSubmit(partenaire){
        console.log('RRRRRRRRRRR'+JSON.stringify(partenaire));
        this.projetService.addPartenaire(partenaire).subscribe(partenaire =>{
            if(partenaire != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listePartenaire']}}]); 
                        });
                console.log("Ca passe redirection now");
            }
        });
    }

    onAnullerclick(){
         this._location.back();
    }

}