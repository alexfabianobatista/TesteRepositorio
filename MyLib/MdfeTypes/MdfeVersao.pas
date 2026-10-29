unit MdfeVersao;

interface

uses
  XMLUtils, MdfeConsts;

type
  TEventoMDFeVersao = class(TVersionControl)
  end;
  TEventoMDFeVersao1_00 = class(TEventoMDFeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TMdfeVersao = class(TVersionControl)
  end;
  TMdfeVersao1_00 = class(TMdfeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  TMdfeVersao3_00 = class(TMdfeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TMdfeVersaoFactory = class
  public
    class function GetMdfeVersao(Versao: String): TMdfeVersao;
  end;

implementation

uses StrUtils, SysUtils;


{ TMdfeVersaoFactory }

class function TMdfeVersaoFactory.GetMdfeVersao(
  Versao: String): TMdfeVersao;
begin
  Result := nil;
  if Versao = VERSAO_MDFE_1_00 then
    Result := TMdfeVersao1_00.Create;
  if Versao = VERSAO_MDFE_3_00 then
    Result := TMdfeVersao3_00.Create;
end;

{ TMdfeVersao1_00 }

function TMdfeVersao1_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TMdfeVersao1_00.Create;
begin
  inherited Create(VERSAO_MDFE_1_00);
end;

{ TEventoMDFeVersao1_00 }

function TEventoMDFeVersao1_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TEventoMDFeVersao1_00.Create;
begin
  inherited Create(VERSAO_MDFE_1_00);
end;

{ TMdfeVersao3_00 }

function TMdfeVersao3_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TMdfeVersao3_00.Create;
begin
  inherited Create(VERSAO_MDFE_3_00);
end;

end.
