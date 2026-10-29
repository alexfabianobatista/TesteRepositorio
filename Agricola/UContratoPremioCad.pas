unit UContratoPremioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, QuickRpt, Grids, DBGrids, OracleData,
  OraTeste, variants, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFContratoPremioCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    BtFilial: TBitBtn;
    DBFilial: TDBDirceu;
    btcliente: TBitBtn;
    DBcliente: TDBDirceu;
    btproduto: TBitBtn;
    DBProduto: TDBDirceu;
    DBRadioGroup2: TDBRadioGroup;
    Relatriode1: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    lblPremio: TLabel;
    DBEdit6: TDBEdit;
    RelatriodePreoFixo1: TMenuItem;
    Opes1: TMenuItem;
    BaixaContrato1: TMenuItem;
    QRCompositeReport1: TQRCompositeReport;
    VoltarBaixa1: TMenuItem;
    DBGrid1: TDBGrid;
    DSContratoPremioMov: TDataSource;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    BtConsContaCorrente: TBitBtn;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure btclienteClick(Sender: TObject);
    procedure btprodutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relatriode1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure RelatriodePreoFixo1Click(Sender: TObject);
    procedure BaixaContrato1Click(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure VoltarBaixa1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConsContaCorrenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoPremioCad: TFContratoPremioCad;

implementation

uses UContratoPremio_cl, UFilialCons, UCadastroCons, UProdutoCons,
  UFilial_cl, UCadastro_cl, UProduto_cl, UContratoPremioCons,
  UContratoPremioParam, URContratoPremio, URContratoPrecoFixo,
  URomaneioAgricola_cl, UNotaEntrada_cl, UOracle_cl, UParamSistema_cl,
  UNotaEntrada_Confirma, UReciboFixar, USequencia_cl, URReciboNFA,
  UBiblioteca, UNotaAgricolaConf, UrReciboAB;

{$R *.DFM}

procedure TFContratoPremioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DsPrimario.State in [DSInsert,DsEdit] then
  begin
    BtCliente.Enabled := True;
    BtFilial.Enabled  := true;
    BtProduto.Enabled := True;
  end
  else
  begin
    BtCliente.Enabled := False;
    BtFilial.Enabled  := False;
    BtProduto.Enabled := False;
  end;
end;

procedure TFContratoPremioCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialcons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMContratoPremio.QContratoPremioCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContratoPremioCad.btclienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontratoPremio.QcontratoPremioCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoPremioCad.btprodutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutocons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMcontratoPremio.QcontratoPremioCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFContratoPremioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoPremioCons = nil then
    FContratoPremioCons := TFContratoPremioCons.create(application);

  if FContratoPremioCons.showmodal = mrok then
  begin
    DMContratoPremio.QContratoPremio.close;
    DMContratoPremio.QContratoPremio.SetVariable('PK',DMContratoPremio.QContratoPremioConsCOD_CONTRATO_PREMIO.AsInteger);
    DMContratoPremio.QContratoPremio.open;
  end;
end;

procedure TFContratoPremioCad.Relatriode1Click(Sender: TObject);
begin
  inherited;
  if FContratoPremioParam = nil then
    FContratoPremioParam := TFContratoPremioParam.create(application);

  FContratoPremioParam.PGRelatorio.Pages[0].TabVisible := True;
  if FContratoPremioParam.showmodal = mrok then
  begin
    if trim(FContratoPremioParam.ME0Produto.Text) = '' then
      raise Exception.Create('Informe o Produto');

    if trim(FContratoPremioParam.ME0ValSaca.text) = '' then
      raise Exception.Create('Informe o valor da saca');

    if trim(FContratoPremioParam.ME0ValTaxa.Text) = '' then
      raise Exception.Create('Informe a taxa do Dólar');

    DMContratoPremio.QRContratoPremio.Close;

    DMContratoPremio.QRContratoPremio.SetVariable('COD_PRODUTO',StrToInt(FContratoPremioParam.ME0Produto.Text));
    DMContratoPremio.QRContratoPremio.SetVariable('VAL_REAL',strtofloat(FContratoPremioParam.ME0ValSaca.Text));
    DMContratoPremio.QRContratoPremio.SetVariable('VAL_TX_DOLAR',strtofloat(FContratoPremioParam.ME0ValTaxa.Text));

    if trim(FContratoPremioParam.ME0Filial.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('COD_FILIAL',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('COD_FILIAL',StrToInt(FContratoPremioParam.ME0Filial.Text));

    if trim(FContratoPremioParam.ME0Cadastro.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('COD_CADASTRO',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('COD_CADASTRO',StrToInt(FContratoPremioParam.ME0Cadastro.Text));

    if trim(FContratoPremioParam.ME0DtEmissaoIni.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('DT_EMISSAO_INI',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('DT_EMISSAO_INI',StrToInt(FContratoPremioParam.ME0DtEmissaoIni.Text));

    if trim(FContratoPremioParam.ME0DtEmissaoFim.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('DT_EMISSAO_FIM',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('DT_EMISSAO_FIM',StrToInt(FContratoPremioParam.ME0DtEmissaoFim.Text));

    if trim(FContratoPremioParam.ME0DtEntregaIni.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('DT_ENTREGA_INI',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('DT_ENTREGA_INI',StrToInt(FContratoPremioParam.ME0DtEntregaIni.Text));

    if trim(FContratoPremioParam.ME0DtEntregaFim.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('DT_ENTREGA_FIM',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('DT_ENTREGA_FIM',StrToInt(FContratoPremioParam.ME0DtEntregaFim.Text));

    if trim(FContratoPremioParam.ME0DtVencimentoIni.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('DT_VENCIMENTO_INI',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('DT_VENCIMENTO_INI',StrToInt(FContratoPremioParam.ME0DtVencimentoIni.Text));

    if trim(FContratoPremioParam.ME0DtVencimentoFim.Text) = '' then
      DMContratoPremio.QRContratoPremio.SetVariable('DT_VENCIMENTO_FIM',null)
    else
      DMContratoPremio.QRContratoPremio.SetVariable('DT_VENCIMENTO_FIM',StrToInt(FContratoPremioParam.ME0DtVencimentoFim.Text));

    if FContratoPremioParam.RG0Moeda.ItemIndex = 0 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_TIPO_PREMIO',null);
    if FContratoPremioParam.RG0Moeda.ItemIndex = 1 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_TIPO_PREMIO','PR');
    if FContratoPremioParam.RG0Moeda.ItemIndex = 2 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_TIPO_PREMIO','PD');
    if FContratoPremioParam.RG0Moeda.ItemIndex = 3 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_TIPO_PREMIO','PP');

    if FContratoPremioParam.RG0Situacao.ItemIndex = 0 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_SITUACAO',null);
    if FContratoPremioParam.RG0Situacao.ItemIndex = 1 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_SITUACAO','ABERTO');
    if FContratoPremioParam.RG0Situacao.ItemIndex = 2 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_SITUACAO','FECHADO');
    if FContratoPremioParam.RG0Situacao.ItemIndex = 3 then
      DMContratoPremio.QRContratoPremio.SetVariable('IND_SITUACAO','CANCELADO');

    DMContratoPremio.QRContratoPremio.Open;

    if FRContratoPremio = nil then
      FRContratoPremio := TFRContratoPremio.create(application);

    FRContratoPremio.QRProduto.Caption := FContratoPremioParam.ed0Produto.Text;
    FRContratoPremio.QRValSaca.Caption := FormatFloat('#,##0.00', StrToFloat(FContratoPremioParam.ME0ValSaca.Text));
    FRContratoPremio.QRTxDolar.Caption := FormatFloat('#,##0.00', StrToFloat(FContratoPremioParam.ME0ValTaxa.Text));

    FRContratoPremio.QRProduto.Caption := 'Produto: '          + FRContratoPremio.QRProduto.Caption;
    FRContratoPremio.QRValSaca.Caption := 'Valor da Saca: R$ ' + FRContratoPremio.QRValSaca.Caption;
    FRContratoPremio.QRTxDolar.Caption := 'Taxa do Dólar: '    + FRContratoPremio.QRTxDolar.Caption;

    if FContratoPremioParam.RGPreview.ItemIndex = 0 then
      FRContratoPremio.QRPrimario.Preview
    else
      FRContratoPremio.QRPrimario.Print;
  end;
end;

procedure TFContratoPremioCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  lblPremio.Caption := 'Prêmio';

  if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PD' then
    lblPremio.Caption := 'Prêmio Dólar';

  if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PR' then
    lblPremio.Caption := 'Prêmio Reais';

  if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PP' then
    lblPremio.Caption := 'Prêmio Porcentagem';

  if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'FD' then
    lblPremio.Caption := 'Valor Fixo Dólar';

  if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'FR' then
    lblPremio.Caption := 'Valor Fixo Reais';
end;

procedure TFContratoPremioCad.RelatriodePreoFixo1Click(Sender: TObject);
begin
  inherited;
  if FContratoPremioParam = nil then
    FContratoPremioParam := TFContratoPremioParam.create(application);

  FContratoPremioParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FContratoPremioParam.showmodal = mrok then
  begin
    if trim(FContratoPremioParam.ME1ValTaxa.Text) = '' then
      raise Exception.Create('Informe a taxa do Dólar');

    DMContratoPremio.QRContratoPrecofixo.Close;

    DMContratoPremio.QRContratoPrecofixo.SetVariable('VAL_TX_DOLAR',strtofloat(FContratoPremioParam.ME1ValTaxa.Text));

    if trim(FContratoPremioParam.ME1Produto.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('COD_PRODUTO',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('COD_PRODUTO',StrToInt(trim(FContratoPremioParam.ME1Produto.Text)));

    if trim(FContratoPremioParam.ME1Filial.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('COD_FILIAL',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('COD_FILIAL',StrToInt(FContratoPremioParam.ME1Filial.Text));

    if trim(FContratoPremioParam.ME1Cadastro.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('COD_CADASTRO',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('COD_CADASTRO',StrToInt(FContratoPremioParam.ME1Cadastro.Text));

    if trim(FContratoPremioParam.ME1DtEmissaoIni.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_EMISSAO_INI',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_EMISSAO_INI',StrToInt(FContratoPremioParam.ME1DtEmissaoIni.Text));

    if trim(FContratoPremioParam.ME1DtEmissaoFim.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_EMISSAO_FIM',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_EMISSAO_FIM',StrToInt(FContratoPremioParam.ME1DtEmissaoFim.Text));

    if trim(FContratoPremioParam.ME1DtEntregaIni.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_ENTREGA_INI',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_ENTREGA_INI',StrToInt(FContratoPremioParam.ME1DtEntregaIni.Text));

    if trim(FContratoPremioParam.ME1DtEntregaFim.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_ENTREGA_FIM',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_ENTREGA_FIM',StrToInt(FContratoPremioParam.ME1DtEntregaFim.Text));

    if trim(FContratoPremioParam.ME1DtVencimentoIni.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_VENCIMENTO_INI',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_VENCIMENTO_INI',StrToInt(FContratoPremioParam.ME1DtVencimentoIni.Text));

    if trim(FContratoPremioParam.ME1DtVencimentoFim.Text) = '' then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_VENCIMENTO_FIM',null)
    else
      DMContratoPremio.QRContratoPrecofixo.SetVariable('DT_VENCIMENTO_FIM',StrToInt(FContratoPremioParam.ME1DtVencimentoFim.Text));

    if FContratoPremioParam.RG1Moeda.ItemIndex = 0 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_TIPO_PREMIO',null);
    if FContratoPremioParam.RG1Moeda.ItemIndex = 1 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_TIPO_PREMIO','FR');
    if FContratoPremioParam.RG1Moeda.ItemIndex = 2 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_TIPO_PREMIO','FD');

    if FContratoPremioParam.RG1Situacao.ItemIndex = 0 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_SITUACAO',null);
    if FContratoPremioParam.RG1Situacao.ItemIndex = 1 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_SITUACAO','ABERTO');
    if FContratoPremioParam.RG1Situacao.ItemIndex = 2 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_SITUACAO','FECHADO');
    if FContratoPremioParam.RG1Situacao.ItemIndex = 3 then
      DMContratoPremio.QRContratoPrecofixo.SetVariable('IND_SITUACAO','CANCELADO');

    DMContratoPremio.QRContratoPrecoFixo.Open;

    if FRContratoPrecoFixo = nil then
      FRContratoPrecoFixo := TFRContratoPrecoFixo.create(application);

    FRContratoPrecoFixo.QRTxDolar.Caption := FormatFloat('#,##0.00', StrToFloat(FContratoPremioParam.ME1ValTaxa.Text));
    FRContratoPrecoFixo.QRTxDolar.Caption := 'Taxa do Dólar: '    + FRContratoPrecoFixo.QRTxDolar.Caption;

    if FContratoPremioParam.RGPreview.ItemIndex = 0 then
      FRContratoPrecoFixo.QRPrimario.Preview
    else
      FRContratoPrecoFixo.QRPrimario.Print;
  end;
end;

procedure TFContratoPremioCad.BaixaContrato1Click(Sender: TObject);
var
 wTotalMov, wBaixa, wFunrural :Real;
 wVal, wDescProduto,wTexto : String;
 wQtdeABaixar, wQtdeInformada, wValSacaPagar, wValSacaHoje, wCotacao, wQt_DPI, wEmbalagem : real;
 wCodCadastroFixar, wCodProduto : integer;
 wCommitOnPost : boolean;
begin
  inherited;

  wCommitOnPost := DMContratoPremio.QContratoPremio.CommitOnPost; //guarda o estado do commitOnPost

  if FContratoPremioParam = Nil then
    FContratoPremioParam := TFContratoPremioParam.Create(Application);

  //valida os dados do contrato para ver se pode ser baixado
  if DMContratoPremio.QContratoPremioCOD_CONTRATO_PREMIO.Text = '' then
    raise Exception.Create('Não tem Nenhum Contrato Selecionado.');

  if DMContratoPremio.QContratoPremioIND_SITUACAO.Value <> 'ABERTO' then
    raise Exception.Create('Esse Contrato não está aberto.');
  //------------------------------------

  //--------preenche os campos da tela de parâmetros
  wVal := DMOracle.BuscaNome('SELECT TB_CONTRATO_PREMIO.QT_QUANTIDADE - NVL(SUM(TB_CONTRATO_PREMIO_MOV.QT_QUANTIDADE), 0) ' +
                             ' FROM  TB_CONTRATO_PREMIO, TB_CONTRATO_PREMIO_MOV ',
                             '       TB_CONTRATO_PREMIO.COD_CONTRATO_PREMIO = TB_CONTRATO_PREMIO_MOV.COD_CONTRATO_PREMIO(+) ' +
                             ' AND   TB_CONTRATO_PREMIO.COD_CONTRATO_PREMIO = ' + DMContratoPremio.QContratoPremioCOD_CONTRATO_PREMIO.text +
                             ' GROUP BY TB_CONTRATO_PREMIO.QT_QUANTIDADE ');

  wQtdeABaixar := StrToFloat(wVal);
  FContratoPremioParam.Me2Quantidade.Text := wVal;
  FContratoPremioParam.Me2DtPagto.Text    := DMContratoPremio.QContratoPremioDT_VENCIMENTO.Text;
  wCodCadastroFixar                       := DMContratoPremio.QContratoPremioCOD_CADASTRO.Value; 
  FContratoPremioParam.Me2CodCliente.Text := IntToStr(wCodCadastroFixar);
  FContratoPremioParam.Me2CodClienteExit(Sender);
  //-------------------------------------
  FContratoPremioParam.Me2PercDpi.Text := DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO='+Trim(DMContratoPremio.QContratoPremioCOD_PRODUTO.Text));
  FContratoPremioParam.PGRelatorio.Pages[2].TabVisible := True;
  if FContratoPremioParam.ShowModal = mrOK then
  begin

    if Trim(FContratoPremioParam.Me2CodCliente.Text) = '' then
      raise Exception.Create('Deve ser informado o cliente que para baixa do saldo a fixar.');

    wCodCadastroFixar := StrToInt(Trim(FContratoPremioParam.Me2CodCliente.Text));

    if Trim(FContratoPremioParam.Me2Quantidade.Text) = '' then
      raise Exception.create('Informe a Quantidade a Baixar');

    if Trim(FContratoPremioParam.Me2DtPagto.Text) = '' then
      raise Exception.Create('Informe a data de Pagamento');

    wQtdeInformada := StrToFloat(Trim(FContratoPremioParam.Me2Quantidade.Text));

    if wQtdeInformada > wQtdeABaixar then
      raise Exception.Create('A quantidade Informada é Maior que a Quantidade a baixar pelo contrato');

    with DMContratoPremio do
    begin
      wCodProduto  := QContratoPremioCOD_PRODUTO.AsInteger;
      wDescProduto := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', ' COD_PRODUTO = ' + IntToStr(wCodProduto));

      //usado para verifcar o saldo do cliente. quanto tem a baixar
      DMRomaneioAgricola.QRomConsFixar.Close;
      //DMRomaneioAgricola.QRomConsFixar.SetVariable('CADASTRO', QContratoPremioCOD_CADASTRO.Value);
      DMRomaneioAgricola.QRomConsFixar.SetVariable('CADASTRO', wCodCadastroFixar);
      DMRomaneioAgricola.QRomConsFixar.SetVariable('PRODUTO', QContratoPremioCOD_PRODUTO.Value);
      DMRomaneioAgricola.QRomConsFixar.SetVariable('FILIAL', QContratoPremioCOD_FILIAL.Value);
//      DMRomaneioAgricola.QRomConsFixar.SetVariable('DATAI', StrToDate('01/01/1999')); //???????
//      DMRomaneioAgricola.QRomConsFixar.SetVariable('DATAF', Date);
      DMRomaneioAgricola.QRomConsFixar.SetVariable('TIPO_FIXAR', 'EMPRESA');
      DMRomaneioAgricola.QRomConsFixar.Open;

      //----------CALCULA O VALOR O TOTAL JÁ MOVIMENTADO-------------------
      QContratoPremioMov.Open;
      QContratoPremioMov.First;
      wTotalMov := 0;
      While not(QContratoPremioMov.Eof) do
      Begin
        wTotalMov := wTotalMov + QContratoPremioMovQT_Quantidade.value;
        QContratoPremioMov.Next;
      End;
      //------------------------------------------------------------------

      //verifica se a quantia informada é maior que o total a baixar do contrato-------
      If FContratoPremioParam.Me2Quantidade.Text <> '' Then
      Begin
        If (StrToFloat(FContratoPremioParam.Me2Quantidade.Text) + wTotalMov) > QContratoPremioQT_Quantidade.Value Then
          Raise Exception.Create('Quantidade Informada Maior que Saldo em aberto no Contrato');
        wTotalMov := StrToFloat(FContratoPremioParam.Me2Quantidade.Text);
      End
      Else
        wTotalMov := QContratoPremioQT_Quantidade.Value - wTotalMov;
      //------------------------------------------------------------------

      //---------verifica a cotacao do dolar------------------------------
      wCotacao := 0;
      if (DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PD') or
         (DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'FD') then
      begin
        wVal := DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','DT_COTACAO = ''' + DateToStr(date) + '''');
        if wVal = '' then
          raise Exception.Create('Não foi Lançada a cotação.');

        wCotacao := StrToFloat(wVal);
      end;
      //------------------------------------------------------------------

      //----------verifica o valor do produto hoje------------------------
      wVal := DMOracle.buscaNome('SELECT VAL_PRECO FROM TB_PRECO_AGRICOLA',
                                 '     COD_PRODUTO = ' + DMContratoPremio.QContratoPremioCOD_PRODUTO.Text +
                                 ' AND COD_FILIAL = ' + DMContratoPremio.QContratoPremioCOD_FILIAL.Text +
                                 ' AND DT_PRECO_AGRICOLA = ''' + DateToStr(date) + '''');
      if wVal = '' then
          raise Exception.Create('Produto sem Preço');
      wValSacaHoje := StrToFloat(wVal);
      //------------------------------------------------------------------

      //-------------verifica o valor que será pago pela saca de acordo com o contrato----
      if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PR' then    //PREMIO EM REAIS
        wValSacaPagar := wValSacaHoje + DMContratoPremio.QContratoPremioVAL_PREMIO.Value;

      if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PD' then    //PREMIO EM DOLAR
        wValSacaPagar := wValSacaHoje + (DMContratoPremio.QContratoPremioVAL_PREMIO.Value * wCotacao);

      if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'PP' then    //PREMIO EM PORCENTAGEM
        wValSacaPagar := wValSacaHoje + (wValSacaHoje/100 * DMContratoPremio.QContratoPremioVAL_PREMIO.Value);

      if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'FD' then   //valor fixo em dolar
        wValSacaPagar := DMContratoPremio.QContratoPremioVAL_PREMIO.Value * wCotacao;

      if DMContratoPremio.QContratoPremioIND_TIPO_PREMIO.Value = 'FR' then  //valor fixo em reais
        wValSacaPagar := DMContratoPremio.QContratoPremioVAL_PREMIO.Value;
      //----------------------------------------------------------------------

      try
        if not(DMOracle.DBCemapa.InTransaction) then
          DMOracle.DBCemapa.StartTransaction;

        //------------se possui saldo a fixar e o valor a baixar for <> 0-------
        If (DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value > 0) and (wTotalMov > 0) then
        begin
          if DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value >= wTotalMov  then
            wBaixa := wTotalMov
          else
            raise Exception.Create('A quantia Informada para a baixa é maior que o saldo a fixar.');
            //wBaixa := DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value;
          with DMNotaEntrada do
          begin
            PContabiliza_Extra := 'N';
            QNotaEntrada.Open;
            QItemNF.Open;

            QNotaEntrada.Insert;
            QNotaEntradaCOD_FILIAL.Value         := QContratoPremioCOD_FILIAL.Value;
            QNotaEntradaCOD_OPERACAO.Value       := StrToInt(DMOracle.BuscaNome('SELECT COD_OPERACAO_FIXACAO_CONTRATO FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = ' + FloatToStr(QContratoPremioCOD_PRODUTO.Value)));
            //QNotaEntradaCOD_CADASTRO.Value       := QContratoPremioCOD_CADASTRO.Value;
            QNotaEntradaCOD_CADASTRO.Value       := wCodCadastroFixar;
            QNotaEntradaCOD_SERIE.Value          := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_FILIAL','COD_FILIAL = ' + FloatToStr(QContratoPremioCOD_FILIAL.Value));
            QNotaEntradaNUM_NOTA.Value           := 0;
            QNotaEntradaDT_RECEBIMENTO.Value     := DMOracle.DataServ;
            QNotaEntradaDT_EMISSAO.Value         := DMOracle.DataServ;
            QNotaEntradaIND_CONDICAO_PAGTO.Value := '2';
            QNotaEntradaOBS.Value                := 'Ref Cont. Cod.:' + QContratoPremioCod_Contrato_premio.Text + ' de ' + DateToStr(QContratoPremioDt_emissao.Value);
            QNotaEntradaOBS_COMPLEMENTO.Value    := Trim(FContratoPremioParam.Ed2Observacao.Text);
            if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
              QNotaEntradaCOD_MENSAGEM.Value     := 2;


            QItemNF.Insert;
            QItemNFCod_Produto.Value       := QContratoPremioCOD_PRODUTO.value;
            QItemNFQT_QUANTIDADE.Value     := wBaixa;
            QItemNFVAL_UNITARIO.Value      := wValSacaPagar;
            QItemNFIND_BX_CONTR_VEND.Value := 'N';
            QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
            If Trim(FContratoPremioParam.Me2CreditoSemente.Text) <> '' Then
               QItemNFQT_CREDITO_TRANSGENICOS.Value := StrToFloat(Trim(FContratoPremioParam.Me2CreditoSemente.Text))
            Else
               QItemNFQT_CREDITO_TRANSGENICOS.Value := 0;
            wQt_DPI := QItemNFQT_QUANTIDADE.Value - QItemNFQT_CREDITO_TRANSGENICOS.Value;
            If (Trim(FContratoPremioParam.Me2PercDpi.Text) <> '') And (Trim(FContratoPremioParam.Me2PercDpi.Text) <> '0') And (wQt_DPI > 0) Then
             Begin
               wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                      'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)));
               QItemNFVAL_DPI_TRANSGENICOS.Value := QItemNFVal_Unitario.Value * wQt_DPI / wEmbalagem * StrToFloat(Trim(FContratoPremioParam.Me2PercDpi.Text)) / 100;
             End;
            QItemNF.Post;

            wFunRural := CalculaFunrural(QItemNFCOD_PRODUTO.value,
                                         QNotaEntradaCOD_OPERACAO.value,
                                         QNotaEntradaCOD_CADASTRO.value,
                                         QItemNFVAL_TOTAL.value);
            QNotaEntradaVAL_FUNRURAL.Value := wFunRural;

            QContratoPremioMov.Insert;
            QContratoPremioMovCOD_CONTRATO_PREMIO.Value := QContratoPremioCOD_CONTRATO_PREMIO.Value;
            QContratoPremioMovDT_MOVIMENTO.Value        := DMOracle.DataServ;
            QContratoPremioMovQT_QUANTIDADE.Value       := wBaixa;
            QContratoPremioMovCOD_NOTA_CAB.value        := DMNotaEntrada.QNotaEntradaCOD_NOTA_CAB.value;
            //--QContratoPremioMovVAL_MOVIMENTO.Value       := ((QContratoPremioMovQT_QUANTIDADE.Value * wValSacaPagar)*(100-QContratoPREMIOPERC_FUNRURAL.value)/100)/DMProduto.QProdutoNUM_EMBALAGEM.Value;
            QContratoPremioMovDESC_OBSERVACAO.Value     := 'Referente a Nota : Cod:'+FloatTostr(DMNotaEntrada.QNotaEntradaCod_Nota_cab.value);
            //QContratoPremioMovIND_SALDO_ZERO.Value  := 'N';
            QContratoPremioMov.Post;

            //QNotaEntradaCOD_CONTRATO_GP_MOV.Value := QContratoGP_MovCOD_CONTRATO_GP_MOV.Value;////???????????
            DMNotaEntrada.CalculaDesconto(DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Value,DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value,DMNotaEntrada.QNotaEntradaCOD_OPERACAO.Value,DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value,DMNotaEntrada.QItemNFCOD_PRODUTO.Value,DMNotaEntrada.QItemNFQT_QUANTIDADE.Value,'E',DMNotaEntrada.QNotaEntradaCOD_CADASTRO_PARCEIRO.Text);  // calcula desconto do a fixar
            QItemNF.Edit;
            QItemNFVal_Desconto.Value := QNotaEntradaVal_Desconto.Value;
            QItemNF.Post;

            QNotaEntrada.post;

            //-----------Rotina para verificar se todo o contrato foi baixado 'fechar contrato'-------
            QContratoPremioMov.Close;
            QContratoPremioMov.Open;
            QContratoPremioMov.First;
            wTotalMov := 0;

            while not(QContratoPremioMov.Eof) do
            Begin
              wTotalMov := wTotalMov + QContratoPremioMovQT_Quantidade.value;
              QContratoPremioMov.Next;
            End;

            If wTotalMov = QContratoPremioQT_Quantidade.Value Then
            Begin
              QContratoPremio.CommitOnPost := false;         //deixa o commitOnPost para false para nao commitar os dados aqui, o estado volta ao normal mais abaixo
              QContratoPremio.Edit;
              QContratoPremioIND_SITUACAO.Value := 'FECHADO';
              QContratoPremio.Post;
            End;
            //----------------------------------------------------------------

            {If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
               Raise Exception.Create('Nota Fiscal já confirmada!');
            If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
               Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');

            DMNotaEntrada.pOperacaoInterna := 3;}

            DMFilial.QFilial.Close;
            DMFilial.QFilial.SetVariable('PK',QContratoPremioCOD_FILIAL.Value);
            DMFilial.QFilial.Open;
            if FReciboFixar = nil then
               FReciboFixar := TFReciboFixar.Create(Application);

            FReciboFixar.pCodCadastro           := wCodCadastroFixar;
            FReciboFixar.pCodFilial             := QContratoPremioCOD_FILIAL.Value;
            FReciboFixar.QRLProduto.Caption     := wDescProduto;
            FReciboFixar.QRLValOutros.Caption   := FormatFloat('#,##0.00', 0);
            FReciboFixar.QRLNumero.Caption      := FloatToStr(DMSequencia.Sequencia(QContratoPremioCOD_FILIAL.Value,'ACERTO'));
            FReciboFixar.QRLDtPagto.Caption     := FContratoPremioParam.Me2DtPagto.Text;
            FReciboFixar.QRLObservacao.Caption  := FContratoPremioParam.Ed2Observacao.Text;
            FReciboFixar.QRLDataExtenso.Caption := DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',Date);

            if FRReciboNFA = Nil then
               FRReciboNFA:=TFRReciboNFA.Create(Application);
            FRReciboNFA.pCodCadastro:=wCodCadastroFixar;
            FRReciboNFA.QRLDt_Recibo.Caption:=FContratoPremioParam.Me2DtPagto.Text;
            FRReciboNFA.pCodFilial:=QContratoPremioCOD_FILIAL.Value;
            FRReciboNFA.QRLValorExtenso.Caption:=bib.extenso(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value,'REAL');
            FRReciboNFA.QRLValor.Caption:=FormatFloat('#,##0.00',(DmNotaEntrada.QItemNFVAL_TOTAL.value - DmNotaEntrada.QNotaEntradaVAL_FUNRURAL.value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value));
            FRReciboNFA.QRLData.Caption:=DMFilial.QFilialDESC_CIDADE.text+FormatDateTime('"," dd "de" mmmm "de" yyyy"."',StrToDate(FContratoPremioParam.Me2DtPagto.Text));
            FRReciboNFA.QRLNRRECIBO.Caption:=FloatToStr(DMSequencia.Sequencia(QContratoPremioCOD_FILIAL.Value,'RECIBO'));
            FRReciboNFA.QRLComplemento.Caption:='Referente a Venda de '+FloatToStr(wBaixa)+' Kgs de ' +Trim(wDescProduto);
            QRCompositeReport1.Preview;
            {
            //---abre a tela pra confirmar a nota, no momento da confirmação---
            If FNotaAgricolaConf = Nil then
              FNotaAgricolaConf := TFNotaAgricolaConf.Create(Application);
            //FNotaAgricolaConf.pContrato := True;
            if FNotaAgricolaConf.ShowModal <> mrok then
              raise Exception.Create('Baixa Cancelada');


            DMNotaEntrada.pOperacaoInterna             := 0;
            }
            if DMOracle.DBCemapa.InTransaction then
               DMOracle.DBCemapa.Commit;
            ShowMessage('Geração de Nota e Movimento efetuado com sucesso.');
          End;
        End
        else
        Begin
          DMNotaEntrada.QNotaEntrada.Close;
          DMNotaEntrada.QItemNF.Close;
          DMNotaEntrada.QSomaItemNota.Close;
          DMContratoPremio.QContratoPremio.close;
          DMContratoPremio.QContratoPremio.open;
          DMContratoPremio.QContratoPremioMov.close;
          DMContratoPremio.QContratoPremioMov.open;
          If DMOracle.DBCemapa.InTransaction then
             DMOracle.DBCemapa.Rollback;
          ShowMessage('Não há saldo a fixar para este Cliente / Produto.');
        End;
      except
        if DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
        QContratoPremio.CommitOnPost := wCommitOnPost; //deixa o commitOnPost no estado anterior
        DMNotaEntrada.QNotaEntrada.Close;
        DMNotaEntrada.QItemNF.Close;
        DMNotaEntrada.QSomaItemNota.Close;
        DMContratoPremio.QContratoPremio.close;
        DMContratoPremio.QContratoPremio.open;
        DMContratoPremio.QContratoPremioMov.close;
        DMContratoPremio.QContratoPremioMov.open;
        Raise;
      End;
    End;
  End;
  DMContratoPremio.QContratoPremio.CommitOnPost := wCommitOnPost; //deixa o commitOnPost no estado anterior

  SBRefreshClick(Self);
end;

procedure TFContratoPremioCad.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FReciboFixar.QuickRep1);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
    QRCompositeReport1.Reports.Add(FRReciboAB.QuickRep1)
  Else
    QRCompositeReport1.Reports.Add(FRReciboNFA.QuickRep1);
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',FReciboFixar.pCodCadastro);
  DMCadastro.QCadastro.Open;
  FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CEP||'+#39+' '+#39+'||TB_FILIAL.DESC_CIDADE||'+#39+' '+#39+'||TB_FILIAL.COD_ESTADO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_TELEFONE FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
end;

procedure TFContratoPremioCad.VoltarBaixa1Click(Sender: TObject);
var wCodNotaCab : integer;
  wCommitOnPost : boolean;
  wTotalMov     : real;
  wVal          : string;
begin
  inherited;
  wCommitOnPost := DMContratoPremio.QContratoPremio.CommitOnPost; //guarda o estado do commitOnPost

  if DMContratoPremio.QContratoPremioMovCOD_CONTRATO_PREMIO_MOV.Text = '' then
    raise Exception.Create('Não existe nenhuma baixa selecionada.');

  if MessageDlg('Deseja realmente voltar essa baixa?',mtConfirmation, [mbYes, mbNo], 0) <> mryes then
    exit;

  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMContratoPremio.QContratoPremioMovDT_MOVIMENTO.Value Then
     Raise Exception.Create('Não é Permitido Voltar Confirmação - Período Contábil');
     
  try
    wCodNotaCab := DMContratoPremio.QContratoPremioMovCOD_NOTA_CAB.Value;
    DMContratoPremio.QContratoPremioMov.delete;

    DMNotaEntrada.QNotaEntrada.Close;
    DMNotaEntrada.QNotaEntrada.SetVariable('PK', wCodNotaCab);
    DMNotaEntrada.QNotaEntrada.Open;

    //foi colocado o if aqui pois as vezes a nota gerada pelo contrato
    //é voltado manualmente e quando é voltado a baixa por aqui
    //é retornado um erro.
    if not DMNotaEntrada.QNotaEntrada.Eof then
    begin
      DMNotaEntrada.pTipo_Lote := 1;
      DMNotaEntrada.PVoltaConfirmacao := True;
      DMOracle.Audit(TOracleDataset1(DSPrimario.Dataset), 'Volta Confirmação' );
      DMNotaEntrada.QItemNF.open;
      DMNotaEntrada.VoltaConfirmacao(wCodNotaCab, 'N', '3');// N--> nao commita a transação
      DMNotaEntrada.PVoltaConfirmacao := False;
      DMNotaEntrada.pTipo_Lote := 0;
    end;

    //-----------Rotina para verificar se todo o contrato está aberto-------
    wVal := '0' + DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_CONTRATO_PREMIO', 'COD_CONTRATO_PREMIO = ' + DMContratoPremio.QContratoPremioCOD_CONTRATO_PREMIO.Text);
    wTotalMov := StrToFloat(wVal);

    If wTotalMov <= DMContratoPremio.QContratoPremioQT_Quantidade.Value Then
    Begin
      DMContratoPremio.QContratoPremio.CommitOnPost := false;         //deixa o commitOnPost para false para nao commitar os dados aqui, o estado volta ao normal mais abaixo
      DMContratoPremio.QContratoPremio.Edit;
      DMContratoPremio.QContratoPremioIND_SITUACAO.Value := 'ABERTO';
      DMContratoPremio.QContratoPremio.Post;
    End;
    //----------------------------------------------------------------

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    DMContratoPremio.QContratoPremio.Refresh;
    DMContratoPremio.QContratoPremio.CommitOnPost := wCommitOnPost; //deixa o commitOnPost no estado anterior
    raise;
  end;
  DMContratoPremio.QContratoPremio.CommitOnPost := wCommitOnPost; //deixa o commitOnPost no estado anterior
end;

procedure TFContratoPremioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMContratoPremio.QContratoPremio.close;
  DMContratoPremio.QContratoPremio.open;
  DMContratoPremio.QContratoPremioMov.close;
  DMContratoPremio.QContratoPremioMov.open;
end;

procedure TFContratoPremioCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMContratoPremio.QContratoPremio; //pra evitar de perder o dataset
end;

procedure TFContratoPremioCad.BtConsContaCorrenteClick(Sender: TObject);
var wBanco : string;
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  Begin
    If DMCadastro.QCadastroConsCod_Banco_Agencia.Text <> '' Then
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then  //PEDIDO PELO GELSON - FABIANO - 2006-06-06
        wBanco := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+DMCadastro.QCadastroConsCod_Banco_Agencia.Text)
      else
        wBanco := DMOracle.BuscaNome('SELECT COD_BANCO FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+DMCadastro.QCadastroConsCod_Banco_Agencia.Text);
    DMContratoPremio.QContratoPremioDESC_OBS.Text := 'Banco.:' + wBanco + ' Agencia:'+DMCadastro.QCadastroConsDesc_Agencia.Text +
                                                     ' Conta.:' + DMCadastro.QCadastroConsDesc_Conta_Corrente.Text;
  End;
end;

end.
