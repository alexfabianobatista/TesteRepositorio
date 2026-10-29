unit COFINS;

interface

uses
  NfeTypes, TypInfo;

type
  TCOFINSImposto = class(TNFeElement)
  private
  protected
    FCST: TCST;
  public
    constructor Create(CST: Integer);
  published
    property CST: TCST read FCST;
  end;

  TCOFINSAliq = class(TCOFINSImposto)
  protected
    FVBC: Extended;
    FPCOFINS: Extended;
    FVCOFINS: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property PCOFINS: Extended read FPCOFINS write FPCOFINS;
    property VCOFINS: Extended read FVCOFINS write FVCOFINS;
  end;

  TCOFINSQtde = class(TCOFINSImposto)
  protected
    FQBCProd: TNFeFloat4;
    FVAliqProd: TNFeFloat4;
    FVCOFINS: TNFeFloat2;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property QBCProd: TNFeFloat4 read FQBCProd write FQBCProd;
    property VAliqProd: TNFeFloat4 read FVAliqProd write FVAliqProd;
    property VCOFINS: TNFeFloat2 read FVCOFINS write FVCOFINS;
  end;

  TCOFINSNT = class(TCOFINSImposto)
  public
  end;

  TCOFINSOutr = class(TCOFINSImposto)
  protected
    FVBC: Extended;
    FPCOFINS: Extended;
    FQBCProd: Extended;
    FVAliqProd: Extended;
    FVCOFINS: Extended;
    function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property PCOFINS: Extended read FPCOFINS write FPCOFINS;
    property QBCProd: Extended read FQBCProd write FQBCProd;
    property VAliqProd: Extended read FVAliqProd write FVAliqProd;
    property VCOFINS: Extended read FVCOFINS write FVCOFINS;
  end;

  TCOFINSST = class(TNFeElement)
  protected
    FVBC: Extended;
    FPCOFINS: Extended;
    FQBCProd: Extended;
    FVAliqProd: Extended;
    FVCOFINS: Extended;
  public
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBC: Extended read FVBC write FVBC;
    property PCOFINS: Extended read FPCOFINS write FPCOFINS;
    property QBCProd: Extended read FQBCProd write FQBCProd;
    property VAliqProd: Extended read FVAliqProd write FVAliqProd;
    property VCOFINS: Extended read FVCOFINS write FVCOFINS;
  end;

  //S01
  TCOFINS = class(TNFeElement)
  protected
    FCOFINS: TCOFINSImposto;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property COFINS: TCOFINSImposto read FCOFINS write FCOFINS;
  end;

implementation

uses SysUtils;
{ TCOFINSImposto }

constructor TCOFINSImposto.Create(CST: Integer);
begin
  FCST := TCST.Create(CST);
end;

{ TCOFINSOutr }

function TCOFINSOutr.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
  if (UpperCase( Prop.Name) = 'QBCPROD') or (UpperCase( Prop.Name) = 'VALIQPROD') then
    Result := false
  else
    Result := inherited IsTagEvenEmpty(Prop);
end;

end.
 