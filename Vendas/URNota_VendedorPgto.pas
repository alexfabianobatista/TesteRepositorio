unit URNota_VendedorPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_VendedorPgto = class(TFTRelSimples)
    QRBDetalhe: TQRBand;
    QRGCabFilial: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLPctVista: TQRLabel;
    QRLPctPrazo: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr7: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRGroup1: TQRGroup;
    QRExpr2: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    procedure QRBDetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_VendedorPgto: TFRNota_VendedorPgto;

implementation

uses URelatorioVenda_cl;

{$R *.DFM}

procedure TFRNota_VendedorPgto.QRBDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMRelatorio_Venda do
  Begin
    QRLPctVista.Caption := FormatFloat('#0.00',QRVendedorPgtoSVal_Vista.Value*100/(QRVendedorPgtoSVal_Vista.Value+QRVendedorPgtoSVal_Prazo.Value) );
    QRLPctPrazo.Caption := FormatFloat('#0.00',QRVendedorPgtoSVal_Prazo.Value*100/(QRVendedorPgtoSVal_Vista.Value+QRVendedorPgtoSVal_Prazo.Value) );
  End;
end;

end.
