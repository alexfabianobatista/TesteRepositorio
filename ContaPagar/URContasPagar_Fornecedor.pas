unit URContasPagar_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, quickrpt, Qrctrls, ExtCtrls;

type
  TFRContasPagar_Fornecedor = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    ChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    GroupHeaderBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand4: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagar_Fornecedor: TFRContasPagar_Fornecedor;

implementation

uses UContasPagar_cl;

{$R *.DFM}




end.
