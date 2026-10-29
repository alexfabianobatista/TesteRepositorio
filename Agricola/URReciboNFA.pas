unit URReciboNFA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFRReciboNFA = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel8: TQRLabel;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLValor: TQRLabel;
    QRDBText9: TQRDBText;
    QRLNRRECIBO: TQRLabel;
    QRLDt_Recibo: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel9: TQRLabel;
    QRLComplemento: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLUsuario: TQRLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    vCodCadastro:real;
    vCodFilial:Real;
    property pCodCadastro :real read vCodCadastro write vCodCadastro;
    property pCodFilial  :real read vCodFilial write vCodFilial;
    { Public declarations }
  end;

var
  FRReciboNFA: TFRReciboNFA;

implementation

uses UFilial_cl, UCadastro_cl;

{$R *.DFM}

procedure TFRReciboNFA.FormActivate(Sender: TObject);
begin
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',pCodCadastro);
  DMCadastro.QCadastro.Open;
  DMFilial.QFilial.Close;
  DMFilial.Qfilial.SetVariable('PK',pCodFilial);
  DMFilial.QFilial.Open;
end;

end.
