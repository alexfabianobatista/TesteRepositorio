unit URNotasOperacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNotasOperacao = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBTotOper: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLDepartamento: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNotasOperacao: TFRNotasOperacao;

implementation

uses ULivroFiscal_Cl, URNotasOperacaoResumo;

{$R *.DFM}

end.
