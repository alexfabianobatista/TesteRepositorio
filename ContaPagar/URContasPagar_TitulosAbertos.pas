unit URContasPagar_TitulosAbertos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt,
  StdCtrls;

type
  TFRContasPagar_TitulosAberto = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel12: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRLPeriodo: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRLFinalidade: TQRLabel;
    QRGroup3: TQRGroup;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand7: TQRBand;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    QRGroup4: TQRGroup;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRDBText7: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText16: TQRDBText;
    QRLCidade4: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel22: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRContasPagar_TitulosAberto: TFRContasPagar_TitulosAberto;

implementation

uses UContasPagar_cl,UParamSistema_cl;

{$R *.DFM}

procedure TFRContasPagar_TitulosAberto.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  wDist : Integer;
begin
  inherited;
  if (DmParamSistema.QParamsistemaCod_Empresa.Value = 'KREUZ') or
  (DmParamSistema.QParamsistemaCod_Empresa.Value = 'CONKRETA') then
  begin
    QRLabel19.Enabled := false;
    QRDBText15.Enabled := false;

    wDist := 10;

    QRLabel5.Left := QRLabel5.Left + wDist;
    QRDBText3.Left := QRDBText3.Left + wDist;

    QRLabel21.Left := QRLabel21.Left + wDist*2;
    QRDBText7.Left := QRDBText7.Left + wDist*2;

    QRLabel6.Left := QRLabel6.Left + wDist*3;
    QRDBText5.Left := QRDBText5.Left + wDist*3;

    QRLabel7.Left := QRLabel7.Left + wDist*4;
    QRDBText6.Left := QRDBText6.Left + wDist*4;
    QRLabel22.Left := QRLabel22.Left + wDist*4;
    QRDBText17.Left := QRDBText17.Left + wDist*4;

    QRLabel9.Left := QRLabel9.Left + wDist*5;
    QRDBText8.Left := QRDBText8.Left + wDist*5;

    QRLabel14.Left := QRLabel14.Left + wDist*6;
    QRDBText9.Left := QRDBText9.Left + wDist*6;

    QRLabel20.Left := QRLabel20.Left - wDist*2;
    QRExpr10.Left := QRExpr10.Left - wDist*2;

    QRLabel8.Left := QRLabel8.Left - wDist;
    QRExpr5.Left := QRExpr5.Left - wDist;
  end
end;

end.
