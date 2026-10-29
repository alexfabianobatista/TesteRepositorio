unit UROrdemServico_Entrada7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFROrdemServico_Entrada7 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRHRule2: TQRHRule;
    QRLAviso: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLsite: TQRLabel;
    QRHRule3: TQRHRule;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLSite1: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText19: TQRDBText;
    QRHRule4: TQRHRule;
    QRLabel17: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText27: TQRDBText;
    QRHRule5: TQRHRule;
    QRLabel24: TQRLabel;
    QRDBText28: TQRDBText;
    QRHRule6: TQRHRule;
    QRLabel25: TQRLabel;
    QRDBText29: TQRDBText;
    QRLAviso1: TQRLabel;
    QRHRule7: TQRHRule;
    QRDBText30: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Entrada7: TFROrdemServico_Entrada7;

implementation

uses UOrdemServico_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFROrdemServico_Entrada7.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QRLsite.Caption := 'Consulte sua ordem de serviço pelo site: www.cemapa.com';
  QRLsite1.Caption := 'Consulte sua ordem de serviço pelo site: www.cemapa.com';
  if (DMParamSistema.CodEmpresa = 'JOFER') then
  begin
    QRLsite.Visible := false;
    QRLSite1.Visible := false;
    QRLsite.Enabled := false;
    QRLsite1.Enabled := false;
  end;
end;

procedure TFROrdemServico_Entrada7.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLAviso.Caption := 'IMPORTANTE: Não nos responsabilizamos pelos dados contidos em seu computador.Certifique-se que tenha sido feita a cópia de segurança dos dados.'
                       +#13+
                       'OBSERVAÇÃO: Não aprovação deste serviço resulta na cobrança de R$ 30,00. Entrega do Equipamento somente com apresentação da Ordem de Serviço, após 90 dias o equipamento poderá ser descartado.'
                       +#13+
                       'Declaro que li e estou de acordo com os termos deste documento';
  QRLAviso1.Caption := 'IMPORTANTE: Não nos responsabilizamos pelos dados contidos em seu computador.Certifique-se que tenha sido feita a cópia de segurança dos dados.'
                       +#13+
                       'OBSERVAÇÃO: Não aprovação deste serviço resulta na cobrança de R$ 30,00. Entrega do Equipamento somente com apresentação da Ordem de Serviço, após 90 dias o equipamento poderá ser descartado.'
                       +#13+
                       'Declaro que li e estou de acordo com os termos deste documento';
  if (DMParamSistema.CodEmpresa = 'JOFER') then
  begin
    QRLAviso.Visible := false;
    QRLAviso1.Visible := false;
    QRLAviso.Enabled := false;
    QRLAviso1.Enabled := false;
    QRDBText27.Visible := false;
    QRDBText27.Enabled := false;

    QRLabel20.Caption := 'Mecanico..:';
    QRDBText34.Left := 535;
    QRDBText34.Top := 539;
  end;

  if (DMParamSistema.CodEmpresa = 'NIR') then
  begin
    QRDBText34.Enabled := false;
    QRDBText34.Visible := false;
    QRLabel22.Visible := false;
    QRLabel22.Enabled := false;
    QRDBText32.Visible := false;
    QRDBText32.Enabled := false;
  end;

end;

procedure TFROrdemServico_Entrada7.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'JOFER') then
  begin
    QRDBText33.Left := 535;
    QRDBText33.Top := 72;

    QRDBText3.Visible := false;
    QRDBText27.Visible := false;
    QRDBText3.Enabled := false;
    QRDBText27.Enabled := false;

    QRLabel6.Caption := 'Mecanico..:';
    QRLabel9.Caption := 'Placa...: ';
    QRLabel23.Caption := 'Placa...: ';
  end;

  if (DMParamSistema.CodEmpresa = 'NIR') then
  begin
    QRDBText33.Visible := false;
    QRDBText33.Enabled := false;
    QRLabel14.Enabled := false;
    QRLabel14.Visible := false;
    QRDBText31.Enabled := false;
    QRDBText31.Visible := false;
  end;

end;

end.
