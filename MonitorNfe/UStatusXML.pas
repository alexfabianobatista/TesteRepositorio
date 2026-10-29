unit UStatusXML;

interface
  uses
    Classes;
  type
      TUStatusXML = Class
    private

    protected

    public
      function getXML(cUF :String; tpAmb :String; contingencia :String) :TStrings;
  end;
var
  StatusXML :TUStatusXML;

implementation
  uses
    strUtils;
  function TUStatusXML.getXML(cUF :String; tpAmb :String; contingencia :String) :TStrings;
  var
    xml :TStrings;
  begin
    xml := TStringList.Create;
    xml.Add('<?xml version="1.0" encoding="utf-8"?>');
    xml.Add('<cemapa>');
    xml.Add('<cabecMsg xmlns="http://www.portalfiscal.inf.br/nfe" versao="1.02">');
    xml.Add('<versaoDados>1.07</versaoDados>');
    xml.Add('</cabecMsg>');

    xml.Add('<consStatServ versao="1.07" xmlns="http://www.portalfiscal.inf.br/nfe">');
    xml.Add('<tpAmb>'+tpAmb+'</tpAmb>');
    xml.Add('<cUF>'+cUF+'</cUF>');
    xml.Add('<xServ>STATUS</xServ>');
    xml.Add('</consStatServ>');
    xml.Add('<contingencia>'+contingencia+'</contingencia>');
    xml.Add('</cemapa>');
    result := xml;
  end;
end.
