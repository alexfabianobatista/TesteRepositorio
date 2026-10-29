unit UROficinaOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFROficinaOrcamento = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    qrl1: TQRLabel;
    qrl3: TQRLabel;
    qrl2: TQRLabel;
    qrl4: TQRLabel;
    QRLFilial: TQRLabel;
    QRLVeiculo: TQRLabel;
    QRLCadastro: TQRLabel;
    QRLMarca: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr1: TQRExpr;
    QRGroup2: TQRGroup;
    QRBand5: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel16: TQRLabel;
    QRDBText16: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROficinaOrcamento: TFROficinaOrcamento;

implementation

uses URelatorio_cl;

{$R *.dfm}

end.
