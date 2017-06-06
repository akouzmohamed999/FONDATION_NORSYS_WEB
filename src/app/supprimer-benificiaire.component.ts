import {Component,NgZone,Input,Output,EventEmitter} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'supprimer-benificiaire',
    templateUrl : './templates/supprimer-benificiaire.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class SupprimerBenificiaireComponent {
     id;
    sub;
    @Input()benificiaire;
    @Output('deleted') delete = new EventEmitter();

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,private _location:Location,
    private route:ActivatedRoute,private _ngZone:NgZone){
    }



    onSupprimerclick(){
        this.projetService.deleteBenificiaire(this.benificiaire.idBenificiaire).subscribe(
            ()  => {
                this.delete.emit();
            }
            );
    }

    onAnullerclick(){
          $('#myModal').hide();
    }

    getBenificiaireById(idBenificiaire){
        this.projetService.getPartenaireById(idBenificiaire).subscribe(benificiaire =>
        {
            this.benificiaire=benificiaire;
        })
    }
}