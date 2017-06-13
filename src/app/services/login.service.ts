import { Injectable,NgZone } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import {RouterModule,Routes,Router} from '@angular/router';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';


@Injectable()
export class LoginService {

     APIURL = 'http://localhost:8080/fondation';

    constructor(private http: Http,private router:Router,private _ngZone:NgZone){}

        login(collaborateur){
         
            localStorage.setItem("access_token", null);
            
            let headers = new Headers();
            headers.append("Authorization","Basic Y2xpZW50SWRQYXNzd29yZDpzZWNyZXQ=");
            headers.append("Content-Type","application/x-www-form-urlencoded");
            let options = new RequestOptions({headers: headers});
            var data = "grant_type=password&client_id=clientIdPassword&username="
            +collaborateur.email+"&password="+collaborateur.password;
            return this.http.post(this.APIURL+'/oauth/token',data
            ,options).map(response => response.json());
        }

        getLoggedUser(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/loggedUser',{headers:headers})
            .map(response => response.json());
        }

        logout(){
                    localStorage.setItem("loggedUserId", null);
                    localStorage.setItem("loggedUserName",null);
                    localStorage.setItem("loggedUserRole", null);
        }
}