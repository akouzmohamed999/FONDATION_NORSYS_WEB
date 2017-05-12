import {Component,NgZone,Input,Output,EventEmitter} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'supprimer-activite',
    templateUrl : './templates/supprimer-activite.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css","../assets/css/style.css"]
})

export class SupprimerActiviteComponent {

    form : FormGroup;
    activite;
     id;
    sub;
   
    @Output('deleted') deleted = new EventEmitter();

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,private _location:Location,
    private route:ActivatedRoute,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'intitule' : [''],
            'dateActivite' : [''],
            'dureeActivite' : [''],
            'etat' : [''],
            'lieu':[''],
            'animateurTerrain' : [''],
            'composante' : [''],
            'collaborateurs':[''],
            'benificiaires':['']
        })
    }

    ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getActiviteById(this.id);
    }

    onSupprimerclick(){
         this.projetService.deleteActivite(this.activite.idActivite).subscribe(
            ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['activiteDetails']}}])
            );
    }


    getActiviteById(idActivite){
        this.projetService.getActiviteById(idActivite).subscribe(activite =>
        {
            this.activite=activite;
            console.log('activite : '+JSON.stringify(this.activite));
        })
    }
    onAnullerclick(){
          $('#myModal').hide();
    }
}