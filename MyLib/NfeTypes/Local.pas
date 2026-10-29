unit Local;

interface

uses
  NfeTypes;

type
  TLocal = class(TNFeElement)
  private
  protected
    FCMun: Integer;
    FCNPJ: String;
    FCPF: String;
    FNro: String;
    FUF: String;
    FXBairro: String;
    FXCpl: String;
    FXLgr: String;
    FXMun: String;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property CMun: Integer read FCMun write FCMun;
    property CNPJ: String read FCNPJ write FCNPJ;
    property CPF: String read FCPF write FCPF;
    property Nro: String read FNro write FNro;
    property UF: String read FUF write FUF;
    property XBairro: String read FXBairro write FXBairro;
    property XCpl: String read FXCpl write FXCpl;
    property XLgr: String read FXLgr write FXLgr;
    property XMun: String read FXMun write FXMun;
  end;

implementation

end.
 