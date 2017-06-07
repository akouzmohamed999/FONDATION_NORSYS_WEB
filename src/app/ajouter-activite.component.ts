import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {Location} from "@angular/common";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {IMyDpOptions} from 'mydatepicker';
import * as $ from 'jquery'

@Component({
    selector : 'ajouterActivite',
    templateUrl : './templates/ajouter-activite.component.html',
     styleUrls : ['../assets/css/bootstrap.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})
export class AjouterActiviteComponent {

    form : FormGroup
    formBenificaire : FormGroup
    collaborateurs;
    selectedCollaborateurs = [];
    erreurCollaborateur;
    seletedBenificiaires = [];
    erreurBenificiaire;
    benificiaires;
    composante;
    id;
    sub;
    collaborateurFilter : any = {nom : '',prenom:''};
    benificiaireFilter : any = {nom : '',prenom:''};

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,
    private _location:Location){
        
        this.form = formBuilder.group({
            'intitule' : [''],
            'dateActivite' : [''],
            'dateFin' : [''],
            'animateurTerrain' : ['']
        });
        
      }

      private myDatePickerOptions: IMyDpOptions = {
        dateFormat: 'dd/mm/yyyy',
    };

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

ngOnInit(){
     this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getComposanteById(this.id);
    this.getAllCollaborateurs();
    this.getAllBenificiaire();
}

onSubmit(activite){
       
       this.erreurBenificiaire = null;
       this.erreurCollaborateur = null;
       activite.composante=this.composante;
       activite.dateActivite=this.dateToSql(activite.dateActivite.formatted);
       activite.dateFin=this.dateToSql(activite.dateFin.formatted);
       activite.etat="En Cours";


         this.getSelectedCollaborateurs();
         this.getSelectedBenificiaires();
       
       if(this.selectedCollaborateurs.length == 0){
            this.erreurCollaborateur = "Veuillez Séléctionner des collaborateurs !"
       }else if(this.seletedBenificiaires.length == 0){
            this.erreurBenificiaire = "Veuillez Séléctionner des benificiaires !"
       }else{
        activite.collaborateurs=this.selectedCollaborateurs;
        activite.benificiaires=this.seletedBenificiaires;
         this.projetService.addActivite(activite).subscribe(activite =>{
            if(activite != null){
                 this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['gestionComposante',this.composante.idComposante]}}]); 
            }
        });
       }

       
    }
    
  onAnullerclick(event){
         event.preventDefault();
         this._location.back();
    }

    getAllCollaborateurs(){
        this.projetService.getAllCollaborateur().subscribe( collaborateurs => {
            this.collaborateurs=collaborateurs;
        })
    }

    getAllBenificiaire(){
        this.projetService.getAllBenificiaires().subscribe(
            benificiaires => {
                this.benificiaires = benificiaires;
            }
        )
    }

  onAddedClick(){
    this.getAllBenificiaire();
  }

    addBenificiaire(benificiaire){
        this.projetService.addBenificiaire(benificiaire).subscribe( benificiaire => {
            this.benificiaires.push(benificiaire);
        })
    }

    getComposanteById(idComposante){
        this.projetService.getComposanteByComposanteId(idComposante).subscribe(
            composante => this.composante=composante
        )
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

    getSelectedCollaborateurs(){
          this.collaborateurs.forEach(collaborateur => { 
           var checked = $(".collaborateur"+collaborateur.idCollaborateur).is(':checked');
           if(checked){
                this.selectedCollaborateurs.push(collaborateur);
           }
          })
    }

    getSelectedBenificiaires(){
            this.benificiaires.forEach(benificiaire => { 
           var checked = $(".benificiaire"+benificiaire.idBenificiaire).is(':checked');
           if(checked){
                this.seletedBenificiaires.push(benificiaire);
           }
          })
    }
}