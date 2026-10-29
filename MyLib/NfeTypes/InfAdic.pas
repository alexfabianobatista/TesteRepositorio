unit InfAdic;

interface

uses
  NfeTypes;

type
  TObs = class(TNFeElement)
  protected
    FXCampo: String;
    FXTexto: String;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property XCampo: String read FXCampo write FXCampo;
    property XTexto: String read FXTexto write FXTexto;
  end;

  TInfAdic = class(TNFeElementNoEmptys)
  protected
    FInfAdFisco: String;
    FInfCpl: String;
    FObsCont: TObs;
    FObsFisco: TObs;
    FProcRef: TObject; //Não implementado
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property InfAdFisco: String read FInfAdFisco write FInfAdFisco;
    property InfCpl: String read FInfCpl write FInfCpl;
    property ObsCont: TObs read FObsCont write FObsCont;
    property ObsFisco: TObs read FObsFisco write FObsFisco;
    property ProcRef: TObject read FProcRef write FProcRef;
  end;

implementation

end.
