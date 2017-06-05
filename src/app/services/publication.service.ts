import { Injectable,NgZone } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import {RouterModule,Routes,Router} from '@angular/router';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';


@Injectable()
export class PublicationService {

     APIURL = 'http://localhost:8080/fondation';

    constructor(private http: Http,private router:Router,private _ngZone:NgZone){}

       

        getAllPublications(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/publications',{headers:headers})
            .map(response => response.json()
            );
        }

        getAllVisiblePublications(){
               var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/visiblePublications',{headers:headers})
            .map(response => response.json()
            );  
        }


        addPublication(publication){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/administrateur/addPublication',publication,options)
            .map(response => response.json()
            );
        }

        updatePublication(publication){

              let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/administrateur/updatePublication',publication,options)
            .map(response => response.json()
            );
        }

        deletePublication(idPublication){

             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/administrateur/deletePublication?idPublication='+idPublication,options);
        }

        getPublicationById(idPublication){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/publicationById?idPublication='+idPublication,{headers:headers})
            .map(response => response.json()
            );
        }
}