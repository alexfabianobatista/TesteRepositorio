unit URGastoVeiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRGastoVeiculo = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    Cadastro: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText7: TQRDBText;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText13: TQRDBText;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRGastoVeiculo: TFRGastoVeiculo;

implementation

uses UCustoVeiculoMov_cl;

{$R *.DFM}

end.
