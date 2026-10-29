unit EnderecoCte;

interface

uses
  CteTypes;

type
  TEnderecoCTe = class(TCTeElement)
  protected
    FCEP: TCTeIntegerComZero;
    FCMun: Integer;
    FCPais: Integer;
    FNro: String;
    FUF: String;
    FXBairro: String;
    FXCpl: String;
    FXLgr: String;
    FXMun: String;
    FXPais: String;
    FFone: String;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property XLgr: String read FXLgr write FXLgr;
    property Nro: String read FNro write FNro;
    property XCpl: String read FXCpl write FXCpl;
    property XBairro: String read FXBairro write FXBairro;
    property CMun: Integer read FCMun write FCMun;
    property XMun: String read FXMun write FXMun;
    property CEP: TCTeIntegerComZero read FCEP write FCEP;
    property UF: String read FUF write FUF;
    property CPais: Integer read FCPais write FCPais;
    property XPais: String read FXPais write FXPais;
    property Fone: String read FFone write FFone;
  end;

implementation

end.
