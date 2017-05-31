import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'supprimer-composante',
    templateUrl : './templates/supprimer-composante.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class SupprimerComponsanteComponent {


    id;
    sub;
    form : FormGroup;
    thematiques;
    composante;
    idProjet;
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'intitule' : [''],
            'thematique' : ['']
        })
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getComposante(this.id);
    }

    onSupprimerclick(){
        this.projetService.deleteComposante(this.composante.idComposante).subscribe(
            ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.idProjet]}}])
        )
    }

    getComposante(idComposante){
        this.projetService.getComposanteByComposanteId(idComposante)
        .subscribe(composante => {
            this.composante = composante;
            this.idProjet=this.composante.projet.idProjet;
        });
    }

    onAnullerclick(){
         this._location.back();
    }
}