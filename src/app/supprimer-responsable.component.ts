// import {Component} from "@angular/core";
// import {FormGroup,FormBuilder} from "@angular/forms";
// import {ProjetService} from './services/projet.service';
// import {Location} from '@angular/common';
// import {RouterModule,Routes,Router,ActivatedRoute} from '@angular/router';
// import * as $ from 'jquery';

// @Component({
//     selector : 'supprimer-responsable',
//     templateUrl : './templates/supprimer-responsable.component.html',
//     styleUrls : ['../assets/css/bootstrap.min.css',
//                 '../assets/font-awesome/css/font-awesome.css',
//                 '../assets/css/plugins/iCheck/custom.css',
//                 '../assets/css/plugins/toastr/toastr.min.css',
//                 '../assets/js/plugins/gritter/jquery.gritter.css',
//                 '../assets/css/animate.css','../assets/css/style.css']
// })

// export class SupprimerResponsableComponent {
//     id;
//     sub;
//     form : FormGroup;
//     responsable;
//     constructor(formBuilder:FormBuilder, private projetService: ProjetService,private route:ActivatedRoute,
//     private router:Router,private _location:Location){
//         this.form = formBuilder.group({
//             'nom' : [''],
//             'prenom' : [''],
//             'cin' : [''],
//              'adresse' : [''],
//              'email' : ['']
//         })
//     }

//     ngOnInit() {
//     this.sub = this.route.params.subscribe(params => {
//         this.id= +params['id'];
//     });
//      this.getResponsables(this.id);
//     }

//     onSupprimerclick(){
//         this.projetService.deleteResponsable(this.responsable.idResponsable).subscribe(
//             ()  => this.router.navigate(['/adminHome', {outlets: {'adminHomeRoute': ['listeResponsable']}}])
//         )
//     }

//     getResponsables(idResponsable){
//         this.projetService.getResponsableByidResponsable(idResponsable)
//         .subscribe(responsable => {
//             this.responsable = responsable;
//         });
//     }

//     onAnullerclick(){
//          this._location.back();
//     }
// }