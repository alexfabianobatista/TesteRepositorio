unit ICMSSN;

interface

uses
  ICMS;

type
  TICMSSN = class(TICMS)
  private
  protected
    FCSOSN: Integer;
  public
    constructor Create(CSOSN: Integer);
  published
    property CSOSN: Integer read FCSOSN;
  end;

  TICMSSN101 = class(TICMSSN)
  private
  protected
    FPCredSN: Extended;
    FVCredICMSSN: Extended;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property PCredSN: Extended read FPCredSN write FPCredSN;
    property VCredICMSSN: Extended read FVCredICMSSN write FVCredICMSSN;
  end;

  TICMSSN102 = class(TICMSSN)
  private
  protected
  public
    constructor Create(CSOSN: Integer);
  end;

  TICMSSN201 = class(TICMSSN)
  private
  protected
    FModBCST: Integer;
    FPCredSN: Extended;
    FPICMSST: Extended;
    FPMVAST: Extended;
    FPRedBCST: Extended;
    FVBCST: Extended;
    FVCredICMSSN: Extended;
    FVICMSST: Extended;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBCST: Integer read FModBCST write FModBCST;
    property PCredSN: Extended read FPCredSN write FPCredSN;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property PMVAST: Extended read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property VCredICMSSN: Extended read FVCredICMSSN write FVCredICMSSN;
    property VICMSST: Extended read FVICMSST write FVICMSST;
  end;

  TICMSSN202 = class(TICMSSN)
  private
  protected
    FModBCST: Integer;
    FPICMSST: Extended;
    FPMVAST: Extended;
    FPRedBCST: Extended;
    FVBCST: Extended;
    FVICMSST: Extended;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBCST: Integer read FModBCST write FModBCST;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property PMVAST: Extended read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBCST: Extended read FVBCST write FVBCST;
    property VICMSST: Extended read FVICMSST write FVICMSST;
  end;

  TICMSSN500 = class(TICMSSN)
  private
  protected
    FVBCSTRet: Extended;
    FVICMSSTRet: Extended;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property VBCSTRet: Extended read FVBCSTRet write FVBCSTRet;
    property VICMSSTRet: Extended read FVICMSSTRet write FVICMSSTRet;
  end;

  TICMSSN900 = class(TICMSSN)
  private
  protected
    FModBC: Integer;
    FModBCST: Integer;
    FPCredSN: Extended;
    FPICMS: Extended;
    FPICMSST: Extended;
    FPMVAST: Extended;
    FPRedBCST: Extended;
    FVBC: Extended;
    FVBCST: Extended;
    FVCredICMSSN: Extended;
    FVICMS: Extended;
    FVICMSST: Extended;
    FVRedBC: Extended;
  public
    constructor Create;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ModBC: Integer read FModBC write FModBC;
    property ModBCST: Integer read FModBCST write FModBCST;
    property PCredSN: Extended read FPCredSN write FPCredSN;
    property PICMS: Extended read FPICMS write FPICMS;
    property PICMSST: Extended read FPICMSST write FPICMSST;
    property PMVAST: Extended read FPMVAST write FPMVAST;
    property PRedBCST: Extended read FPRedBCST write FPRedBCST;
    property VBC: Extended read FVBC write FVBC;
    property VBCST: Extended read FVBCST write FVBCST;
    property VCredICMSSN: Extended read FVCredICMSSN write FVCredICMSSN;
    property VICMS: Extended read FVICMS write FVICMS;
    property VICMSST: Extended read FVICMSST write FVICMSST;
    property VRedBC: Extended read FVRedBC write FVRedBC;
  end;

implementation

uses NfeConsts;

{ TICMSSN }

constructor TICMSSN.Create(CSOSN: Integer);
begin
  inherited Create(-1);
  FCSOSN := CSOSN;
end;

{ TICMSSN101 }

constructor TICMSSN101.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_COM_CRED);
end;

{ TICMSSN102 }

constructor TICMSSN102.Create(CSOSN: Integer);
begin
  inherited;
end;

{ TICMSSN201 }

constructor TICMSSN201.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_COM_CRED_ST);
end;

{ TICMSSN202 }

constructor TICMSSN202.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_SEM_CRED_ST);
end;

{ TICMSSN500 }

constructor TICMSSN500.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_COBRADO_POR_ST);
end;

{ TICMSSN900 }

constructor TICMSSN900.Create;
begin
  inherited Create(CSOSN_ICMS_TRIB_SN_OUTROS);
end;

end.
