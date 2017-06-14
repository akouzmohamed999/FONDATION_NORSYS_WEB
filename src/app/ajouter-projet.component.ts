import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder,Validators,AbstractControl} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {IMyDpOptions} from 'mydatepicker';
import {Location} from '@angular/common';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-projet',
    templateUrl : './templates/ajouter-projet.component.html',
    styleUrls:["../assets/css/bootstrap.css",
               "../assets/font-awesome/css/font-awesome.css",
               "../assets/css/plugins/iCheck/custom.css",
               "../assets/css/plugins/steps/jquery.steps.css",
               "../assets/css/plugins/nouslider/jquery.nouislider.css",
               "../assets/css/plugins/datapicker/datepicker3.css",
               "../assets/css/animate.css",
               "../assets/css/style.css"]
})

export class AjouterProjetComponent {

    form : FormGroup;
    responsables;
    partenaires;
    administrateur;
    partenaireFilter :any = {nom:'',email:''};
    selectedPartenaires = [];
    erreurPartenaires;
    erreurDates;
    private myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'dd/mm/yyyy',
    };

    myIntitule : AbstractControl;
    myDescription : AbstractControl;
    myDateDebut : AbstractControl;
    myDateFin : AbstractControl;
    myResponsable : AbstractControl;


    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,
    private _ngZone:NgZone,private _location:Location){
        this.form = formBuilder.group({
            'intitule' : ['',Validators.compose([Validators.required])],
            'description' : ['',Validators.compose([Validators.required])],
            'dateDebut' : ['',Validators.compose([Validators.required])],
            'dateFin' : ['',Validators.compose([Validators.required])],
            'responsable':['',Validators.compose([Validators.required])]
        })

        this.myIntitule = this.form.controls['intitule'];
        this.myDescription = this.form.controls['description'];
        this.myDateDebut = this.form.controls['dateDebut'];
        this.myDateFin = this.form.controls['dateFin'];
        this.myResponsable = this.form.controls['responsable'];

    }

    ngOnInit(){
        this.getAllResponsable();
        this.getAllPartenaires();
        this.getAdministrateurById(localStorage.getItem("loggedUserId"));
    }
    
 addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
        this.addScripts('assets/js/plugins/iCheck/icheck.min.js');
        this.addScripts('assets/js/main.js');          
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

  getAllResponsable(){
      this.projetService.getAllResponsables().subscribe(responsable => {
          this.responsables = responsable;
      })
  }

  getAllPartenaires(){
      this.projetService.getAllPartenaire().subscribe(partenaires =>{
          this.partenaires = partenaires;
      })
  }

  getAdministrateurById(idAdministrateur){
    this.projetService.getAdministrateurById(idAdministrateur).subscribe(administrateur => {
        this.administrateur=administrateur;
    })
  }

  onAnnulerClick(event){
      event.preventDefault();
      this._location.back();
  }

    onSubmit(projet){

        this.erreurPartenaires = null;
        this.erreurDates = null;
    
        var dateDebut = projet.dateDebut.formatted;
        var debut = this.sqlToJsDate(dateDebut);
        var dateFin = projet.dateFin.formatted;
        var fin = this.sqlToJsDate(dateFin);

        projet.administrateur=this.administrateur;

        projet.dateDebut=this.dateToSql(dateDebut);
        projet.dateFin=this.dateToSql(dateFin);

        this.getSelectedPartenaires();

        if(this.selectedPartenaires.length == 0){
            this.erreurPartenaires = "Veuillez selectionez";
        }else if(debut > fin){
            console.log('entred ');
            this.erreurDates = "error date!"
         }else{
            projet.partenaires=this.selectedPartenaires;
            this.projetService.addProjet(projet).subscribe(projet =>{
            if(projet != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['gestionProjets']}}]); 
                        });
            }
        });
        }
    }

     getSelectedPartenaires(){
          this.partenaires.forEach(partenaire => { 
           var checked = $(".partenaire"+partenaire.idPartenaire).is(':checked');
           if(checked){
                this.selectedPartenaires.push(partenaire);
           }
          })
    }

    sqlToJsDate(sqlDate){
    var sqlDateArr1 = sqlDate.split("/");
    var sYear = sqlDateArr1[2];
    var sMonth = sqlDateArr1[1];
    var sDay = sqlDateArr1[0];
    return new Date(sYear,sMonth,sDay);
}

}