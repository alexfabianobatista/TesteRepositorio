unit URLimiteCadastro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls, QRWebFilt, QRPDFFilt;

type
  TFRLimiteCadastro = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText6: TQRDBText;
    QRLFilial: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLimiteCadastro: TFRLimiteCadastro;

implementation

uses UCadastro_Rel_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRLimiteCadastro.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  If DMParamSistema.QParamSIstemaCOD_EMPRESA.Value = 'MOINHO' then
  Begin

    QRLabel7.Enabled := False;
    QRLabel4.Enabled := True;
    QRLabel4.Left := 277;
    QRLabel5.Left := 352;
    QRLabel6.Left := 435;
    QRDBText5.Enabled := False;
    QRDBText7.Enabled := True;
    QRDBText7.Left := 259;
    QRDBText3.Left := 347;
    QRDBText4.Left := 427;
    QRExpr1.Expression := 'QRLimiteCadastro.VAL_CR_ABERTO + QRLimiteCadastro.VAL_PEDIDOS';
    QRExpr2.Expression := 'QRLimiteCadastro.Val_Limite - QRLimiteCadastro.VAL_CR_ABERTO - QRLimiteCadastro.VAL_PEDIDOS';
  end;
end;

end.
