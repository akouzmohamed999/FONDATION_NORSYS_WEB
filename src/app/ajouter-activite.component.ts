import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-activite',
    templateUrl : './templates/ajouter-activite.component.html'
})
export class AjouterProjetComponent {

    form : FormGroup

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute){
        this.form = formBuilder.group({
            'intitule' : [''],
            'dateActivite' : [''],
            'dureeActivite' : [''],
            'animateurTerrain' : [''],
            'etat' : [''],
            'collaborateurs' : [''],
            'benificiaires' : ['']
        })
   this.getActiviteComposante();

    }
    addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }
 onSubmit(activite){
        console.log('composante CHOISI '+JSON.stringify(projet.composante));
        //composante.thematique={"idThematique":1,"intitule":"Agriculture","description":"la mise en place d'un système d'irrigation sophistiqué"};
        activite.composante=this.activite;
        this.projetService.addActiviteToComposante(activite).subscribe(ccc =>{
            if(ccc != null){
                $("#success").show();
                setTimeout(function() { $("#success").hide(); }, 3000);
                 this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.id]}}]);
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    getActiviteComposante(){
        this.projetService.getComposanteByComposanteId(this.id).subscribe(composante => {
            this.composante=composante;
        });
    }
onAnullerclick(){
         this._location.back();
    }
       
  }