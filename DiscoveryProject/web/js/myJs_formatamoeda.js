function numberToReal(valor) 
{
    var numero = parseFloat(valor).toFixed(2);
    if ( numero < 0 ) numero = numero * -1;
    
    numero = numero.toString();
    numero = numero.replace('.', ',');
    numero = "R$ " + numero;

    return( numero );
}

function realToNumber(valor)
{
    if ( typeof(valor)!=undefined ) 
    {
        var numero = valor.split(" ")[1];
        numero = parseFloat( numero.replace(",", ".") );
        
        return( numero );
    }
    
    return( false );
}

