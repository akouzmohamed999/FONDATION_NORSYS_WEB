import {Component,Input} from "@angular/core";
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
    @Input() composante;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
      
    }    
    onSupprimerclick(){
        this.projetService.deleteComposante(this.composante.idComposante).subscribe(
            ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.composante.projet.idProjet]}}])
        )
    }

    onAnullerclick(){
            $('#myModal').hide();
    }
}