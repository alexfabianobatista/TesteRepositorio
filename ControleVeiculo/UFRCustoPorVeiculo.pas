unit UFRCustoPorVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRCustoPorVeiculo = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand3: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRExpr2: TQRExpr;
    QRLPlaca: TQRLabel;
    QRLClassificacao: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLTipo: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRExpr3: TQRExpr;
    QRLCadastro: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRCustoPorVeiculo: TFRCustoPorVeiculo;

implementation

uses UCustoVeiculoMov_cl;

{$R *.DFM}

end.
