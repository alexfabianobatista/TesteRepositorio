unit UROrdemServico_Aberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFROrdemServico_Aberto = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRMManutencao: TQRMemo;
    QRMEquipamento: TQRMemo;
    QRDBIndSituacoOS: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Aberto: TFROrdemServico_Aberto;

implementation

uses UOrdemServico_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFROrdemServico_Aberto.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMOrdemServico do
  Begin
    QRMEquipamento.Lines.Text := QRAbertoDesc_Equipamento.Value ;
    QRMManutencao.Lines.Text := QRAbertoDesc_Solicitacao.Text;
  end;

end;

procedure TFROrdemServico_Aberto.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'GEOPRO') or (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
    QRDBIndSituacoOS.Enabled := True;
end;

end.
