unit URTransfEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRTransfEstoque = class(TFTRelSimples)
    QRLFilialOrig: TQRLabel;
    QRLFilialDest: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRGroup3: TQRGroup;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup4: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRExpr1: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel14: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLFilial: TQRLabel;
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRTransfEstoque: TFRTransfEstoque;

implementation

uses UEstoqueSeguranca_cl, UOracle_cl;

{$R *.DFM}

procedure TFRTransfEstoque.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  QRLFilial.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+
                                          DMEstoqueSeguranca.QRTransfEstoqueCOD_FILIAL.Text);
end;

end.
