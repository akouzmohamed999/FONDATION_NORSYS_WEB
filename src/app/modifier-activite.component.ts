import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'modifier-activite',
    templateUrl : './templates/modifier-activite.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class ModifierActiviteComponent {


    id;
    sub;
    form : FormGroup;
    activite;
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'intitule' : [''],
            'dateActivite' : [''],
            'dureeActivite' : [''],
            'etat' : [''],
            'lieu' : [''],
            'animateurTerrain' : [''],
            'composante' : [''],
            'benificiaires' : ['']
        })
    }

   ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getActiviteById(this.id);
    }

    onSubmit(activite){
        this.activite.intitule=activite.intitule;
        this.activite.dateActivite=activite.dateActivite;
        this.activite.dureeActivite=activite.dureeActivite;
        this.activite.etat=activite.etat;
        this.activite.lieu=activite.lieu;
        this.activite.animateurTerrain=activite.animateurTerrain;
        this.activite.composante=activite.composante;
        this.activite.benificiaires=activite.benificiaires;
        console.log('RRRRRRRRRRR'+JSON.stringify(this.activite));

        this.projetService.updateActivite(this.activite).subscribe(activite =>{
            if(activite != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listeActivite']}}]); 
                        });
                console.log("Ca passe redirection now");
            }
        });
    }

    onAnullerclick(){
         this._location.back();
    }

    getActiviteById(idActivite){
        this.projetService.getActiviteById(idActivite).subscribe(activite =>
        {
            this.activite=activite;
            console.log('activite : '+JSON.stringify(this.activite));
        })
    }
}
