unit URNota_Classe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNota_Classe = class(TFTRelSimples)
    QRBRodTotalFilial: TQRBand;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRGClasse: TQRGroup;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr3: TQRExpr;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel3: TQRLabel;
    QRLFilial: TQRLabel;
    procedure QRGClasseBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Classe: TFRNota_Classe;

implementation

uses URelatorioVenda_cl, UNotaSaidaParam, UOracle_cl;

{$R *.DFM}

procedure TFRNota_Classe.QRGClasseBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if FNotaSaidaParam.RG7Tipo.ItemIndex = 1 then
    QRLabel6.Caption := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE='+DMRelatorio_Venda.QRVendaClassenum_classe.Text+
                        ' AND NUM_SUBCLASSE = 0');
end;

end.
