unit UFRRateioCustos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRRateioCustos = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup3: TQRGroup;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRateioCustos: TFRRateioCustos;

implementation

uses UDMCustos, UOracle_cl;

{$R *.DFM}

procedure TFRRateioCustos.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel3.Caption := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                   'COD_FILIAL = '+DMCustos.QRRateioCustoCOD_FILIAL_DEST.Text);
  QRLabel10.Caption:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO',
             'COD_DEPARTAMENTO = '+DMCustos.QRRateioCustoCOD_DPTO_DEST.Text);
end;

end.
