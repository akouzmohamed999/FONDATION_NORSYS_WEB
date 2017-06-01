import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-composante.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class AjouterComponsanteComponent {


    id;
    sub;
    form : FormGroup;
    thematiques;
    projet;
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'intitule' : [''],
            'thematique' : ['']
        })
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });

    this.getAllThematiques();
    this.getComposanteProjet();
    }

    onSubmit(composante){
        console.log('THEMATIQUE CHOISI '+JSON.stringify(composante.thematique));
        //composante.thematique={"idThematique":1,"intitule":"Agriculture","description":"la mise en place d'un système d'irrigation sophistiqué"};
        composante.projet=this.projet;
        this.projetService.addComposanteToProjet(composante).subscribe(ccc =>{
            if(ccc != null){
                $("#success").show();
                setTimeout(function() { $("#success").hide(); }, 3000);
                 this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.id]}}]);
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    getComposanteProjet(){
        this.projetService.getProjetByidProjet(this.id).subscribe(projet => {
            this.projet=projet;
        });
    }

    getAllThematiques(){
        this.projetService.getAllThematiques().subscribe( thematiques =>{
            this.thematiques = thematiques;
            console.log(JSON.stringify(this.thematiques));
        })
    }
    onAnullerclick(event){
        event.preventDefault();
         this._location.back();
    }
}