unit URLivroFResumoOpS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRLivroFResumoOpS = class(TFTRelSimples)
    QRLabel10: TQRLabel;
    QRLCod_Filial: TQRLabel;
    QRLDesc_Filial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRGroup1: TQRGroup;
    QRLEntrada_Saida: TQRLabel;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLivroFResumoOpS: TFRLivroFResumoOpS;

implementation
uses ULivroFiscal_Cl;

{$R *.DFM}

procedure TFRLivroFResumoOpS.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QRLivroFResumoOpSInd_Entrada_Saida.Value = 'E' Then
     QrLEntrada_Saida.Caption := 'Notas de Entrada'
  Else
     QrLEntrada_Saida.Caption := 'Notas de Saida';

end;

end.
