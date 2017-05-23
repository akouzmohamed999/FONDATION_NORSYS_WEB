import { Injectable,NgZone } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import {RouterModule,Routes,Router} from '@angular/router';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';


@Injectable()
export class PropositionService {

     APIURL = 'http://localhost:8080/fondation';

    constructor(private http: Http,private router:Router,private _ngZone:NgZone){}

       

        getAllProposition(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/propositions',{headers:headers})
            .map(response => response.json()
            );
        }

        getAllNonVueProposition(){
               var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/propositionsNonVue',{headers:headers})
            .map(response => response.json()
            );  
        }

         getAllFavorisProposition(){
         var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/propositionsFavoris',{headers:headers})
            .map(response => response.json()
            );
        }

        addRendezVous(rendezVous){
              let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/administrateur/addRendezVous',rendezVous,options)
            .map(response => response.json()
            );
        }

        updateRendezVous(rendezVous){

              let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/administrateur/updateRendezVous',rendezVous,options)
            .map(response => response.json()
            );
        }

         updateProposition(proposition){

              let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/administrateur/updateProposition',proposition,options)
            .map(response => response.json()
            );
        }


        deleteRendezVous(idRendezVous){

             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/administrateur/deleteRendezVous?idRendezVous='+idRendezVous,options);
        }

        getPropositionByid(idProposition){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/projetById?idProposition='+idProposition,{headers:headers})
            .map(response => response.json()
            );
        } 

        getPorteurProjetById(idPorteurProjet){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/PorteurProjetById?idPorteurProjet='+idPorteurProjet,{headers:headers})
            .map(response => response.json()
            );
        }
}