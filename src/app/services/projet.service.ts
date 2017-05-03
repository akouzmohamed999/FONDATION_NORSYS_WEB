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

         getComposanteByComposanteId(idComposante){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/composanteById?idComposante='+idComposante,{headers:headers})
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

         getThematiqueByComposante(idComposante){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/thematiqueComposante?idComposante='+idComposante,{headers:headers})
            .map(response => response.json()
            );
        }

        addProjet(projet){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addComposante',projet,options)
            .map(response => response.json()
            );
        }
        
        addComposanteToProjet(composante,idProjet){
            var projet;
            this.getProjetByidProjet(idProjet).subscribe( project => {
               projet=project;
            });
             projet.composantes.push(composante); 
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addComposante',projet,options)
            .map(response => response.json()
            );
        }
}