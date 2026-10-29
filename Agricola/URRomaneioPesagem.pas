unit URRomaneioPesagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRRomaneioPesagem = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText4: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText5: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRExpr9: TQRExpr;
    QRGroup2: TQRGroup;
    QRLabel22: TQRLabel;
    QRDBText18: TQRDBText;
    QRBand5: TQRBand;
    QRExpr10: TQRExpr;
    QRLabel23: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRLabel19: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRomaneioPesagem: TFRRomaneioPesagem;

implementation

uses URomaneioAgricola_cl, UOracle_cl;

{$R *.DFM}

procedure TFRRomaneioPesagem.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMRomaneioAgricola.QRRomaneioPesagemCOD_TRANSPORTADORA.Text <> '' then
    FRRomaneioPesagem.QRLabel19.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+
                                                              DMRomaneioAgricola.QRRomaneioPesagemCOD_TRANSPORTADORA.Text)
  else
    FRRomaneioPesagem.QRLabel19.Caption := '';
end;

end.
