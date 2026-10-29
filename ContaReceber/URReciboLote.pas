unit URReciboLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRReciboLote = class(TFTRelSimples)
    QRShape1: TQRShape;
    QRGHeader: TQRGroup;
    QRLLogo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand3: TQRBand;
    QRLRazaoSocial: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLFoneFax: TQRLabel;
    QRLCepCidadeEstado: TQRLabel;
    QRLCnpjIe: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel3: TQRLabel;
    QRBandFooter: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRLabel19: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRExpr15: TQRExpr;
    QRLabel22: TQRLabel;
    QRLDataCidade: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLNumRecibo: TQRLabel;
    QRDBAssinatura: TQRDBText;
    QRDBAssinaRecibo: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRReciboLote: TFRReciboLote;
  wSUMValorRecebido: double = 0;

implementation

uses UContasReceber_cl, UBiblioteca, UContasReceber_Rel_cl, UOracle_cl,
  USequencia_cl, UParamSistema_cl, UFilial_cl;

{$R *.dfm}

procedure TFRReciboLote.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wSUMValorRecebido := (wSUMValorRecebido + DMContasReceber_Rel.cdsRContasReceberBaixaLoteval_recebido.Value);
end;

procedure TFRReciboLote.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wBib : TBib;
begin
  inherited;
  wBib := TBib.Create();
  QRLValorExtenso.Caption  := Bib.Extenso(wSUMValorRecebido,'REAL');
end;

procedure TFRReciboLote.QRBandFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wBib : TBib;
begin
  inherited;
  wBib := TBib.Create();
  QRLValorExtenso.Caption  := Bib.Extenso(wSUMValorRecebido,'REAL');
  wSUMValorRecebido := 0;
end;

procedure TFRReciboLote.QRGHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLNumRecibo.Caption := IntToStr(DMSequencia.Sequencia(DMParamSistema.QParamSistemaCOD_FILIAL.Value, 'RECIBO'));
end;

procedure TFRReciboLote.FormCreate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GRASEL' Then
     QRPrimario.Height := 522;
end;

end.
