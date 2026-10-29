unit Endereco;

interface

uses
  NfeTypes;

type
  TEndereco = class(TNFeElement)
  private
  protected
    FCEP: TNFeIntegerComZero;
    FCMun: Integer;
    FCPais: Integer;
    FFone: String;
    FNro: String;
    FUF: String;
    FXBairro: String;
    FXCpl: String;
    FXLgr: String;
    FXMun: String;
    FXPais: String;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property XLgr: String read FXLgr write FXLgr;
    property Nro: String read FNro write FNro;
    property XCpl: String read FXCpl write FXCpl;
    property XBairro: String read FXBairro write FXBairro;
    property CMun: Integer read FCMun write FCMun;
    property XMun: String read FXMun write FXMun;
    property UF: String read FUF write FUF;
    property CEP: TNFeIntegerComZero read FCEP write FCEP;
    property CPais: Integer read FCPais write FCPais;
    property XPais: String read FXPais write FXPais;
    property Fone: String read FFone write FFone;
  end;

implementation

end.
 