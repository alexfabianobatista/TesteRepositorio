unit FRFichaCadastral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, variants, QRWebFilt,
  QRPDFFilt;

type
  TFRFichaCad = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText25: TQRDBText;
    QRShape3: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel36: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText41: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText42: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText43: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel85: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel86: TQRLabel;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRLabel91: TQRLabel;
    QRShape4: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText44: TQRDBText;
    QRDBText46: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText45: TQRDBText;
    QRDBText50: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText49: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText48: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText47: TQRDBText;
    QRLabel53: TQRLabel;
    QRLabel57: TQRLabel;
    QRDBText51: TQRDBText;
    QRLabel58: TQRLabel;
    QRDBText52: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRDBText53: TQRDBText;
    QRLabel61: TQRLabel;
    QRDBText54: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText55: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText56: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText57: TQRDBText;
    QRShape5: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel68: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabel69: TQRLabel;
    QRDBText60: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText61: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel74: TQRLabel;
    QRDBText65: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel78: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel92: TQRLabel;
    QRDBText80: TQRDBText;
    QRBand4: TQRBand;
    QRLabel93: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape6: TQRShape;
    QRLabel89: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel25: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape1: TQRShape;
    QRSysData3: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText27: TQRDBText;
    QRLNome: TQRLabel;
    QRLCidade: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape7: TQRShape;
    QRLabel27: TQRLabel;
    QRBand5: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel30: TQRLabel;
    QRShape8: TQRShape;
    QRLabel52: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRLabel79: TQRLabel;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRFichaCad: TFRFichaCad;

implementation

uses UCadastro_Rel_cl,UParamSistema_cl;

{$R *.DFM}

procedure TFRFichaCad.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  DMCadastro_Rel.QRProprCadastro.Close;
  DMCadastro_Rel.QRProprCadastro.SetVariable('Cod_Cadastro',DMCadastro_Rel.QRCadastroCod_Cadastro.Value);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Regiao',Null);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Tipo_Cadastro',Null);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Ramo',Null);
  DMCadastro_Rel.QRProprCadastro.SetVariable('Estado',Null);
  DMCadastro_Rel.QRProprCadastro.Open;
  QRLNome.Caption := Trim(DMCadastro_Rel.QRCadastroNome.Value);
  QRLCidade.Caption := Trim(DMCadastro_Rel.QRCadastroDesc_Cidade.Value) + ' - ' + DMCadastro_Rel.QRCadastroCod_Estado.Value;
  if ((DMparamsistema.CodEmpresa = 'COZER') or (DMparamsistema.CodEmpresa = 'PROPE')) then
  begin
    QRLabel77.Enabled  := False;
    QRDBText66.Enabled := False;
    QRDBText67.Enabled := False;
    QRDBText69.Enabled := False;
  end
  else
  begin
    QRLabel77.Enabled  := True;
    QRDBText66.Enabled := True;
    QRDBText67.Enabled := True;
    QRDBText69.Enabled := True;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SONOBOM' then
  begin
    QRBand4.Enabled      := False;
    QRSubDetail1.Enabled := False;
  end;

end;

procedure TFRFichaCad.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SONOBOM' then
  begin
    QRDBText17.Enabled   := False;
    QRLabel21.Enabled    := False;
    QRDBText18.Enabled   := False;
    QRDBText20.Enabled   := False;
    QRDBText25.Enabled   := False;
    QRLabel29.Enabled    := False;
    QRDBText26.Enabled   := False;
    QRDBText23.Enabled   := False;
    QRDBText15.Enabled   := False;
    QRLabel3.Enabled     := False;
    QRDBText75.Enabled   := True;
    QRDBText76.Enabled   := True;
    QRDBText81.Enabled   := True;
    QRDBText82.Enabled   := True;
    QRLabel20.Caption    := 'Empresa: ';
    QRLabel23.Caption    := 'Fone: ';
    QRLabel28.Caption    := 'Função: ';
    QRLabel10.Caption    := 'Tempo na emp.: ';
  end;
end;

end.
