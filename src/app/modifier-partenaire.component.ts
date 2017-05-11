import {Component,NgZone} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'modifier-composante',
    templateUrl : './templates/modifier-partenaire.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class ModifierPartenaireComponent {

    form : FormGroup;
     id;
    sub;
    partenaire;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,private _ngZone:NgZone,private _location:Location,
    private route:ActivatedRoute){
        this.form = formBuilder.group({
            'nom' : [''],
            'type' : [''],
            'adresse' : [''],
            'email' : [''],
            'numeroTelephone':['']
        })
    }

    ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getPartenaireById(this.id);
    }

    onSubmit(partenaire){
        this.partenaire.nom=partenaire.nom;
        this.partenaire.nom=partenaire.type;
        this.partenaire.nom=partenaire.adresse;
        this.partenaire.nom=partenaire.email;
        this.partenaire.nom=partenaire.numeroTelephone;
        console.log('RRRRRRRRRRR'+JSON.stringify(this.partenaire));

        this.projetService.updatePartenaire(partenaire).subscribe(partenaire =>{
            if(partenaire != null){
                 this._ngZone.run(() => {
                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['listePartenaire']}}]); 
                        });
                console.log("Ca passe redirection now");
            }
        });
    }

    onAnullerclick(){
         this._location.back();
    }

    getPartenaireById(idPartenaire){
        this.projetService.getPartenaireById(idPartenaire).subscribe(partenaire =>
        {
            this.partenaire=partenaire;
        })
    }
}