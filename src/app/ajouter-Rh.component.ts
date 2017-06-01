
import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder,Validators,AbstractControl} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {FormValidator} from './validators/form-validator';
import {IMyDpOptions} from 'mydatepicker';
import {Location} from '@angular/common'
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
    myEmail: AbstractControl;
    myPhoneNumber : AbstractControl;
    passwordError;
    private myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'dd/mm/yyyy',
    };
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,
    private router : Router,private _ngZone:NgZone,private _location:Location){
        this.form = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'Type' : [''],
            'cin' : [''],
            'password' : [''], 
            'email' :['', Validators.compose([FormValidator.isValidMailFormat])],
            'numeroTelephone':['',Validators.compose([FormValidator.isAPhoneNumber])],
            'confirmPassword' : [''],
            'dateNaissance' : [''],
            'lieuNaissance' : [''],  
        })

        this.myEmail = this.form.controls['email'];
        this.myPhoneNumber = this.form.controls['numeroTelephone'];
    }

        dateToSql(date){
            //sqlDate in SQL DATETIME format ("yyyy-mm-dd hh:mm:ss.ms")
            var sqlDateArr1 = date.split("/");
            //format of sqlDateArr1[] = ['yyyy','mm','dd hh:mm:ms']
            var sYear = sqlDateArr1[2];
            var sMonth = sqlDateArr1[1];
            var sDay = sqlDateArr1[0];
            var SqlDate=sYear+'-'+sMonth+'-'+sDay;
            return SqlDate;
        }

    onSubmit(dto){
        this.passwordError = null;
        if(dto.password != dto.confirmPassword){
            this.passwordError = "Les deux mot de passe sont pas équivalent !"
        }else{

            let collaborateur = {
            nom:dto.nom,
            prenom:dto.prenom,
            adresse:dto.adresse,
            cin:dto.cin,
            password:dto.password,
            email:dto.email,
            numeroTelephone:dto.numeroTelephone,
            dateNaissance:this.dateToSql(dto.dateNaissance.formatted),
            lieuNaissance:dto.lieuNaissance
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

    onAnullerclick(event){
      event.preventDefault();
      this._location.back();
  }
}