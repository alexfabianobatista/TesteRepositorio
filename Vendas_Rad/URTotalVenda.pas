unit URTotalVenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRTotalVenda = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    DetailBand1: TQRBand;
    QRLFilial: TQRLabel;
    QRLVendedor: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand3: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel11: TQRLabel;
    QRShape1: TQRShape;
    QRGroup2: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand5: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRLClasse: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTotalVenda: TFRTotalVenda;

implementation

uses URelatorioVenda_cl, UOracle_cl;

{$R *.DFM}

procedure TFRTotalVenda.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
{*  QRLClasse.Caption := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+IntToStr(DMRelatorio_Venda.QRTotalVendaNUM_CLASSE.Value)+
                                           'AND NUM_SUBCLASSE = 0'); *}
 end;

end.
