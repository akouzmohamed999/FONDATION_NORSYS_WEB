import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'supprimer-collaborateur',
    templateUrl : './templates/supprimer-Collaborateur.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class SupprimerCollaborateurComponent {


    id;
    sub;
    form : FormGroup;
    collaborateur;
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'cin' : [''],
            'adresse' : [''],
            'email' : ['']
        })
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
     this.getCollaborateur(this.id);
    }

    onSupprimerclick(){
        this.projetService.deleteCollaborateur(this.collaborateur.idCollaborateur).subscribe(
            ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}])
        )
    }

    getCollaborateur(idCollaborateur){
        this.projetService.getCollaborateurByidCollaborateur(idCollaborateur)
        .subscribe(collaborateur => {
            this.collaborateur = collaborateur;
        });
    }

    onAnullerclick(){
         this._location.back();
    }
}