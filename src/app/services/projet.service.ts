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

        getComposanteByProjet(idProjet){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/composante?idProjet='+idProjet,{headers:headers})
            .map(response => response.json()
            );
        }

        getActivitiesByComposante(idComposante){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/activite?idComposante='+idComposante,{headers:headers})
            .map(response => response.json()
            );
        }

        getProjetByidProjet(idProjet){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/projet?idProjet='+idProjet,{headers:headers})
            .map(response => response.json()
            );
        }

        getCollaborateurByComposante(idComposante){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/collaborateur?idComposante='+idComposante,{headers:headers})
            .map(response => response.json()
            );
        }
}