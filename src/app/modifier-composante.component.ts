import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'modifier-composante',
    templateUrl : './templates/modifier-composante.component.html',
    styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class ModifierComponsanteComponent {


    id;
    sub;
    form : FormGroup;
    thematiques;
    composante;
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
    this.getComposante(this.id);
    }

    onSubmit(composante){
        console.log('THEMATIQUE CHOISI '+JSON.stringify(composante.thematique));
        this.composante.thematique=composante.thematique;
        this.composante.intitule=composante.intitule;
        console.log('TTTTTTTTTTTTT'+JSON.stringify(this.composante));
        //composante.thematique={"idThematique":1,"intitule":"Agriculture","description":"la mise en place d'un système d'irrigation sophistiqué"};
        this.projetService.updateComposante(this.composante).subscribe(ccc =>{
            if(ccc != null){
                $("#success").show();
                setTimeout(function() { $("#success").hide(); }, 3000);
                 this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['gestionComposante',this.id]}}]);
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    getAllThematiques(){
        this.projetService.getAllThematiques().subscribe( thematiques =>{
            this.thematiques = thematiques;
        })
    }

    getComposante(idComposante){
        this.projetService.getComposanteByComposanteId(idComposante)
        .subscribe(composante => {
            this.composante = composante;
            console.log('FFFFFFFFFFFFFFF'+JSON.stringify(this.composante));
        });
    }
    onAnullerclick(){
         this._location.back();
    }
}