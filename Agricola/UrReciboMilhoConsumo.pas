unit UrReciboMilhoConsumo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TFrReciboMilhoConsumo = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRLNumero: TQRLabel;
    QRLabel25: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel26: TQRLabel;
    QRLProduto: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText3: TQRDBText;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCodCadastro:real;
    vCodFilial:Real;
    property pCodCadastro : real read vCodCadastro write vCodCadastro;
    property pCodFilial  : real read vCodFilial write vCodFilial;

  end;

var
  FrReciboMilhoConsumo: TFrReciboMilhoConsumo;

implementation

uses UCadastro_cl, UFilial_cl;

{$R *.DFM}

procedure TFrReciboMilhoConsumo.FormActivate(Sender: TObject);
begin
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',pCodCadastro);
  DMCadastro.QCadastro.Open;
  DMFilial.QFilial.Close;
  DMFilial.Qfilial.SetVariable('PK',pCodFilial);
  DMFilial.QFilial.Open;

end;

end.
