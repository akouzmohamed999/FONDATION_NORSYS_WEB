import {Component,Input,Output,EventEmitter} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'modifier-benificiaire',
    templateUrl : './templates/modifier-benificiaire.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class ModifierBenificiaireActiviteComponent {



    form : FormGroup;
    @Output('added')added= new EventEmitter();



    id;
    sub;
    benificiaire;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,
    private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'nom' : [''],
            'prenom' : [''],
            'adresse' : [''],
            'ville' : [''],
            'CIN' : [''],
            'age' : [''],
            'numeroTelephone' : [''],
            'pays' : ['']
        });
    }

    ngOnInit() {
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
       this.getBenificiaireById(this.id);
    }

    onSubmit(benificiaire){

        console.log('THEMATIQUE CHOISI '+JSON.stringify(benificiaire));
        this.benificiaire.nom=benificiaire.nom;
        this.benificiaire.prenom=benificiaire.prenom;
        this.benificiaire.adresse=benificiaire.adresse;
        this.benificiaire.ville=benificiaire.ville;
        this.benificiaire.CIN=benificiaire.CIN;
        this.benificiaire.age=benificiaire.age;
        this.benificiaire.numeroTelephone=benificiaire.numeroTelephone;
        this.benificiaire.pays=benificiaire.pays;

        this.projetService.updateBenificiaire(this.benificiaire).subscribe(ccc =>{
            if(ccc != null){
                $("#success").show();
                setTimeout(function() { $("#success").hide(); }, 3000);
                 this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeBenificiaire']}}]);
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    getBenificiaireById(idBenificiaire){
         this.projetService.getBenificiaireById(this.id).subscribe(
             benificiaire =>{
                 this.benificiaire=benificiaire;
                       console.log('GGGGG'+JSON.stringify(this.benificiaire));
             }
         )
    }
    onAnullerclick(){
           this._location.back();
    }
}