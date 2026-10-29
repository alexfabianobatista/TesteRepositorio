unit URConhecimentoFreteTransportador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, QRExport, ExtCtrls;

type
  TFRConhecimentoFreteTransportador = class(TFTRelSimples)
    QRGroup3: TQRGroup;
    QRLabel15: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand5: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr21: TQRExpr;
    QRBand6: TQRBand;
    QRLabel17: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr22: TQRExpr;
    QRBand7: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr23: TQRExpr;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr24: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLFilial: TQRLabel;
    QRLTransportador: TQRLabel;
    QRLCadastroNF: TQRLabel;
    QRLProduto: TQRLabel;
    QRLClasse: TQRLabel;
    QRLSituacao: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRConhecimentoFreteTransportador: TFRConhecimentoFreteTransportador;

implementation

uses UConhecimentoFrete_cl;

{$R *.DFM}

end.
