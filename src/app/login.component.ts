import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {LoginService} from './services/login.service';
import {Router} from '@angular/router'

@Component({
    selector : 'login',
    templateUrl : './templates/login.component.html',
   styleUrls : ['../assets/css/bootstrap.min.css',
                '../assets/font-awesome/css/font-awesome.css',
                '../assets/css/plugins/iCheck/custom.css',
                '../assets/css/plugins/toastr/toastr.min.css',
                '../assets/js/plugins/gritter/jquery.gritter.css',
                '../assets/css/animate.css','../assets/css/style.css']
})

export class LoginComponent {

    form : FormGroup;
    loginError;
    constructor(formBuilder:FormBuilder, private loginService: LoginService,private router : Router){
        this.form = formBuilder.group({
            'email' : [''],
            'password' : ['']
        })
    }

    onSubmit(collaborateur){
        collaborateur.grant_type="pasword";
        collaborateur.client_id="clientIdPassword";
        this.loginService.logout();
        this.loginService.login(collaborateur).subscribe(
                 data => {
                    // this.cookieService.put("access_token",data.access_token);
                     localStorage.setItem("access_token", data.access_token);
                     this.loginService.getLoggedUser().subscribe(
                data => {
                            localStorage.setItem("loggedUserId", JSON.stringify(data.Collaborateur.idCollaborateur));
                            localStorage.setItem("loggedUserName", data.Collaborateur.nom+" "+data.Collaborateur.prenom);
                            localStorage.setItem("loggedUserRole", data.Role);
                    
                            this.router.navigate(['/adminHome']);     
                            
                      });
                 },
                 error => {
                    this.loginError="combinaison email/mot de passe non valide !"
                 }
            );;
    }
}