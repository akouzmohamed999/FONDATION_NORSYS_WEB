import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-projet.component.html'
})

export class AjouterProjetComponent {

    form : FormGroup;
    collaborateurs;
    partenaires;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute){
        this.form = formBuilder.group({
            'intitule' : [''],
            'description' : [''],
            'dateDebut' : [''],
            'dateFin' : ['']
        })
    }

    ngOnInit(){
        this.getAllCollaborateur();
        this.getAllPartenaires();
    }
   addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
     $( document ).ready(function() {
        console.log("jQuery is ready");
      });


        this.addScripts('assets/js/plugins/chosen/chosen.jquery.js');
        this.addScripts('assets/js/multi-select.js');
        this.addScripts('assets/js/plugins/datapicker/bootstrap-datepicker.js');
        this.addScripts('assets/js/wizard.js');
        this.addScripts('assets/js/date-picker.js');
       
  }


  getAllCollaborateur(){
      this.projetService.getAllCollaborateur().subscribe(collaborateurs => {
          this.collaborateurs = collaborateurs;
      })
  }

  getAllPartenaires(){
      this.projetService.getAllPartenaire().subscribe(partenaires =>{
          this.partenaires = partenaires;
      })
  }

    onSubmit(projet){
        this.projetService.addProjet(projet).subscribe(projet =>{
            if(projet != null){
                console.log("Ca passe redirection now");
            }
        });
    }
}