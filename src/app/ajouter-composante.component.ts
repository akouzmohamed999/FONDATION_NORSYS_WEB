import {Component,Input,Output,EventEmitter} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'ajouter-composante',
    templateUrl : './templates/ajouter-composante.component.html',
    styleUrls : ['../assets/css/bootstrap.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class AjouterComponsanteComponent {


    
    form : FormGroup;
    thematiques;
    @Input()projet;
    @Output('added') added = new EventEmitter();
    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'intitule' : [''],
            'thematique' : ['']
        })
    }
    ngOnInit(){
        this.getAllThematiques();
    }
    onSubmit(composante){
        
        composante.projet=this.projet;
        this.projetService.addComposanteToProjet(composante).subscribe(ccc =>{
            if(ccc != null){
                //$("#success").show();
                //setTimeout(function() { $("#success").hide(); }, 3000);
                 //this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.projet.idProjet]}}]);
                 this.added.emit();
                 $("#myModal").hide();
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
    onAnullerclick(event){
        event.preventDefault();
        $("#myModal").hide();
    }
}