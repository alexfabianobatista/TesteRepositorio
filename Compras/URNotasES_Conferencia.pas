unit URNotasES_Conferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRNotasES_Conferencia = class(TFTRelSimples)
    QRBCabNota: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSDItemNF: TQRSubDetail;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRSDBases: TQRSubDetail;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBTDescLote: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRSDContaPagar: TQRSubDetail;
    QRDBText27: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRBRodItem: TQRBand;
    QRBRodBase: TQRBand;
    QRShape2: TQRShape;
    QRBRodContaPagar: TQRBand;
    QRShape3: TQRShape;
    QRBCabBase: TQRBand;
    QRLabel18: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRBCabContaPagar: TQRBand;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLIpi: TQRLabel;
    QRDBTIpi: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText37: TQRDBText;
    QRLNota: TQRLabel;
    QRLValUn: TQRLabel;
    QRLabel3: TQRLabel;
    QRLVendedor: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText26: TQRDBText;
    QRLObra: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText36: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRLTotal: TQRLabel;
    QRShape1: TQRShape;
    QRLIPITotal: TQRLabel;
    QRLabel36: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel37: TQRLabel;
    QRLTotalFinal: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText43: TQRDBText;
    QRLSTTotal: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText44: TQRDBText;
    QRLTotalBaseIcms: TQRLabel;
    QRLTotalIcms: TQRLabel;
    QRLTotalQtd: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText45: TQRDBText;
    QRLabel44: TQRLabel;
    QRDBText46: TQRDBText;
    QRLabel45: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRPrimarioStartPage(Sender: TCustomQuickRep);
    procedure QRSDItemNFBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBCabBaseAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    wValTotal: double;
    wValIPITotal: double;
    wValTotalFinal : double;
    wValSTTotal : double;
    wValTotalBaseIcms : double;
    wValTotalIcms : double;
    wValTotalQtd : double;
  public
    { Public declarations }
    property pValTotal: double read wValTotal write wValTotal;
    property pValTotalFinal: double read wValTotalFinal write wValTotalFinal;
    property pValIPITotal: double read wValIPITotal write wValIPITotal;
    property pValSTTotal: double read wValSTTotal write wValSTTotal;

    property pValTotalBaseIcms: double read wValTotalBaseIcms write wValTotalBaseIcms;
    property pValTotalIcms: double read wValTotalIcms write wValTotalIcms;
    property pValTotalQtd: double read wValTotalQtd write wValTotalQtd;
  end;

var
  FRNotasES_Conferencia: TFRNotasES_Conferencia;

implementation

uses URelatorioVenda_cl, UParamSistema_cl, DB;

{$R *.DFM}

procedure TFRNotasES_Conferencia.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') then
  Begin
    QRLabel10.Caption := 'Classe';
    QRDBText7.Enabled := False;
    QRDBTDescLote.Left := 307;
    QRDBTDescLote.Width := 160;
    QRDBTDescLote.DataField := 'DESC_CLASSE';
  end;
end;

procedure TFRNotasES_Conferencia.QRPrimarioStartPage(
  Sender: TCustomQuickRep);
begin
  inherited;
  QRBand2.Enabled := false;
end;

procedure TFRNotasES_Conferencia.QRSDItemNFBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  pValTotal := pValTotal + DMRelatorio_Venda.QConfItemVAL_TOTAL.Value;
  pValTotalFinal := pValTotalFinal + DMRelatorio_Venda.QConfItemVAL_TOTAL.Value;
  QRLTotal.Caption := FormatFloat('#,##0.00', pValTotal);
  pValIPITotal := pValIPITotal + DMRelatorio_Venda.QConfItemVAL_IPI.Value;
  pValSTTotal := pValSTTotal + DMRelatorio_Venda.QConfItemVAL_ICMS_SUBST.Value;
  QRLIPITotal.Caption := FormatFloat('#,##0.00', pValIPITotal);
  QRLSTTotal.Caption := FormatFloat('#,##0.00',pValSTTotal);
  QRLTotalFinal.Caption := FormatFloat('#,##0.00', pValTotalFinal);
  pValTotalBaseIcms := pValTotalBaseIcms + DMRelatorio_Venda.QConfItemVAL_ICM_BASE.Value;
  QRLTotalBaseIcms.Caption := formatfloat('#,##0.00',pValTotalBaseIcms);
  pValTotalIcms := pValTotalIcms + DMRelatorio_Venda.QConfItemVAL_ICM.Value;
  QRLTotalIcms.Caption := formatfloat('#,##0.00', pValTotalIcms);
  pValTotalQtd := pValTotalQtd + DMRelatorio_Venda.QConfItemQT_QUANTIDADE.Value;
  QRLTotalQtd.Caption := formatfloat('#,##0.00', pValTotalQtd);
end;

procedure TFRNotasES_Conferencia.QRBCabBaseAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  pValTotal := 0;
  pValSTTotal := 0;
  pValIPITotal := 0;
end;

procedure TFRNotasES_Conferencia.SummaryBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  pValTotalFinal := 0;

  pValTotalBaseIcms := 0;
  pValTotalIcms := 0;
  pValTotalQtd := 0;
end;

end.
