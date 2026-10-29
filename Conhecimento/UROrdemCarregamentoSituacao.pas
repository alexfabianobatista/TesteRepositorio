unit UROrdemCarregamentoSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROrdemCarregamentoSituacao = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText15: TQRDBText;
    QRBand3: TQRBand;
    QRLbPeriodo: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel18: TQRLabel;
    QRLContOC: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRGroup2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    wContOC : Integer;
  public
    { Public declarations }
  end;

var
  FROrdemCarregamentoSituacao: TFROrdemCarregamentoSituacao;

implementation

uses UOrdemCarregamento_cl;

{$R *.DFM}

procedure TFROrdemCarregamentoSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FROrdemCarregamentoSituacao := nil;
end;

procedure TFROrdemCarregamentoSituacao.QRGroup2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  wContOC := wContOC + 1; 
end;

procedure TFROrdemCarregamentoSituacao.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLContOC.Caption := IntToStr(wContOC);
  wContOC := 0;
end;

end.
