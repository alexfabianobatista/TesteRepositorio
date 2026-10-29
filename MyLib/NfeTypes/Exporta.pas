unit Exporta;

interface

uses
  NfeTypes;

type
  TExporta = class(TNFeElementNoEmptys)
  protected
    FUFSaidaPais: String;
    FXLocExporta: String;
    FXLocDespacho: String;
    FUFEmbarq: String;
    FXLocEmbarq: String;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property UFSaidaPais: String read FUFSaidaPais write FUFSaidaPais;
    property XLocExporta: String read FXLocExporta write FXLocExporta;
    property XLocDespacho: String read FXLocDespacho write FXLocDespacho;
    property UFEmbarq: String read FUFEmbarq write FUFEmbarq;
    property XLocEmbarq: String read FXLocEmbarq write FXLocEmbarq;
  end;

implementation

end.
 