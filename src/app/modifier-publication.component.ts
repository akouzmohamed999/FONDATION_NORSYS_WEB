import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {PublicationService} from './services/publication.service';
import {ProjetService} from './services/projet.service'
import {Location} from '@angular/common';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import * as $ from 'jquery';

@Component({
    selector : 'modifier-publication',
    templateUrl : './templates/modifier-publication.component.html',
    styleUrls : ['../assets/css/bootstrap.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css','../assets/css/plugins/switchery/switchery.css']
})

export class ModifierPublicationComponent {

    id;
    sub;
    form : FormGroup;
    projets;
    publication;
    constructor(formBuilder:FormBuilder,
    private projetService:ProjetService, private publicationService: PublicationService,private route:ActivatedRoute,private router:Router,private _location:Location){
        this.form = formBuilder.group({
            'titre' : [''],
            'description' : [''],
            'projet':[''],
            'visible':['']
        })
    }

    ngOnInit() {
    this.sub = this.route.params.subscribe(params => {
        this.id= +params['id'];
    });
    this.getPublication(this.id);
    this.getAllProjets();
}


 addScripts(chemin){
    var script = document.createElement( 'script' );
    script.type = 'text/javascript';
    script.src = chemin;
    $("body").append( script );
  }

  ngAfterViewInit(){
      
        this.addScripts('assets/js/submitPhoto.js');  
        this.addScripts('assets/js/plugins/iCheck/icheck.min.js');     
        this.addScripts('assets/js/plugins/switchery/switchery.js');       
  }

    onSubmit(publication){
        this.publicationService.updatePublication(publication).subscribe(ccc =>{
            if(ccc != null){
                $('#idPublication').val(ccc.idPublication);
               $('#btnSubmit').click();
                 this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listePublication']}}]);
            }else{
                $("#fail").show();
               setTimeout(function() { $("#fail").hide(); }, 3000);
            }
        });
    }

    getPublication(idPublication){
        this.publicationService.getPublicationById(idPublication).subscribe(
            publication => {
                this.publication = publication;
            }
        )
    }

    getAllProjets(){
        this.projetService.getAdminProjets().subscribe( projets =>{
            this.projets = projets;
        })
    }
    onAnullerclick(event){
        event.preventDefault();
         this._location.back();
    }
}