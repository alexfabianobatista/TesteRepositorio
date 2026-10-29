unit URContasReceber_Tit_Vend_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, StdCtrls, QRWebFilt,
  QRPDFFilt;

type
  TFRContasReceber_Tit_Vend_Aberto = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    QRLDepartamento: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRDBText12: TQRDBText;
    QRLCadastro: TQRLabel;
    QRDBText1: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRDBText13: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText14: TQRDBText;
    QRLMensagem: TQRLabel;
    QRBand6: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasReceber_Tit_Vend_Aberto: TFRContasReceber_Tit_Vend_Aberto;

implementation

uses UContasReceber_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRContasReceber_Tit_Vend_Aberto.QRBand5AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
//  QRPrimario.NewPage;
end;

procedure TFRContasReceber_Tit_Vend_Aberto.QRGroup2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  With DmContasReceber  do
  Begin
    If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CGS'
    Then
       QRLCadastro.Caption := Trim(QRContasReceber_Tit_Abertos_vendNome.Text) + ' - ' +
                           Trim(QRContasReceber_Tit_Abertos_vendDesc_Endereco.Text) + ' - ' +
                           Trim(QRContasReceber_Tit_Abertos_vendDesc_Cidade.Text) + ' - ' +
                           Trim(QRContasReceber_Tit_Abertos_vendDesc_Telefone.Text) + ' - ' +
                           Trim(QRContasReceber_Tit_Abertos_vendDesc_Classificacao.Text)
    Else
       QRLCadastro.Caption := Trim(QRContasReceber_Tit_Abertos_vendNome.Text);

  End;
end;

procedure TFRContasReceber_Tit_Vend_Aberto.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  If QRBand4.Enabled Then
    If Trim(DMContasReceber.QRContasReceber_Tit_Abertos_vendDesc_Observacao.Text) <> '' Then
       QRChildBand1.Enabled := True
    Else
       QRChildBand1.Enabled := False
  Else
     QRChildBand1.Enabled := False;

end;

end.
