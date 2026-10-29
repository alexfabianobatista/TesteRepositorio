unit UROficinaOrcamentoSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFROficinaOrcamentoSintetico = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel12: TQRLabel;
    qrl1: TQRLabel;
    qrl3: TQRLabel;
    qrl2: TQRLabel;
    qrl4: TQRLabel;
    QRLFilial: TQRLabel;
    QRLVeiculo: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLMarca: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROficinaOrcamentoSintetico: TFROficinaOrcamentoSintetico;

implementation

uses URelatorio_cl;

{$R *.dfm}

end.
