import { Component } from '@angular/core';
import { PropositionService } from './services/proposition.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-proposition',
  templateUrl: './templates/liste-proposition.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListePropositionComponent {

  propositions;
  constructor(private propositionService: PropositionService,private router : Router) { }

  ngOnInit() {
    this.getAdministrateurProjects();
  }


  getAdministrateurProjects() {
    this.propositionService.getAllProposition().subscribe(propositions => {
      this.propositions = propositions;
    });
  }
}