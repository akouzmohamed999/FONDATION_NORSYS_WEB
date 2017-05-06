import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-composante.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class AjouterComponsanteComponent {


    id;
    sub;
    form : FormGroup;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute){
        this.form = formBuilder.group({
            'intitule' : [''],
            'thematique' : ['']
        })
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    }

    onSubmit(composante){
        this.projetService.addComposanteToProjet(composante,this.id).subscribe(projet =>{
            if(projet != null){
                console.log("Ca passe redirection now");
            }
        });
    }
}