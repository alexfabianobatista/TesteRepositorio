unit URNota_Secretaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRNota_Secretaria = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLFilial: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLMunicipio: TQRLabel;
    QRLabel11: TQRLabel;
    QRLAno: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel18: TQRLabel;
    QRLResponsavel: TQRLabel;
    QRBand4: TQRBand;
    QRLabel19: TQRLabel;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLUnidade: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRNota_Secretaria: TFRNota_Secretaria;

implementation

uses URelatorioVenda_cl, URNota_Secretaria2;

{$R *.DFM}

procedure TFRNota_Secretaria.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  If (DMRelatorio_Venda.QRSecretariaDesc_Unidade.Value = 'LT') or
     (DMRelatorio_Venda.QRSecretariaDesc_Unidade.Value = 'GL') or
     (DMRelatorio_Venda.QRSecretariaDesc_Unidade.Value = 'BD') or
     (DMRelatorio_Venda.QRSecretariaDesc_Unidade.Value = 'T') Then
    QRLUnidade.Caption := 'LT'
  Else
    If (DMRelatorio_Venda.QRSecretariaDesc_Unidade.Value = 'FRC') Then
       QRLUnidade.Caption := 'FR'
    Else
       QRLUnidade.Caption := 'KG';
end;

end.
