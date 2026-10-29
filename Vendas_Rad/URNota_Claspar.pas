unit URNota_Claspar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFRNota_Claspar = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand2: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLSaldo: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    QRBand3: TQRBand;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel32: TQRLabel;
    QRDBText24: TQRDBText;
    QRLSituacao: TQRLabel;
    QRLNome: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    fSaldo : Real;
    Property pSaldo : Real Read fSaldo Write fSaldo;
  public
    { Public declarations }
  end;

var
  FRNota_Claspar: TFRNota_Claspar;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_Claspar.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  pSaldo := DMRelatorio_Venda.QRClasparQt_Classificado.Value;
end;

procedure TFRNota_Claspar.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  If DMRelatorio_Venda.QRClasparInd_Situacao.Value = 'ABERTO' Then
   Begin
    pSaldo := pSaldo - DMRelatorio_Venda.QRClasparQt_Quantidade.Value;
    QRLSaldo.Caption := FormatFloat('###,###,##0',pSaldo);
    QRLSituacao.Caption := '';
   End
  Else
   Begin
    QRLSaldo.Caption := FormatFloat('###,###,##0',pSaldo);
    QRLSituacao.Caption := '';
    QRLSituacao.Caption := 'Cancelado';
   End;
  QRLNome.Caption := Trim(DMRelatorio_Venda.QRClasparNome_Cadastro.Text) + '/' + Trim(DMRelatorio_Venda.QRClasparDesc_Cidade.Text);
end;

end.
