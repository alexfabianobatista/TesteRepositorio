unit URControleLancamentoCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRControleLancamentoCartao = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLDtRecebimento: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel13: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel14: TQRLabel;
    QRBand5: TQRBand;
    QRLabel15: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand6: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand7: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLBanco: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText13: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRControleLancamentoCartao: TFRControleLancamentoCartao;

implementation

uses UBancoAgenciaRel_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFRControleLancamentoCartao.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'PIXIXE_FAB') then
    QRLabel3.Caption := 'Num. Nota';
end;

end.
