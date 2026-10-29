unit URReciboLoteTermica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRReciboLoteTermica = class(TFTRelSimples)
    QRLRazaoSocial: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLFoneFax: TQRLabel;
    QRBandFooter: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr15: TQRExpr;
    QRShape9: TQRShape;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRGHeader: TQRGroup;
    QRLabel16: TQRLabel;
    QRDBAssinatura: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBAssinaRecibo: TQRDBText;
    QRLDataCidade: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRLQtdeParcelas: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboLoteTermica: TFRReciboLoteTermica;
  wSUMValorRecebido: double = 0;

implementation

uses UContasReceber_Rel_cl, UOracle_cl, UFilial_cl;

{$R *.dfm}

procedure TFRReciboLoteTermica.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wNrParc : String;
begin
  inherited;
  wSUMValorRecebido := (wSUMValorRecebido + DMContasReceber_Rel.cdsRContasReceberBaixaLoteval_recebido.Value);
  wNrParc:=DMOracle.BuscaNome('SELECT MAX(NUM_PARCELA) FROM TB_CONTA_RECEBER_CAB','COD_FILIAL = '+DMContasReceber_Rel.cdsRContasReceberBaixaLotecod_filial.Text +
              ' AND COD_CADASTRO = ' + DMContasReceber_Rel.cdsRContasReceberBaixaLotecod_cadastro.Text + ' AND NUM_TITULO='+DMContasReceber_Rel.cdsRContasReceberBaixaLotenum_duplicata.Text);
  QRLQtdeParcelas.Caption := 'Nr. Parcelas: ' + wNrParc;
end;

procedure TFRReciboLoteTermica.QRBandFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wSUMValorRecebido := 0;
end;

end.
