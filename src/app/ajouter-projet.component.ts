import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-projet.component.html'
})

export class AjouterProjetComponent {

    form : FormGroup;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute){
        this.form = formBuilder.group({
            'intitule' : [''],
            'description' : [''],
            'dateDebut' : [''],
            'dateFin' : ['']
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