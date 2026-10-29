unit URNotasCPR_Relacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt,
  StdCtrls;

type
  TFRNotasCPR_Relacao = class(TFTRelSimples)
    QRBandCab: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLFilial: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    QRLMotivo: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText15: TQRDBText;
    QRLOperacao: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel11: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLQuantidade: TQRLabel;
    QRLValor: TQRLabel;
    QRLCusto: TQRLabel;
    QRLVolume: TQRLabel;
    QRLDesconto: TQRLabel;
    QrlPeriodo: TQRLabel;
    QRDBText21: TQRDBText;
    QRGFilial: TQRGroup;
    QRLabel20: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRTotalFilial: TQRBand;
    QRLabel21: TQRLabel;
    QRLTotalGroup: TQRLabel;
    procedure QRBandCabBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRTotalFilialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    wQtdGroup : integer;
  public
    { Public declarations }
  end;

var
  FRNotasCPR_Relacao: TFRNotasCPR_Relacao;
  wQuantidade, wValor, wCusto, wVolume, wDesconto : Real;

implementation

uses UContratoCPR_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRNotasCPR_Relacao.QRBandCabBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'PAULINHO' then
  begin
    QRDBText1.Font.Size := 9;
    QRDBText12.Font.Size := 9;
    QRDBText2.Font.Size := 9;
    QRDBText5.Font.Size := 9;
    QRDBText4.Font.Size := 9;
    QRDBText6.Font.Size := 8;
    QRDBText6.Width := 75;
    QRDBText8.Font.Size := 8;
    QRDBText8.Width := 75;
    QRDBText9.Font.Size := 8;
    QRDBText14.Font.Size := 9;
    QRDBText7.Font.Size := 9;
    QRDBText16.Font.Size := 9;
    QRDBText10.Font.Size := 9;
    QRDBText13.Font.Size := 9;
  end;
  wQuantidade := wQuantidade + DMContrato_CPR.QNotasContratoQt_Quantidade.Value;
  wValor := wValor + DMContrato_CPR.QNotasContratoSVal_Total.Value;
  if DMParamSistema.CodEmpresa <> 'ARZ' then  // CESAR 09/12/2019 PARA ATENDER SOLICITACAO DA ALICE
     wCusto := wCusto + DMContrato_CPR.QNotasContratoSVal_Custo.Value;
  wVolume := wVolume + DMContrato_CPR.QNotasContratoNum_Volumes.Value;
  wDesconto := wDesconto + DMContrato_CPR.QNotasContratoSVal_Desconto.Value;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOFECO' then
  begin
    QRDBText14.Mask := '#,###,###0.000';
  end;
  QRLTotalGroup.Caption := IntToStr(wQtdGroup);
  Inc(wQtdGroup);

end;

procedure TFRNotasCPR_Relacao.FormCreate(Sender: TObject);
begin
  inherited;
  wQuantidade := 0;
  wValor := 0;
  wCusto := 0;
  wVolume := 0;
  wDesconto := 0;

end;

procedure TFRNotasCPR_Relacao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLQuantidade.Caption := FormatFloat('#,###,###0.000', wQuantidade);
  QRLValor.Caption := FormatFloat('#,###,###0.000', wValor);
  QRLCusto.Caption := FormatFloat('#,###,###0.000', wCusto);
  QRLVolume.Caption := FormatFloat('#,###,###0', wVolume);
  QRLDesconto.Caption := FormatFloat('#,##0.00', wDesconto);
  wQuantidade := 0;
  wCusto := 0;
  wValor := 0;
  wVolume := 0;
  wDesconto := 0;

  if DMParamSistema.CodEmpresa = 'PAULINHO' then
  begin
    QRLabel15.Font.Size  := 9;
    QRSysData3.Font.Size := 9;
    QRLabel1.Font.Size   := 9;
    QRLQuantidade.Font.Size := 9;
    QRLValor.Font.Size      := 9;
    QRLDesconto.Font.Size   := 9;
    QRLCusto.Font.Size      := 9;
    QRLVolume.Font.Size     := 9;
  end;
end;

procedure TFRNotasCPR_Relacao.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'HOSPITAL' then
  begin
    QRDBText4.Enabled := False; //Serie
    QRLabel8.Enabled   := False; //Num. nota
    QRDBText5.Enabled  := False;//Num. nota
    QRLabel10.Enabled  := False; //Operação
    QRDBText9.Enabled  := False; //Operação
    QRLabel5.Enabled   := False; //Pedido
    QRDBText2.Enabled  := False; //Pedido
    QRDBText19.Enabled := False; //Qtde Item
    QRLabel19.Enabled  := False; //Desconto
    QRDBText16.Enabled := False; //Desconto
    QRDBText20.Enabled := False; //val_unitario
    QRDBText21.Enabled := False; //Val_total do item
    QRLabel3.Enabled   := False; //Dt. Rec.
    QRDBText8.Enabled  := False; //Dt. Rec.

  end;
  wQtdGroup := 1;
end;

procedure TFRNotasCPR_Relacao.QRTotalFilialBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  wQtdGroup := 1;
end;

procedure TFRNotasCPR_Relacao.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  // Cesar 09/12/2019 coloquei para um solicitacao da Alice - relatorio para contabilidade
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARZ' Then
     wCusto := wCusto + DMContrato_CPR.QNotasContratoItensVal_Total.Value;

end;

procedure TFRNotasCPR_Relacao.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'PAULINHO' then
  begin
    QRDBText17.Font.Size := 8;
    QRDBText18.Font.Size := 8;
    QRDBText19.Font.Size := 8;
    QRDBText20.Font.Size := 8;
    QRDBText21.Font.Size := 8;
  end;
end;

end.
