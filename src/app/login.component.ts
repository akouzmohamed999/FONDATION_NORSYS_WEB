import {Component} from "@angular/core";
import {FormGroup,FormBuilder} from "@angular/forms";
import {LoginService} from './services/login.service';

@Component({
    selector : 'login',
    templateUrl : './login.html',
    styleUrls :['./css/bootstrap.min.css','./css/style.css','./css/font-awesome.css']
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
        this.loginService.login(collaborateur);
        //this.loginService.test().subscribe();
    }
}