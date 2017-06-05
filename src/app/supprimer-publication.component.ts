import {Component,NgZone,Input,Output,EventEmitter} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {PublicationService} from './services/publication.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'supprimer-publication',
    templateUrl : './templates/supprimer-publication.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class SupprimerPublicationComponent {

    form : FormGroup;
     id;
    sub;
    publication;
    constructor(formBuilder:FormBuilder, private publicationService: PublicationService,private router : Router,private _location:Location,
    private route:ActivatedRoute,private _ngZone:NgZone){
           }

   ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getPublicationById(this.id);
    }

    onSupprimerclick(){
            this.publicationService.deletePublication(this.publication.idPublication).subscribe(
            ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listePublication']}}])
            );
    }

    onAnullerclick(event){
     event.preventDefault();
      this._location.back();
    }

    getPublicationById(idPublication){
        this.publicationService.getPublicationById(idPublication).subscribe(publication =>
        {
            this.publication=publication;
        })
    }
}