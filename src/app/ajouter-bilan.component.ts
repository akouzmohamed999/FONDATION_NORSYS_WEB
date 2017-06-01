import {Component,NgZone} from "@angular/core";
import {FormGroup,FormBuilder,Form} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';



@Component({
    selector : 'ajouter-bilan',
    templateUrl : './templates/ajouter-bilan.component.html',
    styleUrls:['../assets/css/bootstrap.css',
               '../assets/font-awesome/css/font-awesome.css',
               '../assets/css/plugins/iCheck/custom.css',
               '../assets/css/plugins/steps/jquery.steps.css',
               '../assets/css/plugins/nouslider/jquery.nouislider.css',
               '../assets/css/plugins/datapicker/datepicker3.css',
               '../assets/css/animate.css',
               '../assets/css/style.css']

})

export class AjouterBilanComponent {

    form : FormGroup;
    projet;
    sub;
    id;
    fire_ajax_submit:any;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,private _ngZone:NgZone){
        this.form = formBuilder.group({
            'intitule' : [''],
            'type' : ['']
        })
    }


    ngOnInit(){
        this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
        this.getProjetByid(this.id);
    });
    
    }
   addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
        this.addScripts('assets/js/submitBilan.js');
       
  }
   onSubmit(bilanProjet){
        bilanProjet.projet=this.projet;
        bilanProjet.fichierBilan=$('#file').val();;
        this.projetService.addBilanProjet(bilanProjet).subscribe( bilanProjet =>{
            if(bilanProjet != null){
                      $('#btnSubmit').click();
                            this._ngZone.run(() => {

                          this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.id]}}]); 
                        });
         }
       });
    }


  getProjetByid(idProjet){
      this.projetService.getProjetByidProjet(idProjet).subscribe(projet => {
          this.projet = projet;
      })
  }

  
}