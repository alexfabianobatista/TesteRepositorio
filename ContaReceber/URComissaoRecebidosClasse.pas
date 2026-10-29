unit URComissaoRecebidosClasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRComissaoRecebidosClasse = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRGroup2: TQRGroup;
    QRLabel12: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand3: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRExpr6: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRBand6: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr7: TQRExpr;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRComissaoRecebidosClasse: TFRComissaoRecebidosClasse;

implementation

uses UContasReceber_rel_cl, UOracle_cl;

{$R *.dfm}

procedure TFRComissaoRecebidosClasse.QRGroup2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with DMContasReceber_Rel do
  Begin
    QRLabel4.Caption := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+QRComissaoRecebidosClasseNUM_CLASSE.Text +
                      ' AND NUM_SUBCLASSE = 0');
  end;
end;

end.
