import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder,Validators,AbstractControl} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {FormValidator} from './validators/form-validator'
import {IMyDpOptions} from 'mydatepicker';
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

    myEmail : AbstractControl;
    myPhoneNumber : AbstractControl;
    
    private myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'dd/mm/yyyy',
    };
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,
    private _ngZone:NgZone,private _location:Location,
    private route:ActivatedRoute){
        this.form = formBuilder.group({
           'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'cin' : [''],
            'numeroTelephone':['',Validators.compose([FormValidator.isAPhoneNumber])],
            'oldPassword' : [''],
            'newPassword' : [''],
            'confirmPassword' : [''],
            'dateNaissance' : [''],
            'lieuNaissance' : [''],
            'email' : ['',Validators.compose([FormValidator.isValidMailFormat])],
        })

        this.myEmail = this.form.controls['email'];
        this.myPhoneNumber = this.form.controls['numeroTelephone'];
    }

    ngOnInit(){
    this.getCollaborateurByIdCollaborateur(localStorage.getItem('loggedUserId'));
    }

    onSubmit(Collaborateur){
        this.ancienPasswordError=null;
        this.confirmPasswordError=null;
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
        this.collaborateur.dateNaissance=this.dateToSql(Collaborateur.dateNaissance.formatted);
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
}