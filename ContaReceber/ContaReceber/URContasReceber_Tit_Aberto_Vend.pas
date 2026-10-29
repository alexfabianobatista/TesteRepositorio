unit URContasReceber_Tit_Aberto_Vend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRContasReceber_Tit_Aberto_Vend = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand4: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
  private
    { Private declarations }
    fVer : Boolean;
  public
    { Public declarations }
    property pVer : boolean read FVer write FVer default False;
  end;

var
  FRContasReceber_Tit_Aberto_Vend: TFRContasReceber_Tit_Aberto_Vend;

implementation

uses UContasReceber_cl;

{$R *.DFM}

end.
