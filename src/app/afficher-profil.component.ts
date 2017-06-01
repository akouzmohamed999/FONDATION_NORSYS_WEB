import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {Location} from "@angular/common";
import {ProjetService} from './services/projet.service';
import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
import {IMyDpOptions} from 'mydatepicker';
import * as $ from 'jquery'

@Component({
    selector : 'afficher-profil',
    templateUrl : './templates/afficher-profil.component.html',
     styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})
export class AfficherProfilComponent {

    collaborateur;

    constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,private router : Router,
    private _location:Location){
        
      }

      private myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'yyyy-mm-dd',
    };

ngOnInit(){
    this.getCollaborateur();
}
    
  onAnullerclick(){
         this._location.back();
    }

    getCollaborateur(){
        this.projetService.getCollaborateurByidCollaborateur(localStorage.getItem("loggedUserId")).subscribe(
            collaborateur => {
                this.collaborateur=collaborateur;
            }
        );
    }


  onAddedClick(){

                      $('#myModal').hide();
  }


}