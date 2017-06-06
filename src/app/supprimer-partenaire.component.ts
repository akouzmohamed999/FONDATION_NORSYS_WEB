import {Component,NgZone,Input,Output,EventEmitter} from "@angular/core";
import {Location} from '@angular/common'
import {FormGroup,FormBuilder} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery'

@Component({
    selector : 'supprimer-partenaire',
    templateUrl : './templates/supprimer-partenaire.component.html',
    styleUrls:["../assets/css/bootstrap.min.css",
             "../assets/font-awesome/css/font-awesome.css",
             "../assets/css/plugins/iCheck/custom.css",
              "../assets/css/plugins/steps/jquery.steps.css",
             "../assets/css/plugins/nouslider/jquery.nouislider.css",
             "../assets/css/plugins/datapicker/datepicker3.css",
            "../assets/css/animate.css",
             "../assets/css/style.css"]
})

export class SupprimerPartenaireComponent {

    form : FormGroup;
     id;
    sub;
    @Input()partenaire;
    @Output('deleted') deleted = new EventEmitter();

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private router : Router,private _location:Location,
    private route:ActivatedRoute,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'nom' : [''],
            'type' : [''],
            'adresse' : [''],
            'email' : [''],
            'numeroTelephone':['']
        })
    }

   /* ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        });
    this.getPartenaireById(this.id);
    }*/

    onSupprimerclick(){
        console.log('RRRRRRRRRRR'+JSON.stringify(this.partenaire));

        this.projetService.deletePartenaire(this.partenaire.idPartenaire).subscribe(
            //()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listePartenaire']}}])
            ()  => {
                this.deleted.emit();
            }
            );
    }

    onAnullerclick(){
          $('#myModal').hide();
    }

    getPartenaireById(idPartenaire){
        this.projetService.getPartenaireById(idPartenaire).subscribe(partenaire =>
        {
            this.partenaire=partenaire;
            console.log('partenaire : '+JSON.stringify(this.partenaire));
        })
    }
}