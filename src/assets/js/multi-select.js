
$(document).ready(function(){
        var config = {
                '#chosen'           : {}
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }
            console.log('HERRRRRE')
            $(selector).chosen(config[selector]);
})

