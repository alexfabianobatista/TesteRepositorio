unit ICMSST;

interface

uses
  ICMS;

type
  TICMSST = class(TICMS)
  private
  protected
    FVBCSTDest: Extended;
    FVBCSTRet: Extended;
    FVICMSSTDest: Extended;
    FVICMSSTRet: Extended;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBCSTDest: Extended read FVBCSTDest write FVBCSTDest;
    property VBCSTRet: Extended read FVBCSTRet write FVBCSTRet;
    property VICMSSTDest: Extended read FVICMSSTDest write FVICMSSTDest;
    property VICMSSTRet: Extended read FVICMSSTRet write FVICMSSTRet;
  end;

implementation

uses NfeConsts;

{ TICMSST }

constructor TICMSST.Create;
begin
  inherited Create(CST_ICMS_TRIB_NAO_TRIBUTADA);
end;

end.
