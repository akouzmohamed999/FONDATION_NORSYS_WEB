import { Injectable } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import { CookieService } from 'angular2-cookie/services/cookies.service';
import {RouterModule,Routes,Router} from '@angular/router';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';


@Injectable()
export class LoginService {

     APIURL = 'http://localhost:8080/fondation';

    constructor(private http: Http,private cookieService:CookieService,private router:Router){}

        login(collaborateur){
         
            let headers = new Headers();
            headers.append("Authorization","Basic Y2xpZW50SWRQYXNzd29yZDpzZWNyZXQ=");
            headers.append("Content-Type","application/x-www-form-urlencoded");
            let options = new RequestOptions({headers: headers});
            var data = "grant_type=password&client_id=clientIdPassword&username="
            +collaborateur.email+"&password="+collaborateur.password;
            return this.http.post(this.APIURL+'/oauth/token',data
            ,options).map(response => response.json()).subscribe(
                 data => {
                    // this.cookieService.put("access_token",data.access_token);
                     localStorage.setItem("access_token", data.access_token);
                     this.getLoggedUser();
                 }
            );
        }

        getLoggedUser(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/loggedUser',{headers:headers})
            .map(response => response.json()).subscribe(
                data => {
                    localStorage.setItem("loggedUser", data.Collaborateur.json());
                    localStorage.setItem("loggedUserRole", data.Role);
                    if(data.Role=='Administrateur'){
                        this.router.navigate(['adminHome']);
                             }
                      });
        }
}