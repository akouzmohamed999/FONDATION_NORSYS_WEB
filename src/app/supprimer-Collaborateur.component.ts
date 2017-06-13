import {Component,Input,Output,EventEmitter} from "@angular/core";
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



    @Input()collaborateurId;
    @Output('deleted') deleted = new EventEmitter();
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
            }

    onSupprimerclick(){
        console.log('LOOOOOOOOOOOOOOl '+JSON.stringify(this.collaborateurId));
        this.projetService.deleteCollaborateur(this.collaborateurId).subscribe(
            //()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}])
            ()  => {
                this.deleted.emit()
                 $("#myModal").hide();
            }
        )
    }

    onAnullerclick(){
         $("#myModal").hide();
    }
}