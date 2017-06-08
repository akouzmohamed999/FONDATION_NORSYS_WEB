import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {LoginService} from './services/login.service';

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

    constructor(formBuilder:FormBuilder, private loginService: LoginService){
        this.form = formBuilder.group({
            'email' : [''],
            'password' : ['']
        })
    }

    onSubmit(collaborateur){
        collaborateur.grant_type="pasword";
        collaborateur.client_id="clientIdPassword";
        this.loginService.logout();
        this.loginService.login(collaborateur);
    }
}