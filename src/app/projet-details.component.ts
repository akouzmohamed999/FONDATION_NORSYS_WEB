import { Component,Input } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'projet-details',
  templateUrl: './templates/projet-details.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class ProjetDetailsComponent {

  id;
  projetDetails;
  composantes;
  role=localStorage.getItem("loggedUserRole");

  constructor (private projetService : ProjetService,private route : ActivatedRoute,private router:Router){};
  ngOnInit() {
    this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getProjetById(this.id); 
    this.getComposantesByIdProjet(this.id);
  }

  getProjetById(idProjet){
    this.projetService.getProjetByidProjet(idProjet).subscribe(projet => {
      this.projetDetails = projet;
    })
  }

  getComposantesByIdProjet(idProjet){
    this.projetService.getComposanteByProjet(idProjet).subscribe(composantes => {
      this.composantes=composantes;
    });
  }
}