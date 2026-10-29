unit URReceituario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRReceituario = class(TFTRelSimples)
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLVia: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand4: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText30: TQRDBText;
    QRShape12: TQRShape;
    QRSysData3: TQRSysData;
    QRExpr1: TQRExpr;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape26: TQRShape;
    QRLabel39: TQRLabel;
    QRCRReceituario: TQRCompositeReport;
    QRLabel23: TQRLabel;
    QRShape10: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape11: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText31: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText35: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReceituario: TFRReceituario;
implementation

uses UReceita_cl, UParamSistema_cl, UOracle_cl;

{$R *.dfm}

procedure TFRReceituario.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var wDosagem, wVendedor: string;
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
  begin
    wDosagem := '';
    wDosagem := DMOracle.FastSelect('DESC_UNIDADE_DOSAGEM_RECEITA'
      , 'TB_PRODUTO'
      , 'COD_PRODUTO = ' + DMReceita.QRReceituarioCOD_PRODUTO.Text);

    //setPropValue(pRelatorio.FindComponent('QRDBText29'), 'Enabled', 'false');
    QRDBText29.Enabled := false;
    //setPropValue(pRelatorio.FindComponent('QRLabel34'), 'Enabled', 'false');
    QRLabel34.Enabled := false;


    if wDosagem <> '' then
      //setPropValue(pRelatorio.FindComponent('QRLabel29'), 'Caption'
      //, 'DOSAGEM ' + wDosagem + '/HA')
      QRLabel29.Caption := 'DOSAGEM ' + wDosagem + '/HA'
    else
      //setPropValue(pRelatorio.FindComponent('QRLabel29'), 'Caption'
      //, 'DOSAGEM ' + DMReceita.QRReceituarioDESC_UNIDADE.Value + '/HA');
      QRLabel29.Caption := 'DOSAGEM ' + DMReceita.QRReceituarioDESC_UNIDADE.Value
        + '/HA';
    //Gian 19/10/2018 solicitado por Marlon
    //Esconder cabeçalho caso a nota tenha o vendedor 15
    {wVendedor := DMOracle.FastSelect('COD_VENDEDOR','TB_NOTA_CAB','COD_NOTA_CAB = ' + DMReceita.QRReceituarioCOD_NOTA_CAB.Text);
    if wVendedor = '15' then
    begin
      QRLTitulo.Enabled := False;
      QRDBText30.Enabled := False;
      QRDBText1.Enabled := False;
      QRLabel35.Enabled := False;
      QRDBText4.Enabled := False;
      QRLEmpresa.Enabled := False;
      QRLabel36.Enabled := False;
      QRDBText5.Enabled := False;
    end
    else
    begin
      QRLTitulo.Enabled := True;
      QRDBText30.Enabled := True;
      QRDBText1.Enabled := True;
      QRLabel35.Enabled := True;
      QRDBText4.Enabled := True;
      QRLEmpresa.Enabled := True;
      QRLabel36.Enabled := True;
      QRDBText5.Enabled := True;
    end; }
  end;
end;

end.
