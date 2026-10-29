unit URDep_Pendente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRDep_Pendente = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLPeriodo: TQRLabel;
    QRLBanco: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRDep_Pendente: TFRDep_Pendente;

implementation

uses UBancoAgencia_cl, UBancoAgenciaRel_cl;

{$R *.DFM}

end.
