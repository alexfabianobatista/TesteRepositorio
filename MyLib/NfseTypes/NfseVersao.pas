unit NfseVersao;

interface

uses
  XMLUtils, NfseConsts;

type
  TNfseVersao = class(TVersionControl)
  end;
  
  TNfseVersaoGovBr = class(TNfseVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TNfseVersaoElotech = class(TNfseVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TNfseVersaoLexsom = class(TNfseVersao)
  public
    constructor Create;
    function ContainsProp(Obj: TObject; PropName: String): Boolean; override;
  end;

  TNfseVersaoFactory = class
  public
    class function GetNfseVersao(Versao: String): TNfseVersao;
  end;

implementation

uses StrUtils, SysUtils;

{ TNfseVersaoGovBr }

function TNfseVersaoGovBr.ContainsProp(Obj: TObject;
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

constructor TNfseVersaoGovBr.Create;
begin
  inherited Create(VERSAO_NFSE_GOVBR);
end;

{ TNfseVersaoElotech }

function TNfseVersaoElotech.ContainsProp(Obj: TObject; PropName: String): Boolean;
var
  CampoICMS60: String;
begin
  CampoICMS60 := ',vbcstret,pst,vicmsstret,orig,cst,VBCFCPSTRet,PFCPSTRet,VFCPSTRet,PRedBCEfet,VBCEfet,PICMSEfet,VICMSEfet,';
  Result := not ((PosEx(',' + UpperCase(PropName) + ',', UpperCase(CampoICMS60)) = 0) and
      (UpperCase(Obj.ClassName) = 'TICMS60'));
end;

constructor TNfseVersaoElotech.Create;
begin
  inherited Create(VERSAO_NFSE_ELOTECH);
end;

{ TNfeVersaoFactory }

class function TNfseVersaoFactory.GetNfseVersao(
  Versao: String): TNfseVersao;
begin
  Result := nil;
  if Versao = VERSAO_NFSE_GOVBR then
    Result := TNfseVersaoGovBr.Create
  else if Versao = VERSAO_NFSE_ELOTECH then
    Result := TNfseVersaoElotech.Create
  else if Versao = VERSAO_NFSE_LEXSOM then
    Result := TNfseVersaoLexsom.Create;
end;

{ TNfseVersaoLexsom }

function TNfseVersaoLexsom.ContainsProp(Obj: TObject;
  PropName: String): Boolean;
var
  CampoICMS60: String;
begin
  CampoICMS60 := ',vbcstret,pst,vicmsstret,orig,cst,VBCFCPSTRet,PFCPSTRet,VFCPSTRet,PRedBCEfet,VBCEfet,PICMSEfet,VICMSEfet,';
  Result := not ((PosEx(',' + UpperCase(PropName) + ',', UpperCase(CampoICMS60)) = 0) and
      (UpperCase(Obj.ClassName) = 'TICMS60'));
end;

constructor TNfseVersaoLexsom.Create;
begin
  inherited Create(VERSAO_NFSE_LEXSOM);
end;

end.
