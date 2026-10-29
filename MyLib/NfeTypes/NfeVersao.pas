unit NfeVersao;

interface

uses
  XMLUtils, NfeConsts;

type
  TCceVersao = class(TVersionControl)
  end;
  TCceVersao1_00 = class(TCceVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  TNfeVersao = class(TVersionControl)
  end;
  
  TNfeVersao1_10 = class(TNfeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TNfeVersao2 = class(TNfeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TNfeVersao3_10 = class(TNfeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;
  
  TNfeVersao4_00 = class(TNfeVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TNfeVersaoFactory = class
  public
    class function GetNfeVersao(Versao: String): TNfeVersao;
  end;
  TCceVersaoFactory = class
  public
    class function GetCceVersao(Versao: String): TCceVersao;
  end;

implementation

uses StrUtils, SysUtils;

{ TNfeVersao1_10 }

function TNfeVersao1_10.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
var
  CamposDesconhecidos: String;
begin
  CamposDesconhecidos := ',crt,hsaient,dhcont,indtot,xped,nitemped,email,vBCSTRet,vICMSSTRet,';
  Result := PosEx(',' + UpperCase(PropName) + ',', UpperCase(CamposDesconhecidos)) = 0;
  if ((UpperCase(PropName) = 'XJUST') and (UpperCase(Obj.ClassName) = 'TIDE')) or
      ((UpperCase(PropName) = 'VICMS') and (UpperCase(Obj.ClassName) = 'TICMS40')) then
    Result := False;
end;

constructor TNfeVersao1_10.Create;
begin
  inherited Create(VERSAO_NFE_1_10);
end;

{ TNfeVersao2 }

function TNfeVersao2.ContainsProp(Obj: TObject; PropName: String): Boolean;
var
  CampoICMS60: String;
begin
  CampoICMS60 := ',vbcstret,vicmsstret,orig,cst,';
  Result := not ((PosEx(',' + UpperCase(PropName) + ',', UpperCase(CampoICMS60)) = 0) and
      (UpperCase(Obj.ClassName) = 'TICMS60'));
end;

constructor TNfeVersao2.Create;
begin
  inherited Create(VERSAO_NFE_2);
end;

{ TNfeVersaoFactory }

class function TNfeVersaoFactory.GetNfeVersao(
  Versao: String): TNfeVersao;
begin
  Result := nil;
  if Versao = VERSAO_NFE_4_00 then
    Result := TNfeVersao4_00.Create;
  if Versao = VERSAO_NFE_1_10 then
    Result := TNfeVersao1_10.Create
  else if Versao = VERSAO_NFE_2 then
    Result := TNfeVersao2.Create
  else if Versao = VERSAO_NFE_3_10 then
    Result := TNfeVersao3_10.Create;
end;

{ TCceVersao1_00 }

function TCceVersao1_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
begin
  Result := true;
end;

constructor TCceVersao1_00.Create;
begin
  inherited Create(VERSAO_CCE_1_00);
end;

{ TCceVersaoFactory }

class function TCceVersaoFactory.GetCceVersao(Versao: String): TCceVersao;
begin
  Result := TCceVersao1_00.Create;
end;
{ TNfeVersao3_10 }

function TNfeVersao3_10.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
var
  CampoICMS60: String;
begin
  CampoICMS60 := ',vbcstret,vicmsstret,orig,cst,';
  Result := not ((PosEx(',' + UpperCase(PropName) + ',', UpperCase(CampoICMS60)) = 0) and
      (UpperCase(Obj.ClassName) = 'TICMS60'));
end;

constructor TNfeVersao3_10.Create;
begin
  inherited Create(VERSAO_NFE_3_10);
end;

{ TNfeVersao4_00}

function TNfeVersao4_00.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
var
  CampoICMS60: String;
begin
  CampoICMS60 := ',vbcstret,pst,vicmsstret,orig,cst,VBCFCPSTRet,PFCPSTRet,VFCPSTRet,PRedBCEfet,VBCEfet,PICMSEfet,VICMSEfet,';
  Result := not ((PosEx(',' + UpperCase(PropName) + ',', UpperCase(CampoICMS60)) = 0) and
      (UpperCase(Obj.ClassName) = 'TICMS60'));
end;

constructor TNfeVersao4_00.Create;
begin
  inherited Create(VERSAO_NFE_4_00);
end;

end.
