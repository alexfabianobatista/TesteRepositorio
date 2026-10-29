unit URRelacaoEmprestimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRRelacaoEmprestimo = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLFilial: TQRLabel;
    QRDBText8: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRelacaoEmprestimo: TFRRelacaoEmprestimo;

implementation

uses UEmprestimo_cl;

{$R *.DFM}

end.
