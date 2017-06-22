import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder,AbstractControl,Validators} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {FormValidator} from './validators/form-validator';
import {IMyDpOptions} from 'mydatepicker';
import * as $ from 'jquery'

@Component({
    selector : 'modifier-Rh',
    templateUrl : './templates/modifier-Rh.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class ModifierCollaborateurComponent {

    form : FormGroup;
     id;
    sub;
    collaborateur;
    myEmail: AbstractControl;
    myPhoneNumber : AbstractControl;
    passwordError;
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
            'password' : [''],
            'confirmPassword' : [''],
            'dateNaissance' : [''],
            'lieuNaissance' : [''],
            'email' :['', Validators.compose([FormValidator.isValidMailFormat])],
            'numeroTelephone':['',Validators.compose([FormValidator.isAPhoneNumber])],
            
        })
        this.myEmail = this.form.controls['email'];
        this.myPhoneNumber = this.form.controls['numeroTelephone'];
    }

    ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getCollaborateurByIdCollaborateur(this.id);
    }

    onSubmit(dto){
        this.passwordError = null;
        if(dto.password != dto.confirmPassword){
            this.passwordError = "Les deux mot de passe sont pas équivalent !"
        }else{

           
            this.collaborateur.nom=dto.nom,
             this.collaborateur.prenom=dto.prenom,
            this.collaborateur.adresse=dto.adresse,
            this.collaborateur.cin=dto.cin,
            this.collaborateur.password=dto.password,
             this.collaborateur.email=dto.email,
             this.collaborateur.numeroTelephone=dto.numeroTelephone,
             this.collaborateur.dateNaissance=this.dateToSql(dto.dateNaissance.formatted),
             this.collaborateur.lieuNaissance=dto.lieuNaissance
        
        
            this.projetService.updateCollaborateur(this.collaborateur).subscribe(
                collaborateur =>{

                    if(collaborateur != null){
                         $('#idCollaborateur').val(collaborateur.idCollaborateur);
                         $('#btnSubmit').click();
                        this._ngZone.run(() => {
                                this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]); 
                                });
                    }
                            }
            )

        }       
    }

    onAnullerclick(){
         this._location.back();
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

    getCollaborateurByIdCollaborateur(idCollaborateur){
        this.projetService.getCollaborateurByidCollaborateur(idCollaborateur).subscribe(Collaborateur =>
        {
            this.collaborateur=Collaborateur;
            console.log('Collaborateur : '+JSON.stringify(this.collaborateur));
        })
    }

    addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
        this.addScripts('assets/js/submitPhotoCollaborateur.js');  
  }
}