$(document).ready(function(){
    console.log("HERRRRRE WEZRE ");
    $('#download').click(function(){
        download();
    })
}
);

function download() {
    var file = $('#file').text();
    console.log("FILLLLLE NAME : "+file) 
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://localhost:8080/fondation/administrateur/downloadAnnexe?file='+file, true);
    xhr.responseType = 'arraybuffer';
    xhr.onload = function() {
        if(this.status == '200') {
           var filename = '';
           //get the filename from the header.
           var disposition = xhr.getResponseHeader('Content-Disposition');
           if (disposition && disposition.indexOf('attachment') !== -1) {
               var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
               var matches = filenameRegex.exec(disposition);
               if (matches !== null && matches[1])
                   filename = matches[1].replace(/['"]/g, '');
                   console.log('FILE NAME : '+filename);
           }
           var type = xhr.getResponseHeader('Content-Type');
           var blob = new Blob([this.response],  {type: type});
           //workaround for IE
           if(typeof window.navigator.msSaveBlob != 'undefined') {
               window.navigator.msSaveBlob(blob, filename);
           }
           else {
               var URL = window.URL || window.webkitURL;
               var download_URL = URL.createObjectURL(blob);
               if(filename) {
                   var a_link = document.createElement('a');
                   if(typeof a_link.download == 'undefined') {
                       window.location = download_URL;
                   }else {
                       a_link.href = download_URL;
                       a_link.download = filename;
                       document.body.appendChild(a_link);
                       a_link.click();
                   }
               }else {
                   window.location = download_URL;
               }
               setTimeout(function() {
                   URL.revokeObjectURL(download_URL);
               }, 10000);
           }
        }else {
            alert('error');
        }
    };
    xhr.setRequestHeader('Authorization', 'Bearer '+localStorage.getItem('access_token'));
    xhr.setRequestHeader('Content-type', 'application/download');
    xhr.send();
}