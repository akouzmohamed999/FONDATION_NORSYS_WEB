import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {PropositionService} from './services/proposition.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'supprimer-rendezVous',
    templateUrl : './templates/supprimer-rendez-vous.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class SupprimerRendezVousComponent {


    id;
    sub;
    rendezVous;
    constructor(formBuilder:FormBuilder, private propositionService: PropositionService,private route:ActivatedRoute,private router:Router,private _location:Location){
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getRendezVous(this.id);
    }

    onSupprimerclick(){
        this.propositionService.deleteRendezVous(this.rendezVous.idRendezVous).subscribe(
            ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeRendezVous']}}])
        )
    }

    getRendezVous(idRendezVous){
        this.propositionService.getRendezVousById(idRendezVous)
        .subscribe(rendezVous => {
            this.rendezVous=rendezVous;
        });
    }

    onAnullerclick(){
         this._location.back();
    }
}