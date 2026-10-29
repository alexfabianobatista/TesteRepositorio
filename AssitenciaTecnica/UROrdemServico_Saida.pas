unit UROrdemServico_Saida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Qrctrls, StdCtrls,QRExport, QRPDFFilt, QuickRpt;

type
  TFROrdemServico_Saida = class(TForm)
    QRPrimario: TQuickRep;
    QRBCabOS: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRMEquipamento: TQRMemo;
    QRLabel7: TQRLabel;
    QRMManutencao: TQRMemo;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBTotalOS: TQRBand;
    QRLabel10: TQRLabel;
    QRETotal: TQRExpr;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRLTotal: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QrProduto: TQRSubDetail;
    QRShape1: TQRShape;
    QRDBText10: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    lblVencimento1: TQRLabel;
    lblVencimento2: TQRLabel;
    lblVencimento3: TQRLabel;
    Label1: TQRLabel;
    Label2: TQRLabel;
    Label3: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText18: TQRDBText;
    procedure QRBCabOSBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBTotalOSBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QrProdutoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSDParcelasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServico_Saida: TFROrdemServico_Saida;

implementation

uses UOrdemServico_cl,UParamSistema_cl, UOracle_cl;

{$R *.DFM}

procedure TFROrdemServico_Saida.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var wEmail: TQREmail;
    wSmtpPort: String;
begin
  //configuração do envio de e-mail
  Buscador.Limpa;
  Buscador.Adiciona('DESC_EMAIL', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SENHA', 'TB_EMAIL');
  Buscador.Adiciona('DESC_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('NUM_PORTA_SMTP', 'TB_EMAIL');
  Buscador.Adiciona('IND_SSL', 'TB_EMAIL');

  Buscador.Buscar;

  wEmail.EmailAddress := Buscador.Proximo;
  wEmail.Password := Buscador.Proximo;
  wEmail.Smtp := Buscador.Proximo;
  wSmtpPort := Buscador.Proximo;
  if wSmtpPort <> '' then
    wEmail.SmtpPort := StrToInt(wSmtpPort);
  wEmail.SSL := (Buscador.Proximo = 'S');
  QRPrimario.Email := wEmail;
//fim da configuração do envio de e-mail
end;

procedure TFROrdemServico_Saida.QRBCabOSBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  With DMOrdemServico do
  Begin
    QRMEquipamento.Lines.Text := QREntradaDesc_Equipamento.Value ;
    QRMManutencao.Lines.Text := QREntradaDesc_Solicitacao.Text;
  end;
end;

procedure TFROrdemServico_Saida.QRBTotalOSBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var wTotal : Real;
begin
  DMOrdemServico.QRSaida_Receber.Close;
  DMOrdemServico.QRSaida_Receber.Open;
  if not DMOrdemServico.QrSaida_Receber.Eof then
  begin
    Label1.Caption := 'Pr - Vencimento -  Valor';
    lblVencimento1.Caption := FloatToStr(DmOrdemServico.QrSaida_ReceberNum_Parcela.Value) +'  -  ' + DateToStr(DmOrdemServico.QrSaida_ReceberDt_Vencimento.Value) +'  -  ' +  FormatFloat('###,###,##0.00',DmOrdemServico.QrSaida_ReceberVal_Titulo.Value);
    DmOrdemServico.QrSaida_Receber.Next;
    if not DMOrdemServico.QrSaida_Receber.Eof then
    begin
      Label2.Caption := 'Pr - Vencimento -  Valor';
      lblVencimento2.Caption := FloatToStr(DmOrdemServico.QrSaida_ReceberNum_Parcela.Value) +'  -  ' + DateToStr(DmOrdemServico.QrSaida_ReceberDt_Vencimento.Value) +'  -  ' +  FormatFloat('###,###,##0.00',DmOrdemServico.QrSaida_ReceberVal_Titulo.Value);
      DmOrdemServico.QrSaida_Receber.Next;
      if not DMOrdemServico.QrSaida_Receber.Eof then
      begin
          Label3.Caption := 'Pr - Vencimento -  Valor';
          lblVencimento3.Caption := FloatToStr(DmOrdemServico.QrSaida_ReceberNum_Parcela.Value) +'  -  ' + DateToStr(DmOrdemServico.QrSaida_ReceberDt_Vencimento.Value) +'  -  ' +  FormatFloat('###,###,##0.00',DmOrdemServico.QrSaida_ReceberVal_Titulo.Value);
          DmOrdemServico.QrSaida_Receber.Next;
      end
      else
      begin
          Label3.Caption := '';
          lblVencimento3.Caption := '';
      end;
    end
    else
    begin
      Label2.Caption := '';
      lblVencimento2.Caption := '';
      Label3.Caption := '';
      lblVencimento3.Caption := '';
    end;
  end
  else
  begin
    Label1.Caption := '';
    lblVencimento1.Caption := '';
    Label2.Caption := '';
    lblVencimento2.Caption := '';
    Label3.Caption := '';
    lblVencimento3.Caption := '';
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ' then
  Begin
    wTotal := QRETotal.Value.dblResult;
    DMOrdemServico.QREntradaVL_DESCONTO.Value := 0;
  end
  Else
    wTotal := QRETotal.Value.dblResult-DMOrdemServico.QREntradaVl_Desconto.Value;
  QRLTotal.Caption := FormatFloat('###,###,##0.00',wTotal);
  if DMOrdemServico.QrSaida_Receber.RecordCount = 0 then
     Label1.Caption := 'A Vista';
end;

procedure TFROrdemServico_Saida.QrProdutoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  If Trim(DMOrdemServico.QOrdemServicoITDesc_Complemento.Value) = '' Then
//    QrProduto.Height := 19
//  Else
//    QrProduto.Height := 40;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ' then
  begin
    DMOrdemServico.QOrdemServicoItvl_total.Value := (DMOrdemServico.QOrdemServicoItVl_unitario.Value *
    DMOrdemServico.QOrdemServicoItQT_PRODUTO.Value )  + (DMOrdemServico.QOrdemServicoItVAL_ACRESCIMO.Value); 
  end;
end;

procedure TFROrdemServico_Saida.QRSDParcelasBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := DMOrdemServico.QRSaida_ReceberNum_Parcela.Value > 0;
end;

procedure TFROrdemServico_Saida.FormCreate(Sender: TObject);
begin
  //
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PIZZATTO' then
  begin
    QRLabel5.Caption := 'Veterinário';
    QRLabel6.Caption := 'Animal';
    QRLabel7.Caption := 'Atendimento Realizado';
  end;
  //
end;

end.
