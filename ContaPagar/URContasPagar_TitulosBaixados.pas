unit URContasPagar_TitulosBaixados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasPagar_TitulosBaixados = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLDescricao_Group: TQRLabel;
    QRDBQuebra: TQRDBText;
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText5: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRLFinalidade: TQRLabel;
    QRBand5: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBDescObservacao: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagar_TitulosBaixados: TFRContasPagar_TitulosBaixados;

implementation

uses UContasPagar_cl;

{$R *.DFM}

procedure TFRContasPagar_TitulosBaixados.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if DMContasPagar.QRContasPagar_TitulosBaixadosDESC_OBSERVACAO.Value <> '' then
  begin
    QRDBDescObservacao.Enabled := true;
    QRBand3.Height := 50;
  end
  else
    QRBand3.Height := 35;
end;

end.
