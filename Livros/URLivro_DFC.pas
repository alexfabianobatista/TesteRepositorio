unit URLivro_DFC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRLivro_DFC = class(TFTRelSimples)
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRGroup2: TQRGroup;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRBand6: TQRBand;
    QRLabel13: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLFilial: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRLTipo: TQRLabel;
    QRGroup3: TQRGroup;
    qrlFisiscaJuridica: TQRLabel;
    QRBand7: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLivro_DFC: TFRLivro_DFC;

implementation

uses ULivroFiscal_Cl;

{$R *.DFM}

procedure TFRLivro_DFC.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QRLivro_DFCIND_ENTRADA_SAIDA.Value = 'E' Then
   Begin
     QRLTipo.Caption := 'E N T R A D A S';
   End
  Else
   Begin
     QRLTipo.Caption := 'S A Í D A S';
   End;
end;

procedure TFRLivro_DFC.QRGroup3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If DMLivroFiscal.QRLivro_DFCIND_FISICA_JURIDICA.Value = 'F' Then
    qrlFisiscaJuridica.Caption := 'Física'
  Else
    qrlFisiscaJuridica.Caption := 'Jurídica';
end;

end.
