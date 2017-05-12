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
    composante;
    id;
    sub;

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
       
       activite.composante=this.composante;
       console.log('ACTIVITE A AJOUTE : '+activite);
        this.projetService.addActivite(activite).subscribe(activite =>{
            if(activite != null){
                 this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['gestionComposante',this.composante.idComposante]}}]); 
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

    getAllBenificiaire(){
        this.projetService.getAllBenificiaires().subscribe(
            benificiaires => {
                this.benificiaires = benificiaires;
                console.log('FFFFFFFFFFFFFFFFFFFFFF'+JSON.stringify(benificiaires));
            }
        )
    }

  onAddedClick(){
      
      console.log('HHHHHHERRRREE ADDED BENIFI');
                      $('#myModal').hide();
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

}