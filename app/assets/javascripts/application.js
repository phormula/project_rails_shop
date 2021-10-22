// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require rails-ujs
//= require turbolinks
//= require twitter/typeahead.min
//= require_tree .
//= require bootstrap-table/bootstrap-table

var uSers= new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        url: '/search_word/%QUERY',
        wildcard: '%QUERY',
        cache: false
    }
});$(document).ready(function(){
  
    $('.typeahead').typeahead(null, {
        name: 'id',
        display: 'word',
        source: uSers,
        limit: 20,
        template: function (query, item) {
     
            var color = "#777";
            if (item.status === "owner") {
                color = "#ff1493";
            }
     
            return '<span class="row">' +
                '<span class="word">{{word}} </span>' +
            "</span>"
        }
       });
      });
