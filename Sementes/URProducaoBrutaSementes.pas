unit URProducaoBrutaSementes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRProducaoBrutaSementes = class(TFTRelSimples)
    DetailBand1: TQRBand;
    FSD: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9:   TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText9: TQRDBText;
    SummaryBand2: TQRBand;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRLCidade: TQRLabel;
    QRLabel7: TQRLabel;
    QRLDTEmissao: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProducaoBrutaSementes: TFRProducaoBrutaSementes;

implementation

uses UProducaoSemente_cl;

{$R *.DFM}

end.
