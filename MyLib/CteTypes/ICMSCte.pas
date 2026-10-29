unit ICMSCte;

interface

uses
  CteTypes, CteConsts, TypInfo, SysUtils;
  
type
  
  TICMSCte = class(TCTeElement)
  protected
    FCST: TCST;
  public
    constructor Create(CST: Integer);
  published
    property CST: TCST read FCST;
  end;
  TICMSImposto = class(TCTeElement)
  protected
    FIcms: TICMSCte;
    function GetXMLName(Prop: TPropInfo): String; override;
  published
    property Icms: TICMSCte read FIcms write FIcms;
  end;

  TICMS00 = class(TICMSCte)
  protected
    FPICMS: TCteFloat2;
    FVBC: TCteFloat2;
    FVICMS: TCteFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: TCteFloat2 read FVBC write FVBC;
    property PICMS: TCteFloat2 read FPICMS write FPICMS;
    property VICMS: TCteFloat2 read FVICMS write FVICMS;
  end;
  TICMS20 = class(TICMSCte)
  private
  protected
    FPRedBC: TCteFloat2;
    FVBC: TCteFloat2;
    FPICMS: TCteFloat2;
    FVICMS: TCteFloat2;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property PRedBC: TCteFloat2 read FPRedBC write FPRedBC;
    property VBC: TCteFloat2 read FVBC write FVBC;
    property PICMS: TCteFloat2 read FPICMS write FPICMS;
    property VICMS: TCteFloat2 read FVICMS write FVICMS;
  end;
  TICMS45 = class(TICMSCte)
  private
  protected
  public
    constructor Create(CST: Integer);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
  end;
  
  TICMS60 = class(TICMSCte)
  private
  protected
    FVBCSTRet: TCteFloat2;
    FVICMSSTRet: TCteFloat2;
    FPICMSSTRet: TCteFloat2;
    FVCred: TCteFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBCSTRet: TCteFloat2 read FVBCSTRet write FVBCSTRet;
    property VICMSSTRet: TCteFloat2 read FVICMSSTRet write FVICMSSTRet;
    property PICMSSTRet: TCteFloat2 read FPICMSSTRet write FPICMSSTRet;
    property VCred: TCTeFloat2 read FVCred write FVCred;
  end;
  TICMS90 = class(TICMSCte)
  private
  protected    
    FPRedBC: TCteFloat2;
    FVBC: TCteFloat2;
    FPICMS: TCteFloat2;
    FVICMS: TCteFloat2;
    FVCred: TCteFloat2;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property PRedBC: TCteFloat2 read FPRedBC write FPRedBC;
    property VBC: TCteFloat2 read FVBC write FVBC;     
    property PICMS: TCteFloat2 read FPICMS write FPICMS;
    property VICMS: TCteFloat2 read FVICMS write FVICMS;
    property VCred: TCTeFloat2 read FVCred write FVCred;
  end;
  TICMSOutraUF = class(TICMSCte)
  protected
    FPRedBCOutraUF: TCTeFloat2;
    FVBCOutraUF: TCTeFloat2;
    FPICMSOutraUF: TCTeFloat2;
    FVICMSOutraUF: TCTeFloat2;
  public
    constructor Create;
  published
    property PRedBCOutraUF: TCteFloat2 read FPRedBCOutraUF write FPRedBCOutraUF;
    property VBCOutraUF: TCteFloat2 read FVBCOutraUF write FVBCOutraUF;
    property PICMSOutraUF: TCteFloat2 read FPICMSOutraUF write FPICMSOutraUF;
    property VICMSOutraUF: TCteFloat2 read FVICMSOutraUF write FVICMSOutraUF;
  end;
  TICMSSN = class(TICMSCte)
  protected
    FIndSN: Integer;
  public
    constructor Create; overload;
    Constructor Create(CST: Integer); overload;
  published
    property IndSN: Integer read FIndSN write FIndSN;
  end;
implementation

{ TICMS00 }

constructor TICMS00.Create;
begin
  inherited Create(CST_ICMS_TRIB_INTEGRAL);
end;

{ TICMS20 }

constructor TICMS20.Create;
begin
  inherited Create(CST_ICMS_TRIB_COM_RED_BC);
end;

function TICMS20.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if UpperCase(Prop.Name) = 'PREDBC' then
    Result := True
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

{ TICMS45 }

constructor TICMS45.Create(CST: Integer);
begin
  inherited Create(CST);
end;

{ TICMS60 }

constructor TICMS60.Create;
begin
  inherited Create(CST_ICMS_TRIB_COBRADA_POR_ST);
end;

{ TICMS90 }

constructor TICMS90.Create;
begin
  inherited Create(CST_ICMS_TRIB_OUTROS);
end;
{ TICMSOutraUF }

constructor TICMSOutraUF.Create;
begin
  inherited Create(CST_ICMS_TRIB_OUTROS);
end;

{ TICMSSN }

constructor TICMSSN.Create;
begin
  FIndSN := 1;
end;

{ TICMS }

constructor TICMSCte.Create(CST: Integer);
begin
  FCST := TCST.Create(CST);
end;

constructor TICMSSN.Create(CST: Integer);
begin
  inherited Create(CST);
  FIndSN := 1;
end;

{ TICMSImposto }

function TICMSImposto.GetXMLName(Prop: TPropInfo): String;
begin
  FSameClass := ',icms';
  Result := inherited GetXMLName(Prop);
end;

end.
