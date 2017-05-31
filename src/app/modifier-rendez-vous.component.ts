import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {PropositionService} from './services/proposition.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'modifier-rendez-vous',
    templateUrl : './templates/modifier-rendez-vous.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class ModifierRendezVousComponent {


    id;
    sub;
    form : FormGroup;
    rendezVous;
    constructor(formBuilder:FormBuilder, private propositionService: PropositionService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'sujet' : [''],
            'date' : ['']
        })
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getRendezVous(this.id);
    }

    onSubmit(rendezVous){
        this.rendezVous.sujet=rendezVous.sujet;
        this.rendezVous.date=rendezVous.date.formatted;
        this.propositionService.updateRendezVous(this.rendezVous).subscribe(ccc =>{
            if(ccc != null){
                $("#success").show();
                setTimeout(function() { $("#success").hide(); }, 3000);
                 this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeRendezVous']}}]);
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    getRendezVous(idRendezVous){
        this.propositionService.getRendezVousById(idRendezVous)
        .subscribe(rendezVous => {
            this.rendezVous = rendezVous;
        });
    }
    onAnullerclick(){
         this._location.back();
    }
}