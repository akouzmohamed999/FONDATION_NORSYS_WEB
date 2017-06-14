import { Component } from '@angular/core';
import { ProjetService } from './services/projet.service';
import {PropositionService} from './services/proposition.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-rendez-vous',
  templateUrl: './templates/liste-rendez-vous.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListeRendezVousComponent {

  rendezVous;
  rendezVousFilter:any = {sujet :'',date:''}
  constructor(private propositionService: PropositionService,private router : Router) { }

  ngOnInit() {
    this.getAdministrateurProjects();
  }

  getAdministrateurProjects() {
    this.propositionService.getAllRendezVous().subscribe(rendezVous => {
      this.rendezVous = rendezVous;
    });
  }
}