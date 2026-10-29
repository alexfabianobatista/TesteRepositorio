unit URResumoPlanoContasComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRResumoPlanoContasComp = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr1: TQRExpr;
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
  FRResumoPlanoContasComp: TFRResumoPlanoContasComp;

implementation

uses UCaixaRel_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFRResumoPlanoContasComp.QRPrimarioBeforePrint(
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
