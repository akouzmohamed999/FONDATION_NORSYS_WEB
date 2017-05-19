import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'gestion-Administarteur',
  templateUrl: './templates/liste-Administrateur.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeAdministarteurComponent {

  administrateurs;
  constructor(private projetService: ProjetService,private router : Router) { }

  ngOnInit() {
    this.getAdministarteurs();
  }

  getAdministarteurs() {
    this.projetService.getAllAdministarteur().subscribe(administrateurs => {
      this.administrateurs = administrateurs;
    });
  }

  onDeleteClick(){
    console.log('CLICK RECEIVED');
    $('#myModal').hide();
     this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeAdministrateur']}}]);   
  }
}