unit URPromissorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFRPromissorias = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrlDataEmissao: TQRLabel;
    QRLabel17: TQRLabel;
    qrlNumero: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRMDeclaracao: TQRMemo;
    qrlCidade: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPromissorias: TFRPromissorias;

implementation

uses UContasReceber_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFRPromissorias.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlNumero.Caption := DMContasReceber.QRContasReceber_DuplicatasNum_nota.Text+'/'
    +DMContasReceber.QRContasReceber_DuplicatasNum_Parcela.Text + ' - '
      + DMContasReceber.QRContasReceber_Duplicatasnum_total_parcelas.Text;
  QRMDeclaracao.Lines.Clear;
  QRMDeclaracao.Lines.Add('No dia ' + DMContasReceber.QRContasReceber_DuplicatasDt_Vencimento.Text
    +' pagarei por esta única via de nota promissória a '
      + DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value + ' CNPJ '
        + DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Filial.Value+ ' ou a sua ordem a quantia de '
          + copy(DMContasReceber.QRContasReceber_DuplicatasExtenso.Value, 1, length(DMContasReceber.QRContasReceber_DuplicatasExtenso.Value) - 1)
            + ' em moeda corrente deste país');
  qrlCidade.Caption := DMContasReceber.QRContasReceber_DuplicatasDesc_Cidade.Value
    + ' UF:' + DMContasReceber.QRContasReceber_DuplicatasCod_Estado.Value;
  qrlDataEmissao.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy',DMContasReceber.QRContasReceber_DuplicatasDt_Emissao.Value);
end;

procedure TFRPromissorias.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'FERRAGENS' then
    DetailBand1.ForceNewPage := True;
end;

end.
