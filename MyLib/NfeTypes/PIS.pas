unit PIS;

interface

uses
  NfeTypes, TypInfo;

type
  TPISImposto = class(TNFeElement)
  private
  protected
    FCST: TCST;
  public
    constructor Create(CST: Integer);
  published
    property CST: TCST read FCST;
  end;

  TPISAliq = class(TPISImposto)
  private
  protected
    FPPIS: Extended;
    FVBC: Extended;
    FVPIS: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property PPIS: Extended read FPPIS write FPPIS;
    property VPIS: Extended read FVPIS write FVPIS;
  end;

  TPISQtde = class(TPISImposto)
  private
  protected
    FQBCProd: TNFeFloat4;
    FVAliqProd: TNFeFloat4;
    FVPIS: TNFeFloat2;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QBCProd: TNFeFloat4 read FQBCProd write FQBCProd;
    property VAliqProd: TNFeFloat4 read FVAliqProd write FVAliqProd;
    property VPIS: TNFeFloat2 read FVPIS write FVPIS;
  end;

  TPISNT = class(TPISImposto)
  end;

  TPISOutr = class(TPISImposto)
  protected
    FPPIS: Extended;
    FQBCProd: Extended;
    FVAliqProd: Extended;
    FVBC: Extended;
    FVPIS: Extended;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property PPIS: Extended read FPPIS write FPPIS;
    property QBCProd: Extended read FQBCProd write FQBCProd;
    property VAliqProd: Extended read FVAliqProd write FVAliqProd;
    property VPIS: Extended read FVPIS write FVPIS;
  end;
  TPISST = class(TNFeElement)
  protected
    FPPIS: Extended;
    FQBCProd: Extended;
    FVAliqProd: Extended;
    FVBC: Extended;
    FVPIS: Extended;
  published
    property VBC: Extended read FVBC write FVBC;
    property PPIS: Extended read FPPIS write FPPIS;
    property QBCProd: Extended read FQBCProd write FQBCProd;
    property VAliqProd: Extended read FVAliqProd write FVAliqProd;
    property VPIS: Extended read FVPIS write FVPIS;
  end;
  TPIS = class(TNFeElement)
  private
  protected
    FPIS: TPISImposto;
  public
  published
    property PIS: TPISImposto read FPIS write FPIS;
  end;

implementation

uses SysUtils;

{ TPISImposto }

constructor TPISImposto.Create(CST: Integer);
begin
  FCST := TCST.Create(CST);
end;

{ TPISOutr }

function TPISOutr.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if (UpperCase( Prop.Name) = 'QBCPROD') or (UpperCase( Prop.Name) = 'VALIQPROD') then
    Result := false
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
