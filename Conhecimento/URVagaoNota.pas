unit URVagaoNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRVagaoNota = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRExpr4: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLData_I: TQRLabel;
    QRLData_F: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel17: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRBandFluxoFooter: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel21: TQRLabel;
    QRSUMQtdeVagao: TQRLabel;
    QRSUMQtdePesoChegada: TQRLabel;
    QRSUMQtdeDiferenca: TQRLabel;
    QRSUMQtdeVagaoGeral: TQRLabel;
    QRSUMQtdePesoChegadaGeral: TQRLabel;
    QRSUMQtdeDiferencaGeral: TQRLabel;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandFluxoFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandFluxoFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVagaoNota: TFRVagaoNota;
  //Variáveis de Controle criadas para Substituirem o QrExpr na operação SUM dos dados referentes aos Vagões.
  //Substituição necessária devido a calculos errados do QrExpr na presença de details dentro de um Group
  //- Camila 08/10/2007
  wSUMQuantidadeVagao: Double            = 0;
  wSUMQuantidadePesoChegada: Double      = 0;
  wSUMQuantidadeDiferenca: Double        = 0;
  wSUMQuantidadeVagaoGeral: Double       = 0;
  wSUMQuantidadePesoChegadaGeral: Double = 0;
  wSUMQuantidadeDiferencaGeral:   Double = 0;

implementation

uses UControleTrem_cl;

{$R *.dfm}

procedure TFRVagaoNota.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  wSUMQuantidadeVagao       := (wSUMQuantidadeVagao + DMControleTrem.QRVagaoNotaQT_QUANTIDADE.Value);
  wSUMQuantidadePesoChegada := (wSUMQuantidadePesoChegada + DMControleTrem.QRVagaoNotaQT_PESO_CHEGADA_VAGAO.Value);
  wSUMQuantidadeDiferenca   := (wSUMQuantidadeDiferenca + DMControleTrem.QRVagaoNotadiferencapesovagao.Value);
end;

procedure TFRVagaoNota.QRBandFluxoFooterAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wSUMQuantidadeVagaoGeral       := (wSUMQuantidadeVagaoGeral       + wSUMQuantidadeVagao);
  wSUMQuantidadePesoChegadaGeral := (wSUMQuantidadePesoChegadaGeral + wSUMQuantidadePesoChegada);
  wSUMQuantidadeDiferencaGeral   := (wSUMQuantidadeDiferencaGeral   + wSUMQuantidadeDiferenca);
  wSUMQuantidadeVagao       := 0;
  wSUMQuantidadePesoChegada := 0;
  wSUMQuantidadeDiferenca   := 0;
end;

procedure TFRVagaoNota.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  wSUMQuantidadeVagaoGeral       := 0;
  wSUMQuantidadePesoChegadaGeral := 0;
  wSUMQuantidadeDiferencaGeral   := 0;
end;

procedure TFRVagaoNota.QRBandFluxoFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRSUMQtdeVagao.Caption       := FormatFloat('##0.00', wSUMQuantidadeVagao);
  QRSUMQtdePesoChegada.Caption := FormatFloat('##0.00', wSUMQuantidadePesoChegada);
  QRSUMQtdeDiferenca.Caption   := FormatFloat('##0.00', wSUMQuantidadeDiferenca);
end;

procedure TFRVagaoNota.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRSUMQtdeVagaoGeral.Caption       := FormatFloat('##0.00', wSUMQuantidadeVagaoGeral);
  QRSUMQtdePesoChegadaGeral.Caption := FormatFloat('##0.00', wSUMQuantidadePesoChegadaGeral);
  QRSUMQtdeDiferencaGeral.Caption   := FormatFloat('##0.00', wSUMQuantidadeDiferencaGeral);
end;

end.
