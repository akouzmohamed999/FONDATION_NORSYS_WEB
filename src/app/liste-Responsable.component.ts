import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'gestion-Responsable',
  templateUrl: './templates/liste-Responsable.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeResponsableComponent {

  responsables;
  constructor(private projetService: ProjetService,private router : Router) { }

  ngOnInit() {
    this.getResponsables();
  }

  getResponsables() {
    this.projetService.getResponsable().subscribe(responsables => {
      this.responsables = responsables;
    });
  }

  onDeleteClick(){
    console.log('CLICK RECEIVED');
    $('#myModal').hide();
     this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeResponsable']}}]);   
  }
}