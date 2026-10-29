unit URLivroGiIcms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRLivroGiIcms = class(TFTRelSimples)
    QRLPeriodo: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRBand4: TQRBand;
    QRLEntradaSaida: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRDBText2: TQRDBText;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLivroGiIcms: TFRLivroGiIcms;

implementation

uses ULivroFiscal_Cl;

{$R *.dfm}

procedure TFRLivroGiIcms.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QrGiCmsInd_Entrada_Saida.Value = 'E' Then
     QRLEntradaSaida.Caption := 'Entrada de Bens, Mercadorias e/ou Aquisições de Serviços'
  Else
     QRLEntradaSaida.Caption := 'Saída de Mercadorias e/ou Prestações de Serviços';

end;

end.
