unit Avulsa;

interface

uses
  NfeTypes;

type
  //ID = D01;
  TAvulsa = class(TNFeElement)
  private    
  protected
    FCNPJ: String;
    FDEmi: TNFeData;
    FDPag: TNFeData;
    FFone: Integer;
    FMatr: String;
    FNDAR: String;
    FRepEmi: String;
    FUF: String;
    FVDAR: Extended;
    FXAgente: String;
    FXOrgao: String;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CNPJ: String read FCNPJ write FCNPJ;
    property XOrgao: String read FXOrgao write FXOrgao;
    property Matr: String read FMatr write FMatr;
    property XAgente: String read FXAgente write FXAgente;
    property Fone: Integer read FFone write FFone;
    property UF: String read FUF write FUF;
    property NDAR: String read FNDAR write FNDAR;
    property DEmi: TNFeData read FDEmi write FDEmi;
    property VDAR: Extended read FVDAR write FVDAR;
    property RepEmi: String read FRepEmi write FRepEmi;
    property DPag: TNFeData read FDPag write FDPag;
  end;

implementation

end.
 