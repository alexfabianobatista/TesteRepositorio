unit UrOperacao_Contabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFrOperacao_Contabil = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLDescricao: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrOperacao_Contabil: TFrOperacao_Contabil;

implementation

uses UOperacao_cl;

{$R *.DFM}

procedure TFrOperacao_Contabil.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLDescricao.Caption := Trim(DMOperacao.QROperacao_ContabilDesc_Operacao.Value) + ' - ' + Trim(DMOperacao.QROperacao_ContabilDesc_Resumo.Value); 
end;

end.
