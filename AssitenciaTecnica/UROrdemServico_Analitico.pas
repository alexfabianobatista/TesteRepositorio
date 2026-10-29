unit UROrdemServico_Analitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROrdemServico_Analitico = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand6: TQRBand;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel18: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    QRLPeriodoEntrada: TQRLabel;
    QRLPeriodoSaida: TQRLabel;
    QRLIndSituacaoOS: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText9: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Analitico: TFROrdemServico_Analitico;

implementation

uses UOrdemServico_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFROrdemServico_Analitico.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'FURGOESMED') or (DMParamSistema.CodEmpresa = 'MEDIPECAS') then
   begin
     QRDBText7.DataField := 'NUM_FABRICANTE';
   end;
end;

end.
