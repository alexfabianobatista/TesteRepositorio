unit UrCaixaTransferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrCaixaTransferencia = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand4: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRLDescricao: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRSysData3: TQRSysData;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrCaixaTransferencia: TFrCaixaTransferencia;
  wValorTotal : Real;

implementation

uses UCaixa_Transf_cl, UBiblioteca;

{$R *.DFM}

procedure TFrCaixaTransferencia.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wExtenso : String;
begin
  inherited;
  wExtenso := Bib.Extenso(wValorTotal,'REAL');
  QRLDescricao.Caption := 'Transferência de numerários no valor de R$ '+FormatFloat('#,##0.00',wValorTotal)+ '('+wExtenso+')nesta data conforme relacao acima;';
  wValorTotal := 0;
end;

procedure TFrCaixaTransferencia.FormActivate(Sender: TObject);
begin
  inherited;
  wValorTotal := 0;
end;

procedure TFrCaixaTransferencia.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wValorTotal := wValorTotal + DMCaixa_Transf.QRCaixaTransfVal_Lancamento.Value;
end;

end.
