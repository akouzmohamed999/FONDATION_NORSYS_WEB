import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-benificiaires',
  templateUrl: './templates/liste-benificiaires.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeBenificiairesComponent {

  benificiaires;
  constructor(private projetService: ProjetService,private router : Router) { }
  benificaireFilter :any = {nom:'',prenom:'',cin:''};
  ngOnInit() {
    this.getBenificiaires();
  }

  getBenificiaires() {
    this.projetService.getAllBenificiaires().subscribe(benificiaires => {
      this.benificiaires = benificiaires;

    });
  }

  onDeleteClick(){
    console.log('CLICK RECEIVED');
    this.getBenificiaires();
  }
}