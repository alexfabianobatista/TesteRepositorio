unit UROrcamentoOsSemDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFROrcamentoOsSemDesconto = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand4: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBDesc_Complemento: TQRDBText;
    QRBand5: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr8: TQRExpr;
    QRHRule1: TQRHRule;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel27: TQRLabel;
    QRLValidadeOrcamento: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBEquipamento: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBServico: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLDocPendentes: TQRLabel;
    QRMDocPendente: TQRMemo;
    QRILogo: TQRImage;
    QRLLogo: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText23: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrcamentoOsSemDesconto: TFROrcamentoOsSemDesconto;

implementation

uses UOrdemServico_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFROrcamentoOsSemDesconto.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  with DMOrdemServico do
  begin
    if (QrOrcamentoOsSemDescDESC_COMPLEMENTO.Value <> '') then
      QRBand4.Height := 36
    else
      QRBand4.Height := 17;
  end;
end;

end.
