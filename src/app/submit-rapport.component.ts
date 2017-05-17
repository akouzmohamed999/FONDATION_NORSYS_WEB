
import { Injectable } from '@angular/core';
import { Http, Headers,RequestOptions} from '@angular/http';
import { HttpModule } from '@angular/http';
import { Observable } from 'rxjs';
@Injectable()
export class RapportSubmit{


 fire_ajax_submit() {

    // Get form
    var form = $('#fileUploadForm')[0];

    var data = new FormData(form);

    data.append("CustomField", "This is some extra data, testing");

    $("#btnSubmit").prop("disabled", true);

    $.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        headers: { 'Authorization': 'Bearer '+localStorage.getItem('access_token')},
        url: 'http://localhost:8080/fondation/responsable/addFichierRapport',
        data: data,
        //http://api.jquery.com/jQuery.ajax/
        //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
        processData: false, //prevent jQuery from automatically transforming the data into a query string
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {

            $('#result').text(data);
            console.log("SUCCESS : ", data);
            $("#btnSubmit").prop("disabled", false);

        },
        error: function (e) {

            $("#result").text(e.responseText);
            console.log("ERROR : ", e);
            $("#btnSubmit").prop("disabled", false);

        }
    });

}

}