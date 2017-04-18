import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';


@Injectable()
export class LoginService {


    constructor(private http: Http){}

        login(collaborateur){
            var headers = new Headers({'Authorization':'Basic Y2xpZW50SWRQYXNzd29yZDpzZWNyZXQ=',
            'Content-Type':'application/x-www-form-urlencoded'});
            return this.http.post('http://localhost:8080/fondation/oauth/token',JSON.stringify(collaborateur)
            ,{headers:headers}).map(response => {console.log(response)});
        }

}