unit URPedidoAssistenciaTecnica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, grimgctrl, QRPDFFilt;

type
  TFRPedidoAssistenciaTecnica = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLVia: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRDBText3: TQRDBText;
    QRLEnderecoFilial: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLCidadeFilial: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRBand4: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText22: TQRDBText;
    QRMObservacao: TQRMemo;
    QRExprTotal: TQRExpr;
    QRLabel1: TQRLabel;
    QRM1: TQRMemo;
    QRM2: TQRMemo;
    QRM3: TQRMemo;
    QRLabel20: TQRLabel;
    QRLEntrada: TQRLabel;
    QRM4: TQRMemo;
    QRM5: TQRMemo;
    QRPDFFilter1: TQRPDFFilter;
    ChildBand1: TQRChildBand;
    QRHRule1: TQRHRule;
    QRDBText23: TQRDBText;
    QRLPagamento: TQRLabel;
    QRDBText24: TQRDBText;
    QRExpr1: TQRExpr;
    QRLPlaca: TQRLabel;
    QRDBPlaca: TQRDBText;
    QRDBComplemento_prod: TQRDBText;
    QRDBText21: TQRDBText;
    QRLCpfCnpj: TQRLabel;
    QRDBCpfCnpj: TQRDBText;
    QRLFoneEmpresa: TQRLabel;
    QRDBFoneEmpresa: TQRDBText;
    QRLVales: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel21: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel25: TQRLabel;
    QRLDescPagto: TQRLabel;
    QRDBText28: TQRDBText;
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPedidoAssistenciaTecnica: TFRPedidoAssistenciaTecnica;
  numVia :Integer = 0;
  wLinhasPedido : integer = 1;

implementation

uses UNotaSaida_cl, UParamSistema_cl, UOracle_cl;

{$R *.dfm}

procedure TFRPedidoAssistenciaTecnica.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(QuickRep1);
  if (DMParamSistema.CodEmpresa <> 'QUERENCIA') and (DMParamSistema.CodEmpresa <> 'FERRAGENS') and
     (DMParamSistema.CodEmpresa <> 'AGROCAMPO') and (DMParamSistema.CodEmpresa <> 'SONOBOM')   and
     (DMParamSistema.CodEmpresa <> 'REFRISM')   and (DMParamSistema.CodEmpresa <> 'PAPELARIA')    and
     (DMParamSistema.CodEmpresa <> 'NUTRIR')    and (DMParamSistema.CodEmpresa <> 'COMIN')     and
     (DMParamSistema.CodEmpresa <> 'PERTUTTI')  and (DMParamSistema.CodEmpresa <> 'FRACTA')    and
     (DMParamSistema.CodEmpresa <> 'OLIVEIRA')  and (DMParamSistema.CodEmpresa <> 'SCALA') then //Agroferragens precisa somente de 1 via. Junior 21/11/2019
    QRCompositeReport1.Reports.Add(QuickRep1);
end;

procedure TFRPedidoAssistenciaTecnica.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  with DMNotaSaida do
  begin
    if (QRPedidoEspelho.RecordCount + QContaReceber.RecordCount) <= 12 then
    begin
      Inc(numVia);
      if (DMParamSistema.CodEmpresa = 'QUERENCIA') or (DMParamSistema.CodEmpresa = 'FERRAGENS') or
         (DMParamSistema.CodEmpresa = 'AGROCAMPO') or (DMParamSistema.CodEmpresa = 'REFRISM')   or
         (DMParamSistema.CodEmpresa = 'PAPELARIA')    or (DMParamSistema.CodEmpresa = 'FRACTA')    and
         (DMParamSistema.CodEmpresa <> 'SONOBOM')  or  (DMParamSistema.CodEmpresa = 'NUTRIR')   or
         (DMParamSistema.CodEmpresa = 'OLIVEIRA') or (DMParamSistema.CodEmpresa = 'SCALA') then
        QRLVia.Caption := '1ª Via'
      else
        QRLVia.Caption := IntToStr(numVia) + 'ª Via';
      if numVia = 2 then
        numVia := 0;
    end;
    QRLEnderecoFilial.Caption :=
      QRPedidoEspelhoEND_FILIAL.Value;
    if QRPedidoEspelhoNUM_ENDERECO_FILIAL.Text <> '' then
      QRLEnderecoFilial.Caption := QRLEnderecoFilial.Caption +
        ', ' +
        QRPedidoEspelhoNUM_ENDERECO_FILIAL.Text +
        ', ' +
        QRPedidoEspelhoBairro_Filial.Text;
    QRLCidadeFilial.Caption :=
      QRPedidoEspelhoCIDADE_FILIAL.Value +
      ' - ' +
      QRPedidoEspelhoUF_FILIAL.Value;
    case StrToInt(QRPedidoEspelhoIND_CONDICAO_PAGTO.Value) of
      1: begin
        QRLPagamento.Caption := 'PAGAMENTO A VISTA';
      end;
      2: begin
        if (DMParamSistema.CodEmpresa = 'FERRAGENS') and (QNFE_EmiteCOD_CADASTRO.Value = 4387) then // 07/05/2020 - SOLICITADO PARA NÃO LISTAR A PRAZO PARA ESTE COD_CADASTRO  - TAMBÉM ALTERADO O RELATORIO
          QRLPagamento.Caption := 'PAGAMENTO A VISTA'
        else
          QRLPagamento.Caption := 'PAGAMENTO A PRAZO';
      end;
      3: begin
        QRLPagamento.Caption := 'PAGAMENTO OUTROS';
      end;
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'GEOPRO') then
  begin
    QRLabel12.Caption := 'Técnico:';
//    QRDBText21.Enabled  := False;
    QRLVales.Enabled    := False;
    QRDBText25.Enabled  := False;
    QRLabel1.Enabled    := False;
    QRExprTotal.Enabled := False;
  end;
  if (DMParamSistema.CodEmpresa = 'ALVARES') or (DMParamSistema.CodEmpresa = 'TSAOMIGUEL') or
     (DMParamSistema.CodEmpresa = 'REFRISM') then
  begin
    QRLVales.Enabled    := False;
    QRDBText25.Enabled  := False;
    QRLabel1.Enabled    := False;
    QRExprTotal.Enabled := False;
  end;
  if DMParamSistema.CodEmpresa = 'CASATINTAS' then
  begin
    QRLCpfCnpj.Enabled := False;
    QRDBCpfCnpj.Enabled := False;
  end;
end;

procedure TFRPedidoAssistenciaTecnica.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLDescPagto.Enabled := false;
  QRLDescPagto.Visible := false;
  if QRHRule1.Enabled then
    QRHRule1.Enabled := (numVia = 1);

  if (DMParamSistema.CodEmpresa = 'POLLYANA') then
  begin
    QRLDescPagto.Enabled := true;
    QRLDescPagto.Visible := true;
//    QRDBText22.Mask := '#,###0.000';
  end;
end;

procedure TFRPedidoAssistenciaTecnica.ChildBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  //Controla o tamanho da banda ChildBand1 para dar um espaço em branco
  //na página para os recibos ficarem com a linha de corte no centro
  //da página.
  with DMNotaSaida do
  begin
    if (QRPedidoEspelho.RecordCount <= 10) and (numVia = 1) then
    begin
      ChildBand1.Height := 200 - (QRPedidoEspelho.RecordCount * 18); //estava 180. MEDIPECAS as folhas já são picotadas,
      QRHRule1.Top := ChildBand1.Height - 15;                        // e estava imprimindo para cima do picote a segunda via. Junior 14/10/2016
    end
    else
      ChildBand1.Height := 0;
  end;
end;

procedure TFRPedidoAssistenciaTecnica.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (DMParamSistema.CodEmpresa = 'QUERENCIA') and (DMParamSistema.CodEmpresa = 'FERRAGENS') and
     (DMParamSistema.CodEmpresa = 'AGROCAMPO') and (DMParamSistema.CodEmpresa = 'SONOBOM')   and
     (DMParamSistema.CodEmpresa = 'REFRISM')   and (DMParamSistema.CodEmpresa = 'PAPELARIA')    and
     (DMParamSistema.CodEmpresa = 'NUTRIR')    and (DMParamSistema.CodEmpresa = 'FRACTA')    and
     (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
  begin
    if wLinhasPedido > 14 then
      QRBand3.ForceNewPage := True;
     inc(wLinhasPedido);
    if DMNotaSaida.QRPedidoEspelho.RecordCount = DMNotaSaida.QRPedidoEspelho.RecNo then
      wLinhasPedido := 1;
  end;

  if (DMParamSistema.CodEmpresa = 'MEDIPECAS') then
  begin
    if DMNotaSaida.QRPedidoEspelhoDESC_COMPLEMENTO_PROD.Value <> '' then
      QRBand3.Height := 41
    else
      QRBand3.Height := 20;
  end;

  if (DMParamSistema.CodEmpresa = 'USIMED') then
  begin
    QRDBText5.Height := 307;
    QRDBText5.AutoSize := True;
    QRDBText26.Enabled := False;
    QRDBText26.Visible := False;
    QRDBText20.Enabled := false;
    QRDBText20.Visible := false;

    if DMNotaSaida.QRPedidoEspelhoDESC_INF_ADICIONAL.Value <> '' then
      QRBand3.Height := 30 //32
    else
      QRBand3.Height := 15; //17
  end;
  if (DMParamSistema.CodEmpresa = 'CASATINTAS') then
  begin
    QRDBText2.Left := 17;
    QRDBText23.Left := 35;
    QRDBText23.Width := 35;
    QRDBText5.Left := 70;
    QRDBText5.Width := 200;
    QRDBText19.Left := 275;
    QRDBText19.Width := 230;
  end;
  if (DMParamSistema.CodEmpresa = 'TSAOMIGUEL') then
  begin
    if DMNotaSaida.QRPedidoEspelhoDESC_INF_ADICIONAL.Value <> '' then
    begin
      QRBand3.Height := 38;//30
      QRDBComplemento_prod.Height := 24;
    end
    else
    begin
      QRBand3.Height := 15; //17
      QRDBComplemento_prod.Height := 13;
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'REGINATO') then
  begin
    QRDBText19.AutoStretch := True;
    QRDBComplemento_prod.Enabled := False;
  end;
  if (DMParamSistema.CodEmpresa = 'FERRAGENS') or (DMParamSistema.CodEmpresa = 'AGROCAMPO') or
     (DMParamSistema.CodEmpresa = 'GEOPRO') or (DMParamSistema.CodEmpresa = 'ALVARES') or
     (DMParamSistema.CodEmpresa = 'TSAOMIGUEL') or (DMParamSistema.CodEmpresa = 'REFRISM') or
     (DMParamSistema.CodEmpresa = 'NUTRIR') then //Solicitado por Gustavo. Junior 21/07/2020
  begin
    QRLabel16.Enabled  := False;
    QRDBText19.Enabled := False;
    QRDBText5.Width    := 370;
  end;
//Adicionado para a sono bom para que apareça a descrição completa do produto. Alex 10/05/2022
  if (DMParamSistema.CodEmpresa = 'SONOBOM')   or (DMParamSistema.CodEmpresa = 'PAPELARIA') or
     (DMParamSistema.CodEmpresa = 'QUERENCIA') or (DMParamSistema.CodEmpresa = 'FRACTA') or
     (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
  begin
    QRDBText5.Width := 330;
    QRDBText19.Enabled := false;
  end;

  if (DMParamSistema.CodEmpresa = 'REFRISM') then
  begin
    QRDBText2.Enabled := false;
    QRDBText2.Visible := false;
    QRDBText27.Enabled := false;
    QRDBText27.Visible := false;
    QRDBText23.Left := 45;
  end;

  if (DMParamSistema.CodEmpresa = 'POLLYANA') then
  begin
    QRDBText19.Left := 452;
    QRDBText19.Width := 111;
    QRDBText22.Left := 540;
    QRDBText5.Width := 300;
    QRDBText22.Mask := '#,###0.000';
  end;
  if (DMParamSistema.CodEmpresa <> 'USIMED') then
  begin
     QRLabel25.Visible := false;
     QRDBText27.Enabled := False;
     QRDBText27.Visible := false;
  end;
  if (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
  begin
    QRDBText27.Enabled := False;
    QRDBText27.Visible := False;
    QRDBText23.Enabled := False;
    QRDBText23.Visible := False;
    QRDBText5.Left := 85;
    QRDBText5.Width := 400;
  end;
end;

procedure TFRPedidoAssistenciaTecnica.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if (DMParamSistema.CodEmpresa = 'QUERENCIA') or (DMParamSistema.CodEmpresa = 'FERRAGENS') or
     (DMParamSistema.CodEmpresa = 'AGROCAMPO') or (DMParamSistema.CodEmpresa = 'SONOBOM')   or
     (DMParamSistema.CodEmpresa = 'PAPELARIA')    or (DMParamSistema.CodEmpresa = 'NUTRIR')    or
     (DMParamSistema.CodEmpresa = 'FRACTA')    or (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
  begin
    if (QRBand3.ForceNewPage = True) and (wLinhasPedido > 14) then
    begin
      QRBand3.ForceNewPage := False;
      wLinhasPedido := 1;
    end;
  end;
end;

procedure TFRPedidoAssistenciaTecnica.QRBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

  if DMParamSistema.CodEmpresa = 'GEOPRO' then
  begin
    QRLabel16.Enabled := False;
  end;

  if (DMParamSistema.CodEmpresa = 'USIMED') then
  begin
    QRLabel16.Visible := false;
    QRDBText19.Visible := false;
    QRLabel16.Enabled := false;
    QRDBText19.Enabled := false;
    QRDBText5.Left := 200;
    QRDBText1.Left := 0;
    QRDBText27.AutoSize := false;
    QRDBText27.Width := 30;
    QRDBText27.left := 160;
    QRDBText23.Width := 90;
    QRLabel24.Visible := false;
    QRLabel24.Enabled := false;
    QRLabel18.Enabled := false;
    QRLabel18.Visible := false;
  end;

  if (DMParamSistema.CodEmpresa = 'FERRAGENS') then
  begin
    QRLabel24.Enabled := True;
    QRDBText26.Enabled := True;
  end;
//Adicionado para a sono bom para que apareça a descrição completa do produto. Alex 10/05/2022
  if (DMParamSistema.CodEmpresa = 'SONOBOM')   or (DMParamSistema.CodEmpresa = 'PAPELARIA') or
     (DMParamSistema.CodEmpresa = 'QUERENCIA') or (DMParamSistema.CodEmpresa = 'FRACTA') or
     (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
  begin
    QRLabel16.Enabled := false;
  end;

  if (DMParamSistema.CodEmpresa = 'REFRISM') then
  begin
    QRLabel14.caption := 'Num. Fab.';
    QRLabel14.Left := 45;
    QRLabel25.Visible := false;
    QRLabel25.Enabled := false;
  end;

  if (DMParamSistema.CodEmpresa = 'POLLYANA') then
  begin
    QRLabel16.Left := 440;
    QRLabel17.Left := 555;
    QRLabel17.Caption := 'Unitario';
  end;
  if DMParamSistema.CodEmpresa = 'CASATINTAS' then
  begin
    QRLabel13.Caption := 'Qtd';
    QRLabel14.Visible := False;
    QRLabel25.Left := 35;
  end;
  if (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
  begin
    QRLabel15.Left := 85;
    QRLabel25.Visible := False;
    QRLabel25.Enabled := False;
  end;
  if (DMParamSistema.CodEmpresa = 'SCALA') then
  begin
    QRDBText19.Left := 348;
    QRLabel16.Caption := 'Marca';
  end;
end;

procedure TFRPedidoAssistenciaTecnica.QRDBText5Print(sender: TObject;
  var Value: String);
begin
 if (DMParamSistema.CodEmpresa = 'USIMED') then
       Value := Copy(Value, 1, 45);
end;

procedure TFRPedidoAssistenciaTecnica.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
{Adicionado para exibir o estado por completo. CodSuporte: 10141 / Alex 03/12/2024.}
  if (DMParamSistema.CodEmpresa = 'POLLYANA') then
  begin
    QRDBText16.DataField := 'DESC_ESTADO';
    QRDBText16.Left := 350;
    QRDBText16.Width := 175;
  end;
end;

end.

