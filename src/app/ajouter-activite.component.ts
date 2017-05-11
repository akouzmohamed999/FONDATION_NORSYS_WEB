import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {Location} from "@angular/common";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouterActivite',
    templateUrl : './templates/ajouter-activite.component.html'
})
export class AjouterActiviteComponent {

    form : FormGroup
    formBenificaire : FormGroup
    collaborateurs;
    benificiaires;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,
    private _location:Location){
        
        this.form = formBuilder.group({
            'intitule' : [''],
            'dateActivite' : [''],
            'dureeActivite' : [''],
            'animateurTerrain' : [''],
            'etat' : [''],
            'collaborateurs' : [''],
            'benificiaires' : ['']
        });

         this.formBenificaire = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'ville' : [''],
            'CIN' : [''],
            'age' : [''],
            'numeroTelephone' : [''],
            'pays' : ['']
        });
        
      }

ngOnInit(){
    this.getAllCollaborateurs();
}
onSubmit(activite){
       
        $('.submitBenif').click();
        activite.benificiaires=this.benificiaires;
        this.projetService.addActivite(activite).subscribe(activite =>{
            if(activite != null){
                 this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['AjouterProjetComponent']}}]); 
                console.log("Ca passe redirection now");
            }
        });
}
  onAnullerclick(){
         this._location.back();
    }

    getAllCollaborateurs(){
        this.projetService.getAllCollaborateur().subscribe( collaborateurs => {
            this.collaborateurs=collaborateurs;
        })
    }

    onAddBenificiaire(){
        $(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $("#addBenificiaire"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();//max input box allowed
            $(wrapper).append(
        `<form (ngSubmit)="onSubmitBenificiaire(form.value)" [formGroup]="formBenificaire">
             <div class="form-control">
             <div class="row">
             <div class="col-lg-8">
             <div class="form-group">
                 <label>Nom </label> 
                 <input type="text"  required [formControl]="form.controls['nom']"  />
             </div></div></div>
              <div class="form-control">
                 <div class="row">
             <div class="col-lg-8">
             <div class="form-group">
                 <label>Prenom </label> 
                 <input type="text"  required [formControl]="form.controls['prenom']"  />
             </div></div></div></div>
              <div class="form-control">
              <div class="row">
              <div class="col-lg-8">
              <div class="form-group">
                 <label>Adresse </label> 
                 <input type="text"  required [formControl]="form.controls['adresse']"  />
             </div></div></div></div>
              <div class="form-control">
              <div class="row">
              <div class="col-lg-8">
              <div class="form-group">
                 <label>ville </label> 
                 <input type="text"  required [formControl]="form.controls['ville']"  />
             </div></div></div></div>
              <div class="form-control">
              <div class="row">
              <div class="col-lg-8">
              <div class="form-group">
                 <label>CIN </label> 
                 <input type="text"  required [formControl]="form.controls['CIN']"  />
             </div></div></div></div>
               <div class="form-control">
               <div class="row">
              <div class="col-lg-8">
              <div class="form-group">
                 <label>Age </label> 
                 <input type="text"  required [formControl]="form.controls['age']"  />
             </div></div></div></div>
              <div class="form-control">
               <div class="row">
              <div class="col-lg-8">
              <div class="form-group">
                 <label>Numero Téléphone</label> 
                 <input type="text"  required [formControl]="form.controls['numeroTelephone']"  />
             </div></div></div></div>
             <div class="form-control">
             <div class="row">
              <div class="col-lg-8">
              <div class="form-group"
                 <label>Pays</label> 
                 <input type="text"  required [formControl]="form.controls['pays']"  />
             </div> </div> </div> </div>

                    <input type="submit" class="submitBenif" style={display : hidden}>
                     <a href="#" class="remove_field">Remove</a>
           </form>  `); //add input box
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('form').remove(); x--;
    })
        });
    }

    onSubmitBenificiaire(benificiaire){
        console.log('DDDDDDDDDDDDDDDDDDDD'+benificiaire)
        this.addBenificiaire(benificiaire);
    }

    addBenificiaire(benificiaire){
        this.projetService.addBenificiaire(benificiaire).subscribe( benificiaire => {
            this.benificiaires.push(benificiaire);
        })
    }

}