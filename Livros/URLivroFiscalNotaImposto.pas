unit URLivroFiscalNotaImposto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFrLivroFiscalNotasImposto = class(TFTRelSimples)
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRLEntradaSaida: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText11: TQRDBText;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrLivroFiscalNotasImposto: TFrLivroFiscalNotasImposto;

implementation

uses ULivroFiscal_Cl;

{$R *.DFM}

procedure TFrLivroFiscalNotasImposto.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QRNotasImpostoInd_Entrada_Saida.Value = 'E' Then
     QRLEntradaSaida.Caption := 'Notas  Entrada'
  Else
     QRLEntradaSaida.Caption := 'Notas  Saida';

end;

end.
