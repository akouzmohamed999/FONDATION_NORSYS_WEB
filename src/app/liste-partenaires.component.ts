import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'gestion-contact',
  templateUrl: './templates/liste-partenaires.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListePartenairesComponent {

  partenaires;
  constructor(private projetService: ProjetService,private router : Router) { }
  partenaireFilter :any = {nom:'',email:'',type:''};
  ngOnInit() {
    this.getPartenaires();
  }

  getPartenaires() {
    this.projetService.getAllPartenaire().subscribe(partenaires => {
      this.partenaires = partenaires;
    });
  }

  onDeleteClick(){
    this.getPartenaires(); 
  }
}