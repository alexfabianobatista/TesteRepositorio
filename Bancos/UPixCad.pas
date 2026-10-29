unit UPixCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UBancoAgencia_cl, UTCADSIMPLES, DBPanel, DBCtrls, DBDirceu,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask, ExtCtrls,
  Buttons,

  // ACBR para validações e uso do certificado
  ACBrPIXCD,
  ACBrOpenSSLUtils;

type
  TFContaPixCad = class(TFTCadSimples)
    Panel2: TPanel;
    lblMensagemAlerta: TLabel;
    Label12: TLabel;
    dbDescClientId: TDBEdit;
    Label13: TLabel;
    dbClientSecret: TDBEdit;
    Label15: TLabel;
    dbAccessKey: TDBEdit;
    Label18: TLabel;
    dbSecretKey: TDBEdit;
    Label43: TLabel;
    dbAccountID: TDBEdit;
    Label45: TLabel;
    dbArquivoCertificado: TDBEdit;
    Label55: TLabel;
    dbArquivoChavePrivada: TDBEdit;
    Label62: TLabel;
    dbArquivoRootCertificado: TDBEdit;
    Label64: TLabel;
    dbConsumerKey: TDBEdit;
    dbConsumerSecret: TDBEdit;
    Label68: TLabel;
    dbDeveloperApplicationKey: TDBEdit;
    Label69: TLabel;
    dbMediatorFee: TDBEdit;
    Label71: TLabel;
    dbSenhaPfx: TDBEdit;
    Label72: TLabel;
    dbToken: TDBEdit;
    Label74: TLabel;
    dbAccessToken: TDBEdit;
    Label75: TLabel;
    dbTokenSandBox: TDBEdit;
    sbtnArquivoCertificado: TSpeedButton;
    sbtnArquivoChavePrivada: TSpeedButton;
    sbtnArquivoRootCertificado: TSpeedButton;
    odBuscarArquivos: TOpendialog;
    Label67: TLabel;
    dbcPixPadrao: TDBCheckBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbPSPContaPix: TComboBox;
    cbAmbientePSP: TComboBox;
    Label3: TLabel;
    lblErroCertificado: TLabel;
    Label4: TLabel;
    dbArquivoPFX: TDBEdit;
    sbtnArquivoPFX: TSpeedButton;
    lblErroPFX: TLabel;
    lblErroChavePrivada: TLabel;
    lblErroCertificadoRoot: TLabel;
    dbChavePix: TDBEdit;
    Label5: TLabel;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbtnArquivoCertificadoClick(Sender: TObject);
    procedure sbtnArquivoChavePrivadaClick(Sender: TObject);
    procedure sbtnArquivoRootCertificadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure cbPSPContaPixChange(Sender: TObject);
    procedure cbAmbientePSPChange(Sender: TObject);
    procedure dbArquivoCertificadoExit(Sender: TObject);
    procedure dbArquivoPFXExit(Sender: TObject);
    procedure dbArquivoChavePrivadaExit(Sender: TObject);
    procedure dbArquivoRootCertificadoExit(Sender: TObject);
  private
    ACBrOpenSSL: TACBrOpenSSLUtils;
    function ValidarCertificadoPEM(certificado: string): string;
    function ValidarCertificadoPFX(certificado: string): string;
    function ValidarCertificadoCER(certificado: string): string;
    function ValidarChavePrivada(chavePrivada: string): string;
    procedure PopularTipoBanco(combo: TComboBox);
    procedure PopularTipoAmbiente(combo: TComboBox);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaPixCad: TFContaPixCad;

implementation

uses UContaCorrenteCons, UBancoPixCons, Cemapa.Conversoes.API, TypInfo,
     UBiblioteca;

{$R *.dfm}

procedure TFContaPixCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsEdit,dsInsert] then
  begin
    sbtnArquivoCertificado.Enabled := True;
    sbtnArquivoChavePrivada.Enabled := True;
    sbtnArquivoRootCertificado.Enabled := True;
    sbtnArquivoPFX.Enabled := True;
    cbPSPContaPix.Enabled := True;
    cbAmbientePSP.Enabled := True;
  end
  else
  begin
    sbtnArquivoCertificado.Enabled := False;
    sbtnArquivoChavePrivada.Enabled := False;
    sbtnArquivoRootCertificado.Enabled := False;
    sbtnArquivoPFX.Enabled := False;    
    cbPSPContaPix.Enabled := False;
    cbAmbientePSP.Enabled := False;
  end;
end;

procedure TFContaPixCad.FormActivate(Sender: TObject);
begin
  inherited;
  odBuscarArquivos.InitialDir := GetCurrentDir;
  odBuscarArquivos.Filter :=   'Certificados Digitais |*.cer;*.pfx;*.pem;*.crt;*.key';
  PopularTipoBanco(cbPSPContaPix);
  PopularTipoAmbiente(cbAmbientePSP);
end;

procedure TFContaPixCad.sbtnArquivoCertificadoClick(Sender: TObject);
begin
  inherited;
 if odBuscarArquivos.Execute then
  begin
    dbArquivoCertificado.Text := odBuscarArquivos.FileName;
  end;
end;

procedure TFContaPixCad.sbtnArquivoChavePrivadaClick(Sender: TObject);
begin
  inherited;
 if odBuscarArquivos.Execute then
  begin
    dbArquivoChavePrivada.Text := odBuscarArquivos.FileName;
  end;
end;

procedure TFContaPixCad.sbtnArquivoRootCertificadoClick(Sender: TObject);
begin
  inherited;
 if odBuscarArquivos.Execute then
  begin
    dbArquivoRootCertificado.Text := odBuscarArquivos.FileName;
  end;
end;

procedure TFContaPixCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DMBancoAgencia do
  begin
    QContaPix.Close;
    QContaPixCons.Close;
  end;
  inherited;
  Action := caFree;
  FContaPixCad := nil;
end;

procedure TFContaPixCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FBancoPixCons = Nil then
    FBancoPixCons:=TFBancoPixCons.Create(Application);
  If FBancoPixCons.ShowModal=mrOk then
    begin
      with DMBancoAgencia do
      begin
        QContaPix.Close;
        QContaPix.SetVariable('PK',QContaPixConsCOD_BANCO_AGENCIA_PIX.Value);
        QContaPix.Open;
        cbPSPContaPix.ItemIndex := QContaPixCOD_PSP_BANCO.Value;
        cbAmbientePSP.ItemIndex := QContaPixIND_AMBIENTE_PSP.Value;
      end;

    end;
  SBRefreshClick(Sender);
end;

procedure TFContaPixCad.PopularTipoBanco(combo: TComboBox);
var
  pspBancoPix : TTipoBancoPix;
begin
  Combo.Clear;
  for pspBancoPix := tbpBancodoBrasil to tbpMatera do
  begin
    if not (pspBancoPix in([tbpMercadoPago..tbpMatera])) then
      Combo.Items.Add(GetEnumName(TypeInfo(TTipoBancoPix),Integer(pspBancoPix)));
  end;

end;

procedure TFContaPixCad.PopularTipoAmbiente(combo: TComboBox);
var
  pspBancoPix : TTipoBancoPix;
  j : integer;
begin
  Combo.Clear;
  Combo.Items.Clear;
  for j := Integer(ambTeste) to Integer(ambPreProducao) do
     Combo.Items.Add( GetEnumName(TypeInfo(TACBrPixCDAmbiente), integer(j) ));

end;

procedure TFContaPixCad.FormCreate(Sender: TObject);
begin
  inherited;
  //As informações são case sensitive
  Bib.addControleCharCase(dbDescClientId, Self.Name);
  Bib.addControleCharCase(dbConsumerKey, Self.Name);
  Bib.addControleCharCase(dbSenhaPfx, Self.Name);
  Bib.addControleCharCase(dbClientSecret, Self.Name);
  Bib.addControleCharCase(dbConsumerSecret, Self.Name);
  Bib.addControleCharCase(dbToken, Self.Name);
  Bib.addControleCharCase(dbAccessKey, Self.Name);
  Bib.addControleCharCase(dbDeveloperApplicationKey, Self.Name);
  Bib.addControleCharCase(dbAccessToken, Self.Name);
  Bib.addControleCharCase(dbSecretKey, Self.Name);
  Bib.addControleCharCase(dbMediatorFee, Self.Name);
  Bib.addControleCharCase(dbTokenSandBox, Self.Name);
  Bib.addControleCharCase(dbAccountID, Self.Name);
  Bib.addControleCharCase(dbChavePix, Self.Name);

  PopularTipoBanco(cbPSPContaPix);
  PopularTipoAmbiente(cbAmbientePSP);

  with DMBancoAgencia do
  begin
  // para localizar os certificados do pix
    QContaPix.Open;
    cbPSPContaPix.ItemIndex := QContaPixCOD_PSP_BANCO.Value;
    cbAmbientePSP.ItemIndex := QContaPixIND_AMBIENTE_PSP.Value
  end;


end;

procedure TFContaPixCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  with DMBancoAgencia do
  begin
    if(Trim(MELocaliza.Text) <> '') then
    begin
      QContaPix.Close;
      QContaPix.SetVariable('PK',StrToInt(trim(MELocaliza.Text)));
      QContaPix.Open;
    end;
    if QContaPix.RecordCount > 0 then
    begin
      cbPSPContaPix.ItemIndex := QContaPixCOD_PSP_BANCO.Value;
      cbAmbientePSP.ItemIndex := QContaPixIND_AMBIENTE_PSP.Value
    end;
  end;
end;

procedure TFContaPixCad.cbPSPContaPixChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert, dsEdit] then
    DSPrimario.DataSet.FieldByName('COD_PSP_BANCO').Value := cbPSPContaPix.ItemIndex;
end;

procedure TFContaPixCad.cbAmbientePSPChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert, dsEdit] then
    DSPrimario.DataSet.FieldByName('IND_AMBIENTE_PSP').Value := cbAmbientePSP.ItemIndex;
end;

procedure TFContaPixCad.dbArquivoCertificadoExit(Sender: TObject);
var
  a, e: String;
  pspBancoPix : TTipoBancoPix;
begin
  inherited;

  pspBancoPix := TTipoBancoPix(cbPSPContaPix.ItemIndex);
  // Se o caminho existir e o campo não estiver vazio, testa se o certificado
  // é valido

  if ((not FileExists(Trim(dbArquivoCertificado.Text)))
              and (Trim(dbArquivoCertificado.Text) <> '')) then
  begin
    a := trim(dbArquivoCertificado.Text);

    lblErroCertificado.Visible := True;

    case pspBancoPix of

      tbpBancodoBrasil: e := ValidarCertificadoPEM(a);
      tbpSantander: e := EmptyStr;
      tbpInter: e := ValidarCertificadoPEM(a);
      tbpItau: e := EmptyStr;
      tbpSicredi: e := ValidarCertificadoCER(a);
      tbpShipay: e := EmptyStr;
      tbpSicoob: e := ValidarCertificadoCER(a);
      tbpPagSeguro: e := ValidarCertificadoCER(a);
      tbpGerenciaNet: e := EmptyStr;
      tbpBradesco: e := EmptyStr;
      tbpPixPDV: e := EmptyStr;
      tbpAilos: e := ValidarCertificadoPEM(a);
      tbpCielo: e := EmptyStr;
      tbpMercadoPago: e := EmptyStr;
      tbpMatera: e := ValidarCertificadoPEM(a);

    else
      e := 'Não foi possível verificar o arquivo de Certificado!';

    end;
  end;

  lblErroCertificado.Caption := e;

end;

procedure TFContaPixCad.dbArquivoPFXExit(Sender: TObject);
var
  a, e: String;
  pspBancoPix : TTipoBancoPix;
begin
  inherited;

  pspBancoPix := TTipoBancoPix(cbPSPContaPix.ItemIndex);
  // Se o caminho existir e o campo não estiver vazio, testa se o certificado
  // é valido

  e := EmptyStr;

  if ((not FileExists(Trim(dbArquivoPFX.Text)))
              and (Trim(dbArquivoPFX.Text) <> '')) then
  begin
    a := trim(dbArquivoPFX.Text);

    lblErroPFX.Visible := True;

    case pspBancoPix of

      tbpBancodoBrasil: e := ValidarCertificadoPFX(a);
      tbpSantander: e := ValidarCertificadoPFX(a);
      tbpInter: e := EmptyStr;
      tbpItau: e := EmptyStr;
      tbpSicredi: e := EmptyStr;
      tbpShipay: e := EmptyStr;
      tbpSicoob: e := EmptyStr;
      tbpPagSeguro: e := EmptyStr;
      tbpGerenciaNet: e := ValidarCertificadoPFX(a);
      tbpBradesco: e := ValidarCertificadoPFX(a);
      tbpPixPDV: e := EmptyStr;
      tbpAilos: e := EmptyStr;
      tbpCielo: e := EmptyStr;
      tbpMercadoPago: e := EmptyStr;
      tbpMatera: e := EmptyStr;

    else
      e := 'Não foi possível verificar o arquivo PFX!';

    end;
  end;

  lblErroPFX.Caption := e;

end;

procedure TFContaPixCad.dbArquivoChavePrivadaExit(Sender: TObject);
var
  a, e: String;
  pspBancoPix : TTipoBancoPix;
begin
  inherited;

  pspBancoPix := TTipoBancoPix(cbPSPContaPix.ItemIndex);
  // Se o caminho existir e o campo não estiver vazio, testa se o certificado
  // é valido

  e := EmptyStr;

  if ((not FileExists(Trim(dbArquivoChavePrivada.Text)))
              and (Trim(dbArquivoChavePrivada.Text) <> '')) then
  begin
     a := trim(dbArquivoChavePrivada.Text);

     lblErroChavePrivada.Visible := true;

    case pspBancoPix of

      tbpBancodoBrasil: e := ValidarChavePrivada(a);
      tbpSantander: e := EmptyStr;
      tbpInter: e := ValidarChavePrivada(a);
      tbpItau: e := ValidarChavePrivada(a);
      tbpSicredi: e := ValidarChavePrivada(a);
      tbpShipay: e := EmptyStr;
      tbpSicoob: e := ValidarChavePrivada(a);
      tbpPagSeguro: e := ValidarChavePrivada(a);
      tbpGerenciaNet: e := EmptyStr;
      tbpBradesco: e := EmptyStr;
      tbpPixPDV: e := EmptyStr;
      tbpAilos: e := ValidarChavePrivada(a);
      tbpCielo: e := EmptyStr;
      tbpMercadoPago: e := EmptyStr;
      tbpMatera: e := ValidarChavePrivada(a);

    else
      e := 'Não foi possível verificar o arquivo de Chave Privada!';

    end;
  end;

  lblErroChavePrivada.Caption := e;

end;

procedure TFContaPixCad.dbArquivoRootCertificadoExit(Sender: TObject);
var
  a, e: String;
  pspBancoPix : TTipoBancoPix;
begin
  inherited;

  pspBancoPix := TTipoBancoPix(cbPSPContaPix.ItemIndex);
  // Se o caminho existir e o campo não estiver vazio, testa se o certificado
  // é valido

  e := EmptyStr;

  if ((not FileExists(Trim(dbArquivoRootCertificado.Text)))
              and (Trim(dbArquivoRootCertificado.Text) <> '')) then
  begin
     a := trim(dbArquivoRootCertificado.Text);

     lblErroChavePrivada.Visible := true;

    case pspBancoPix of

      tbpBancodoBrasil: e := EmptyStr;
      tbpSantander: e := EmptyStr;
      tbpInter: e := EmptyStr;
      tbpItau: e := EmptyStr;
      tbpSicredi: e := EmptyStr;
      tbpShipay: e := EmptyStr;
      tbpSicoob: e := EmptyStr;
      tbpPagSeguro: e := EmptyStr;
      tbpGerenciaNet: e := EmptyStr;
      tbpBradesco: e := EmptyStr;
      tbpPixPDV: e := EmptyStr;
      tbpAilos: e := ValidarCertificadoPEM(a);
      tbpCielo: e := EmptyStr;
      tbpMercadoPago: e := EmptyStr;
      tbpMatera: e := EmptyStr;

    else
      e := 'Não foi possível verificar o Certificado Root!';

    end;
  end;

  lblErroCertificadoRoot.Caption := e;

end;

function TFContaPixCad.ValidarChavePrivada(chavePrivada: string): string;
var e: string;
begin
  e := 'OK!';
  try
    ACBrOpenSSL.LoadPrivateKeyFromFile(chavePrivada);
  except
    On Ex: Exception do
      e := Ex.Message;
  end;

  Result := e;
end;

function TFContaPixCad.ValidarCertificadoCER(certificado: string): String;
var e: string;
begin
  e := 'OK!';
  try
    ACBrOpenSSL.LoadPEMFromFile(certificado);
  except
    On Ex: Exception do
      e := Ex.Message;
  end;

  Result := e;
end;

function TFContaPixCad.ValidarCertificadoPEM(certificado: string): String;
var e: string;
begin
  e := 'OK!';
  try
    ACBrOpenSSL.LoadPEMFromFile(certificado);
  except
    On Ex: Exception do
      e := Ex.Message;
  end;

  Result := e;
end;

function TFContaPixCad.ValidarCertificadoPFX(certificado: string): String;
var e: string;
begin
  if (trim(dbSenhaPfx.Text) <> EmptyStr) then
  begin
    e := 'OK!';

    try
      ACBrOpenSSL.LoadPFXFromFile(certificado, dbSenhaPfx.Text);
    except
      On Ex: Exception do
        e := Ex.Message;
    end;
  end
  else
    e := 'Preencha a senha do PFX.';

  Result := e;
end;

end.
