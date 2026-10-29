unit UrResumoPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QuickRpt, QRExport, QRWebFilt, QRPDFFilt, QRCtrls,
  ExtCtrls;

type
  TFrResumoPlanoContas = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRWMFFilter1: TQRWMFFilter;
    QRWMFFilter2: TQRWMFFilter;
    QRBand6: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr3: TQRExpr;
    QRLFilial: TQRLabel;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrResumoPlanoContas: TFrResumoPlanoContas;

implementation

uses UCaixaRel_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFrResumoPlanoContas.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if  DMParamSistema.CodEmpresa = 'SCALA' then
  begin
    QRBand5.Enabled := false;
    QRBand5.Visible := False;
  end;

end;

end.
