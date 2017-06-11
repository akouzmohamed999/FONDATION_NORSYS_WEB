import {Component,Input,Output,EventEmitter} from "@angular/core";
import {FormGroup,FormBuilder,Validators,AbstractControl} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {FormValidator} from './validators/form-validator'
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'ajouter-benificiaire-activite',
    templateUrl : './templates/ajouter-benificiaire-activite.component.html',
    styleUrls : ['../assets/css/bootstrap.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class AjouterBenificiaireActiviteComponent {



    form : FormGroup;
    @Output('added')added= new EventEmitter();
    myPhoneNumber : AbstractControl;
    myAge : AbstractControl;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'ville' : [''],
            'CIN' : [''],
            'age' : ['',Validators.compose([FormValidator.isAValidNumber])],
            'numeroTelephone' : ['',Validators.compose([FormValidator.isAPhoneNumber])],
            'pays' : ['']
        });
        this.myPhoneNumber=this.form.controls['numeroTelephone'];
        this.myAge=this.form.controls['age'];
    }

    ngOnInit() {
    }

    onSubmit(benificiaire){
        console.log('THEMATIQUE CHOISI '+JSON.stringify(benificiaire));

        this.projetService.addBenificiaire(benificiaire).subscribe(ccc =>{
            if(ccc != null){
                $("#success").show();
                setTimeout(function() { $("#success").hide(); }, 3000);
                 //this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.id]}}]);
                 $('#myModal').hide();
                 this.added.emit();
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    onAnnulerClick(event){
         event.preventDefault();
         $('#myModal').hide();
    }
}