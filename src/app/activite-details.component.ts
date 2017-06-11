import { Component,Input } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";
@Component({
  selector: 'activite-details',
  templateUrl: './templates/activite-details.component.html',
  styleUrls : ['../assets/css/bootstrap.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})
export class ActiviteDetailsComponent {
	  id;
    activiteDetails;
    role=localStorage.getItem("loggedUserRole");
    constructor (private projetService : ProjetService,private route : ActivatedRoute,private router:Router){};
    ngOnInit() {
    this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getActivitiesById(this.id);
    }
      getActivitiesById(idActivite){
    this.projetService.getActiviteById(idActivite).subscribe(activite => {
      this.activiteDetails = activite;
    })
  }
}