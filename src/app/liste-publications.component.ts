import { Component } from '@angular/core';
import {Location} from '@angular/common'
import {PublicationService } from './services/publication.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from "jquery";

@Component({
  selector: 'liste-publication',
  templateUrl: './templates/liste-publications.component.html',
  styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
  
})

export class ListePublicationsComponent {

    publications;
    publicationFilter:any = {titre :'',description:''}
    constructor(private publicationService : PublicationService,
    private route:ActivatedRoute,private router:Router,private _location:Location){
    }

    ngOnInit() {
       this.getRapports();
    }

  getRapports(){
    this.publicationService.getAllPublications().subscribe(
      publications => {
        this.publications=publications;
      }
    )
  }

}