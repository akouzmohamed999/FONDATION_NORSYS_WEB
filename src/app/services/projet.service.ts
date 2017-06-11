import { Injectable } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';

@Injectable()
export class ProjetService {

     APIURL = 'http://localhost:8080/fondation'; 

    constructor(private http: Http){}
    
        getAdminProjets(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/projets',{headers:headers})
            .map(response => response.json()
            );
        }

        getCollaborateur(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/Collaborateurs',{headers:headers})
            .map(response => response.json()
            );
        }

        getCollaborateurOnly(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/allCollaborateurs',{headers:headers})
            .map(response => response.json()
            );
        }

        getResponsable(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/responsables',{headers:headers})
            .map(response => response.json()
            );
        }

        getComposanteByProjet(idProjet){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/composante?idProjet='+idProjet,{headers:headers})
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
            return this.http.get(this.APIURL+'/collaborateur/projet?idProjet='+idProjet,{headers:headers})
            .map(response => response.json()
            );
        }

        getCollaborateurByComposante(idComposante){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/collaborateur?idComposante='+idComposante,{headers:headers})
            .map(response => response.json()
            );
        }

        /* getThematiqueByComposante(idComposante){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/thematiqueComposante?idComposante='+idComposante,{headers:headers})
            .map(response => response.json()
            );
        }*/

        addProjet(projet){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addProjet',projet,options)
            .map(response => response.json()
            );
        }

       addActivite(activite){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addActivite',activite,options)
            .map(response => response.json()
            );
        }

        updateActivite(activite){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/responsable/updateActivite',activite,options)
            .map(response => response.json()
            );
        }
        
       deleteActivite(idActivite){
             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/responsable/deleteActivite?idActivite='+idActivite,options);
        }

        addComposanteToProjet(composante){
        
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addComposante',composante,options)
            .map(response => response.json()
            );
          }

        updateComposante(composante){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/responsable/updateComposante',composante,options)
            .map(response => response.json()
            );
        }

        deleteComposante(idComposante){
             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/responsable/deleteComposante?idComposante='+idComposante,options);
        }

        getAllBenificiaires(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/benificiaires',{headers:headers})
            .map(response => response.json()
            );
        }

        addBenificiaire(benificiaire){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addBenificiaire',benificiaire,options)
            .map(response => response.json()
            );
        }

        addPartenaire(partenaire){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/administrateur/addPartenaire',partenaire,options)
            .map(response => response.json()
            );
        }

        updatePartenaire(partenaire){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/administrateur/updatePartenaire',partenaire,options)
            .map(response => response.json()
            );
        }

        deletePartenaire(idPartenaire){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/administrateur/deletePartenaire?idPartenaire='+idPartenaire,options);
        }

        getPartenaireById(idPartenaire){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/partenaireById?idPartenaire='+idPartenaire,{headers:headers})
            .map(response => response.json()
            );
        }

         getCollaborateurByidCollaborateur(idCollaborateur){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/collaborateurById?idCollaborateur='+idCollaborateur,{headers:headers})
            .map(response => response.json()
            );
        }

        getResponsableByidResponsable(idResponsable){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/responsableById?idResponsable='+idResponsable,{headers:headers})
            .map(response => response.json()
            );
        }


        getBenificiaireById(idBenificiaire){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/findBenificiaire?idBenificiaire='+idBenificiaire,{headers:headers})
            .map(response => response.json()
            );
        }

        updateBenificiaire(benificiaire){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/responsable/updateBenificiaire',benificiaire,options)
            .map(response => response.json()
            );
        }

        deleteBenificiaire(idBenificiaire){
             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/responsable/deleteBenificiaires?idBenificiaire='+idBenificiaire,options);
        }

        getAllCollaborateur(){
           var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/collaborateurs',{headers:headers})
            .map(response => response.json()
            );
        }

        getAllResponsables(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/responsables',{headers:headers})
            .map(response => response.json()
            );
        }

         getAllAdministarteur(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/administrateurs',{headers:headers})
            .map(response => response.json()
            );
        }

        getAdministrateurById(idAdministrateur){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/adminById?idAdministrateur='+idAdministrateur,{headers:headers})
            .map(response => response.json()
            );
        }

        getAllPartenaire(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/administrateur/partenaires',{headers:headers})
            .map(response => response.json()
            );
        }
        
        getActiviteById(idActivite){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/collaborateur/activiteById?idActivite='+idActivite,{headers:headers})
            .map(response => response.json()
            );
        }

        getAllThematiques(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/public/thematiques',{headers:headers})
            .map(response => response.json()
            );
        }

        addCollaborateur(collaborateur){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/administrateur/AddCollaborateur',collaborateur,options)
            .map(response => response.json()
            );
        }
        addAdministrateur(administarteur){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/administrateur/addAdministrateur',administarteur,options)
            .map(response => response.json()
            );
        }
        addResponsable(responsable){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/administrateur/addResponsable',responsable,options)
            .map(response => response.json()
            );
        }

        updateCollaborateur(collaborateur){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.put(this.APIURL+'/administrateur/updateCollaborateur',collaborateur,options)
            .map(response => response.json()
            );
        }
        
       deleteCollaborateur(idCollaborateur){
             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/administrateur/DeleteCollaborateur?idCollaborateur='+idCollaborateur,options);
        }

         deleteResponsable(idResponsable){
             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.delete(this.APIURL+'/administrateur/DeleteResponsable?idResponsable='+idResponsable,options);
        }

        getEtatActivite(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/activite',{headers:headers})
            .map(response => response.json()
            );
              }
        addRapportProjet(rapportProjet){
             let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addRapport',rapportProjet,options)
            .map(response => response.json()
            );
        }

        getAllActivities(){
            var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/allActivites',{headers:headers})
            .map(response => response.json()
            );
        }

        getAllRapports(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/rapports',{headers:headers})
            .map(response => response.json()
            );
        }

        addFichierRapport(data){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addFichierRapport',data,options)
            .map(response => response.json()
            );  
        }

        getRapportByIdProjet(idProjet){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/rapportsProjetByProjet?idProjet='+idProjet,{headers:headers})
            .map(response => response.json()
            );
        }

        getAllBilans(){
             var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/bilans',{headers:headers})
            .map(response => response.json()
            );
        }
        addBilanProjet(bilanProjet){
              let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));
            headers.append("Content-Type","application/json");  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addBilan',bilanProjet,options)
            .map(response => response.json()
            );
        }

         addFichierBilan(data){
            let headers = new Headers();
            headers.append("Authorization","Bearer "+localStorage.getItem("access_token"));  
            let options = new RequestOptions({headers: headers});            
            return this.http.post(this.APIURL+'/responsable/addFichierBilan',data,options)
            .map(response => response.json()
            );  
        }

        getBilansByIdProjet(idProjet){
        var headers = new Headers({'Authorization':'Bearer '+ localStorage.getItem("access_token")});            
            return this.http.get(this.APIURL+'/responsable/bilansProjetByProjet?idProjet='+idProjet,{headers:headers})
            .map(response => response.json()
            );
        }
}