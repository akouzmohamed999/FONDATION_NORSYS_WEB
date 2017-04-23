import { Injectable } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import { CookieService } from 'angular2-cookie/services/cookies.service';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';


@Injectable()
export class ProjetService {

     APIURL = 'http://localhost:8080/fondation';

    constructor(private http: Http,private cookieService:CookieService){}


        getAdminProjets(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/',{headers:headers})
            .map(response => response.json()
            );
        }
}