


var fld = vars.field("cep", "string", 10);
fld.label = 'Cep '
fld.saveInputAsDefault = false

fld.onAfterChange.set(function (field, beforeValue) {

    var cep = field.value
    var uri = "https://viacep.com.br/ws/"+cep+"/json/"

    if ( cep ){

        var xhr = new XMLHttpRequest();

        xhr.open('GET', uri, false);
        xhr.setRequestHeader('Encoding', 'ISO-8859-1');
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send();


        //var result = $.parseJSON(xhr.responseText);

        var result = JSON.parse(xhr.responseText);

        field.parent.logradouro.setValue(result.logradouro)
        field.parent.complemento.setValue(  result.complemento)
        field.parent.bairro.setValue(result.bairro)
        field.parent.localidade.setValue(result.localidade)
        field.parent.uf.setValue(result.uf)
        field.parent.ibge.setValue(result.ibge)

    }else{

        field.parent.logradouro.setValue('')
        field.parent.complemento.setValue( '')
        field.parent.bairro.setValue('')
        field.parent.localidade.setValue('')
        field.parent.uf.setValue('')
        field.parent.ibge.setValue(  '')

    }

});


var fld = vars.field("logradouro", "string", 80);
fld.label = 'Logradouro '

var fld = vars.field("complemento", "string", 100);
fld.label = 'Complemento '

var fld = vars.field("bairro", "string", 100);
fld.label = 'Bairro '

var fld = vars.field("localidade", "string", 100);
fld.label = 'Localidade '

var fld = vars.field("uf", "string", 100);
fld.label = 'UF '

var fld = vars.field("ibge", "string", 100);
fld.label = 'Cód IBGE '



this.activity("run", function () {

});


this.interaction("writeLayout", function () {


});


