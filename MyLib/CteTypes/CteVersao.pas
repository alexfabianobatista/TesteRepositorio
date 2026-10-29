unit CteVersao;

interface

uses
  XMLUtils, CteConsts;

type
  TEventoCTeVersao = class(TVersionControl)
  end;
  TEventoCTeVersao1_00 = class(TEventoCTeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TEventoCTeVersao2_00 = class(TEventoCTeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TEventoCTeVersao3_00 = class(TEventoCTeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TEventoCTeVersao4_00 = class(TEventoCTeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TCteVersao = class(TVersionControl)
  end;
  TCteVersao1_03 = class(TCteVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  TCteVersao1_04 = class(TCteVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  TCteVersao2_00 = class(TCteVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  TCteVersao3_00 = class(TCteVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  TCteVersao4_00 = class(TCteVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TCteVersaoFactory = class
  public
    class function GetCteVersao(Versao: String): TCteVersao;
  end;

implementation

uses StrUtils, SysUtils;


{ TCteVersaoFactory }

class function TCteVersaoFactory.GetCteVersao(
  Versao: String): TCteVersao;
begin
  Result := nil;
  if Versao = VERSAO_CTE_4_00 then
    Result := TCteVersao4_00.Create
  else if Versao = VERSAO_CTE_3_00 then
    Result := TCteVersao3_00.Create
  else if Versao = VERSAO_CTE_1_04 then
    Result := TCteVersao1_04.Create
  else if Versao = VERSAO_CTE_2_00 then
    Result := TCteVersao2_00.Create
  else if Versao = VERSAO_CTE_1_03 then
    Result := TCteVersao1_03.Create;

end;

{ TCteVersao1_04 }

function TCteVersao1_04.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TCteVersao1_04.Create;
begin
  inherited Create(VERSAO_CTE_1_04);
end;

{ TCteVersao1_03 }

function TCteVersao1_03.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TCteVersao1_03.Create;
begin
  inherited Create(VERSAO_CTE_1_03);
end;

{ TEventoCTeVersao1_00 }

function TEventoCTeVersao1_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TEventoCTeVersao1_00.Create;
begin
  inherited Create(VERSAO_CTE_EVENTO_1_00);
end;

{ TCteVersao2_00 }

function TCteVersao2_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := True;
end;

constructor TCteVersao2_00.Create;
begin
  inherited Create(VERSAO_CTE_2_00);
end;

{ TEventoCTeVersao2_00 }

function TEventoCTeVersao2_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := True;
end;

constructor TEventoCTeVersao2_00.Create;
begin
  inherited Create(VERSAO_CTE_2_00);
end;

{ TCteVersao3_00 }

function TCteVersao3_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := True;
end;

constructor TCteVersao3_00.Create;
begin
  inherited Create(VERSAO_CTE_3_00);
end;   

{ TCteVersao4_00 }

function TCteVersao4_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := True;
end;

constructor TCteVersao4_00.Create;
begin
  inherited Create(VERSAO_CTE_4_00);
end;

{ TEventoCTeVersao3_00 }

function TEventoCTeVersao3_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := True;
end;

constructor TEventoCTeVersao3_00.Create;
begin
  inherited Create(VERSAO_CTE_3_00);
end;

{ TEventoCTeVersao4_00 }

function TEventoCTeVersao4_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := True;
end;

constructor TEventoCTeVersao4_00.Create;
begin
  inherited Create(VERSAO_CTE_4_00);
end;


end.
