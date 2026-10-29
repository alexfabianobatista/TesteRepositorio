unit URAvaliacaoDesempenho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRAvaliacaoDesempenho = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLTipo: TQRLabel;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel13: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLPeriodo_1: TQRLabel;
    QRLPeriodo_2: TQRLabel;
    QRLPeriodo_3: TQRLabel;
    QRLPeriodo_4: TQRLabel;
    QRLPeriodo_5: TQRLabel;
    QRLPeriodo_6: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRAvaliacaoDesempenho: TFRAvaliacaoDesempenho;

implementation

uses UIndiceDesempenho_cl;

{$R *.DFM}

procedure TFRAvaliacaoDesempenho.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMIndiceDesempenho.QRAvaliacaoDesempenhoInd_Ativo_Passivo.text = '2' then
    QRLTipo.Caption:='PASSIVO'
  else
    QRLTipo.Caption:='ATIVO';
end;

end.
