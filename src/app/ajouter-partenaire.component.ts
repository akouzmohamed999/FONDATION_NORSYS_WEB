import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder,AbstractControl,Validators} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {FormValidator} from './validators/form-validator'
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
    myEmail : AbstractControl;
    myPhoneNumber : AbstractControl;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,private _ngZone:NgZone,private _location:Location){
        this.form = formBuilder.group({
            'nom' : [''],
            'type' : [''],
            'adresse' : [''],
            'email' : ['',Validators.compose([FormValidator.isValidMailFormat])],
            'numeroTelephone':['',Validators.compose([FormValidator.isAPhoneNumber])],
        })
        this.myEmail=this.form.controls['email'];
        this.myPhoneNumber=this.form.controls['numeroTelephone'];
    }

    ngOnInit(){
    }

    onSubmit(partenaire){
        this.projetService.addPartenaire(partenaire).subscribe(partenaire =>{
            if(partenaire != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listePartenaire']}}]); 
                        });
            }
        });
    }

    onAnullerclick(event){
        event.preventDefault();
         this._location.back();
    }

}