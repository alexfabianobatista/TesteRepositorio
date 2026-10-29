unit URNota_VendedorPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRNota_VendedorPgto = class(TFTRelSimples)
    QRBDetalhe: TQRBand;
    QRGCabFilial: TQRGroup;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLPctVista: TQRLabel;
    QRLPctPrazo: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
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
