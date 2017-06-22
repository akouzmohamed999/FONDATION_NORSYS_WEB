import {Component,NgZone,Input,Output,EventEmitter} from "@angular/core";
import {FormGroup,FormBuilder,Form} from "@angular/forms";
import {ProjetService} from './services/projet.service';
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';



@Component({
    selector : 'ajouter-rapport',
    templateUrl : './templates/ajouter-rapport.component.html',
    styleUrls:["../assets/css/bootstrap.css",
               "../assets/font-awesome/css/font-awesome.css",
               "../assets/css/plugins/iCheck/custom.css",
               "../assets/css/plugins/steps/jquery.steps.css",
               "../assets/css/plugins/nouslider/jquery.nouislider.css",
               "../assets/css/plugins/datapicker/datepicker3.css",
               "../assets/css/animate.css",
               "../assets/css/style.css"]
})

export class AjouterRapportComponent {

    form : FormGroup;
    @Input()projet;
    @Output('added')added = new EventEmitter();
    sub;
    id;
    fire_ajax_submit:any;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,
    private _ngZone:NgZone,private _location:Location){
        this.form = formBuilder.group({
            'intitule' : [''],
            'type' : ['']
        })
    }

   addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
        this.addScripts('assets/js/plugins/chosen/chosen.jquery.js');
        this.addScripts('assets/js/plugins/datapicker/bootstrap-datepicker.js');
        
        //this.addScripts('assets/js/multi-select.js');
        //this.addScripts('assets/js/wizard.js');
        this.addScripts('assets/js/submit.js');
       
  }
   onSubmit(rapportProjet){
        rapportProjet.projet=this.projet;
        var path = $('#file').val();
        var filename = path.replace(/^.*\\/, "");
        rapportProjet.fichierRapport=filename;
        this.projetService.addRapportProjet(rapportProjet).subscribe( rapportProjet =>{
            
               // this.projetService.addFichierRapport(rapportProjet.file).subscribe(
                   // message => {
                      //  fire_ajax_submit();
                      $('#btnSubmit').click();
                            this._ngZone.run(() => {
                          //this.router.navigate(['adminHome', {outlets: {'adminHomeRoute': ['projetDetails',this.id]}}]); 
                          this.added.emit();
                          $("#myModal").hide();
                        });
                   // }
                //)
         
       });
    }


  getProjetByid(idProjet){
      this.projetService.getProjetByidProjet(idProjet).subscribe(projet => {
          this.projet = projet;
      })
  }

 onAnullerclick(event){
      event.preventDefault();
      $("#myModal").hide();
  }  

  
}