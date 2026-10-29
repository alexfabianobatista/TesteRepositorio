unit IPI;

interface

uses
  NfeTypes;

type
  TIPIImposto = class(TNFeElement)
  private
  protected
    FCST: String;
  public
    constructor Create(CST: String);
  published
    property CST: String read FCST write FCST;
  end;

  TIPITrib = class(TIPIImposto)
  private
  protected
    FPIPI: Extended;
    FQUnid: Extended;
    FVBC: Extended;
    FVIPI: Extended;
    FVUnid: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property PIPI: Extended read FPIPI write FPIPI;
    property QUnid: Extended read FQUnid write FQUnid;
    property VUnid: Extended read FVUnid write FVUnid;
    property VIPI: Extended read FVIPI write FVIPI;


  end;

  TIPINT = class(TIPIImposto)
  private
  protected
  public
  end;

  TIPI = class(TNFeElement)
  private
  protected
    FCEnq: String;
    FCSelo: String;
    FClEnq: String;
    FCNPJProd: String;
    FIPITrib: TIPITrib;
    FIPINT: TIPINT;
    FQSelo: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ClEnq: String read FClEnq write FClEnq;
    property CNPJProd: String read FCNPJProd write FCNPJProd;
    property CSelo: String read FCSelo write FCSelo;
    property QSelo: Extended read FQSelo write FQSelo;
    property CEnq: String read FCEnq write FCEnq;
    property IPITrib: TIPITrib read FIPITrib write FIPITrib;
    property IPINT: TIPINT read FIPINT write FIPINT;
  end;

implementation

{ TIPIImposto }

constructor TIPIImposto.Create(CST: String);
begin
  FCST := CST;
end;

end.
