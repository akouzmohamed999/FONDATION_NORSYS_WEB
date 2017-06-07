import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'gestion-Collaborateur',
  templateUrl: './templates/liste-Collaborateur.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})
export class ListeCollaborateurComponent {

  loggedAdminId=localStorage.getItem("loggedUserId");
  collaborateurs;
  collaborateurFilter:any = {email :'',nom:'',prenom:''};
  constructor(private projetService: ProjetService,private route:ActivatedRoute,private router : Router) { }

  ngOnInit() {
    this.getCollaborateurs();
  }

  getCollaborateurs() {
    this.projetService.getCollaborateurOnly().subscribe(collaborateurs => {
      this.collaborateurs = collaborateurs;
    });
  }
  onDeleteClick(){
    $('#myModal').hide();
     this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeCollaborateur']}}]);   
  }
}