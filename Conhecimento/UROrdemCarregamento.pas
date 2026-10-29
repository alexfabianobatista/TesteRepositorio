unit UROrdemCarregamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFROrdemCarregamento = class(TFTRelSimples)
    QRBDetail: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLEndEmpresa: TQRLabel;
    QRLCidadeEmpresa: TQRLabel;
    QRGroup1: TQRGroup;
    QRLBOrigem: TQRLabel;
    QRLBDestino: TQRLabel;
    QRLBDMotorista: TQRLabel;
    QRLBPlaca: TQRLabel;
    QRLDescOrigem: TQRLabel;
    QRLEndOrigem: TQRLabel;
    QRLCidadeOrigem: TQRLabel;
    QRLDescDestino: TQRLabel;
    QRLEndDestino: TQRLabel;
    QRLCidadeDestino: TQRLabel;
    QRLabel3: TQRLabel;
    QRLBData: TQRLabel;
    QRLBDe: TQRLabel;
    QRLBPara: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLCodigo: TQRLabel;
    QRDBText11: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLBPedido: TQRLabel;
    QRLBProduto: TQRLabel;
    QRLBSacas: TQRLabel;
    QRLBTonelada: TQRLabel;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLEmpresa1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRBFTotal: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QrMensagem: TQRMemo;
    QRLabel7: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemCarregamento: TFROrdemCarregamento;

implementation

uses UOrdemCarregamento_cl;

{$R *.DFM}

procedure TFROrdemCarregamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FROrdemCarregamento := nil;
  inherited;
end;

procedure TFROrdemCarregamento.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMOrdemCarregamento do
  Begin
    QRLDescOrigem.Caption := QROrdemCarregamentoNOME_ORIGEM.Text;
    QRLEndOrigem.Caption := QROrdemCarregamentoENDERECO_ORIGEM.Text + ' - ' + QROrdemCarregamentoBAIRRO_ORIGEM.Text;
    QRLCidadeOrigem.Caption := QROrdemCarregamentoCIDADE_ORIGEM.Text + ' - ' + QROrdemCarregamentoESTADO_ORIGEM.Text;

    QRLDescDestino.Caption := QROrdemCarregamentoNOME_DESTINO.Text;
    QRLEndDestino.Caption := QROrdemCarregamentoENDERECO_DESTINO.Text + ' - ' + QROrdemCarregamentoBAIRRO_DESTINO.Text;
    QRLCidadeDestino.Caption := QROrdemCarregamentoCIDADE_DESTINO.Text + ' - ' + QROrdemCarregamentoESTADO_DESTINO.Text;
  End;
end;

procedure TFROrdemCarregamento.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrMensagem.Lines.text := '     '+Trim(DMOrdemCarregamento.QROrdemCarregamentoDesc_Mensagem.Text)+' '+Trim(DMOrdemCarregamento.QROrdemCarregamentoDesc_Obs_Compl.Text)+
                        Trim(DMOrdemCarregamento.QROrdemCarregamentoDesc_Obs_Compl1.Text)+' '+Trim(DMOrdemCarregamento.QROrdemCarregamentoDesc_Obs_Compl2.Text)+' '+
                        Trim(DMOrdemCarregamento.QROrdemCarregamentoDesc_Obs_Compl3.Text);
end;

end.
