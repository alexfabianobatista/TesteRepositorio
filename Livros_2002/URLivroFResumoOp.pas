unit URLivroFResumoOp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRLivroFResumoOpA = class(TFTRelSimples)
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRLCod_Filial: TQRLabel;
    QRLDesc_Filial: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand5: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand6: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRLEntrada_Saida: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLivroFResumoOpA: TFRLivroFResumoOpA;

implementation

uses ULivroFiscal_Cl;
{$R *.DFM}

procedure TFRLivroFResumoOpA.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QRLivroFResumoOpAInd_Entrada_Saida.Value = 'E' Then
     QrLEntrada_Saida.Caption := 'Notas de Entrada'
  Else
     QrLEntrada_Saida.Caption := 'Notas de Saida';

end;

end.
