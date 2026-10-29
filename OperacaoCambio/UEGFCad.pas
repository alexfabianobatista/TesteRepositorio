unit UEGFCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, OracleNavigator, Grids, DBGrids, variants;

type
  TFEGFCad = class(TFTCadSimples)
    Opes1: TMenuItem;
    BaixadoPenhor1: TMenuItem;
    ProdutoEmpenhorado1: TMenuItem;
    RelaoEGF1: TMenuItem;
    RelatorioVencimentodeEGF1: TMenuItem;
    VoltarBaixadoPenhor1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    SBContaCorrente: TSpeedButton;
    SBFilial: TSpeedButton;
    Label15: TLabel;
    SBHistorico: TSpeedButton;
    Label19: TLabel;
    SBDepartamento: TSpeedButton;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBCBProduto: TDBComboBox;
    DBEdit6: TDBEdit;
    DBDirceu3: TDBDirceu;
    DBEdit18: TDBEdit;
    DBDirceu4: TDBDirceu;
    DBEdit19: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    OracleNavigator1: TOracleNavigator;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    DSEGFLiq: TDataSource;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    DBGrid1: TDBGrid;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    SBHistoricoLiq: TSpeedButton;
    DBDirceu5: TDBDirceu;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBContaCorrenteClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoEGF1Click(Sender: TObject);
    procedure ProdutoEmpenhorado1Click(Sender: TObject);
    procedure RelatorioVencimentodeEGF1Click(Sender: TObject);
    procedure SBHistoricoClick(Sender: TObject);
    procedure BaixadoPenhor1Click(Sender: TObject);
    procedure VoltarBaixadoPenhor1Click(Sender: TObject);
    procedure SBDepartamentoClick(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DSEGFLiqStateChange(Sender: TObject);
    procedure SBHistoricoLiqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEGFCad: TFEGFCad;

implementation

uses UEGF_cl, UOracle_cl, UContaCorrenteCons, UFilialCons, UBancoAgencia_cl,
  UFilial_cl, UEGFCons, UEGFParam, UREGF, URPenhorProduto, UREGFMensal,
  UHistoricoCons, UHistorico_cl, UEGFBaixa, UEGFBaixaPenhor,
  UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFEGFCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsEdit, dsInsert] then
  begin
    SBContaCorrente.Enabled := true;
    SBFilial.Enabled        := true;
    SBHistorico.Enabled     := true;
    SBDepartamento.Enabled  := true;
  end
  else
  begin
    SBContaCorrente.Enabled := false;
    SBFilial.Enabled        := false;
    SBHistorico.Enabled     := false;
    SBDepartamento.Enabled  := false;
  end;
end;

procedure TFEGFCad.FormCreate(Sender: TObject);
begin
  inherited;

  if dsprimario.DataSet = nil then
    dsprimario.DataSet := DMEGF.QEGF; //evita de perder o dataset


  DMEGF.QEGF.close;
  DMEGF.QEGF.open;
  DMEGF.QEGFLiq.close;
  DMEGF.QEGFLiq.open;

  //----------lista todos os produtos já empenhorados, para evitar incluir o mesmo produto de forma diferente
  DMOracle.QExecSQL.close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('SELECT DISTINCT DESC_PRODUTO FROM TB_EGF ORDER BY DESC_PRODUTO');
  DMOracle.QExecSQL.open;

  while not DMOracle.QExecSQL.Eof do
  begin
    DBCBProduto.Items.Add(DMOracle.QExecSQL.Fields[0].Text);
    DMOracle.QExecSQL.Next;
  end;
  DMOracle.QExecSQL.close;

  if DBCBProduto.items.indexof ('MILHO') < 0 then
    DBCBProduto.items.add ('MILHO');
  if DBCBProduto.items.indexof ('SEMENTE') < 0 then
    DBCBProduto.items.add ('SEMENTE');
  if DBCBProduto.items.indexof ('TRIGO') < 0 then
    DBCBProduto.items.add ('TRIGO');
  //----------------------------------------------------------------------------
end;

procedure TFEGFCad.SBContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.create(application);

  if FContaCorrenteCons.showmodal = mrok then
    DMEGF.QEGFCOD_CONTA_CORRENTE.Value :=
      DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFEGFCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);

  if FFilialCons.showmodal = mrok then
    DMEGF.QEGFCOD_FILIAL.Value :=
      DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFEGFCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEGFCons = nil then
    FEGFCons := TFEGFCons.create(application);

  if FEGFCons.showmodal = mrok then
  begin
    DMEGF.QEGF.close;
    DMEGF.QEGF.SetVariable('PK', DMEGF.QEGFConsCOD_EGF.Value);
    DMEGF.QEGF.OPEN;
  end;
end;

procedure TFEGFCad.RelaoEGF1Click(Sender: TObject);
begin
  inherited;
  if FEGFParam = Nil then
    FEGFParam:= TFEGFParam.Create(Application);
  FEGFParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FEGFParam.ShowModal =  mrOk then
  begin
    if FEGFParam.ME0DtBase.Text = '' then
      raise Exception.Create('Informe a data base');

    DMEGF.QREGF.close;

    DMEGF.QREGF.SetVariable('DT_BASE',trim(FEGFParam.ME0DtBase.Text));

    if trim(FEGFParam.ME0Produto.Text) <> '' then
      DMEGF.QREGF.SetVariable('DESC_PRODUTO',trim(FEGFParam.ME0Produto.Text))
    else
      DMEGF.QREGF.SetVariable('DESC_PRODUTO',null);

    if trim(FEGFParam.ME0Local.Text) <> '' then
      DMEGF.QREGF.SetVariable('COD_FILIAL',strtoint(trim(FEGFParam.ME0Local.Text)))
    else
      DMEGF.QREGF.SetVariable('COD_FILIAL',null);

    if trim(FEGFParam.ME0ContaCorrente.Text) <> '' then
      DMEGF.QREGF.SetVariable('COD_CONTA_CORRENTE',strtoint(trim(FEGFParam.ME0ContaCorrente.Text)))
    else
      DMEGF.QREGF.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FEGFParam.ME0Banco.Text) <> '' then
      DMEGF.QREGF.SetVariable('COD_BANCO_AGENCIA',strtoint(trim(FEGFParam.ME0Banco.Text)))
    else
      DMEGF.QREGF.SetVariable('COD_BANCO_AGENCIA',null);

    if trim(FEGFParam.ME0DtCreditoInicio.Text) <> '' then
      DMEGF.QREGF.SetVariable('DT_CREDITO_INI',strtodate(trim(FEGFParam.ME0DtCreditoInicio.Text)))
    else
      DMEGF.QREGF.SetVariable('DT_CREDITO_INI',null);

    if trim(FEGFParam.ME0DtCreditoFim.Text) <> '' then
      DMEGF.QREGF.SetVariable('DT_CREDITO_FIM',strtodate(trim(FEGFParam.ME0DtCreditoFim.Text)))
    else
      DMEGF.QREGF.SetVariable('DT_CREDITO_FIM',null);

    if trim(FEGFParam.ME0DtVencimentoInicio.Text) <> '' then
      DMEGF.QREGF.SetVariable('DT_VENCIMENTO_INI',strtodate(trim(FEGFParam.ME0DtVencimentoInicio.Text)))
    else
      DMEGF.QREGF.SetVariable('DT_VENCIMENTO_INI',null);

    if trim(FEGFParam.ME0DtVencimentoFim.Text) <> '' then
      DMEGF.QREGF.SetVariable('DT_VENCIMENTO_FIM',strtodate(trim(FEGFParam.ME0DtVencimentoFim.Text)))
    else
      DMEGF.QREGF.SetVariable('DT_VENCIMENTO_FIM',null);

    if FEGFParam.RG0Baixados.ItemIndex = 0 then
      DMEGF.QREGF.SetVariable('IND_BAIXADO',null);
    if FEGFParam.RG0Baixados.ItemIndex = 1 then
      DMEGF.QREGF.SetVariable('IND_BAIXADO','SIM');
    if FEGFParam.RG0Baixados.ItemIndex = 2 then
      DMEGF.QREGF.SetVariable('IND_BAIXADO','NAO');

    DMEGF.QREGF.open;

    if FREGF = nil then
      FREGF := TFREGF.create(application);

    FREGF.QRLDtBase.Caption := FEGFParam.ME0DtBase.Text;

    If FEGFParam.RGPreview.ItemIndex = 0 then
      FREGF.QRPrimario.Preview
    else
      FREGF.QRPrimario.Print;

    DMEGF.QREGF.Close;
  end;
end;

procedure TFEGFCad.ProdutoEmpenhorado1Click(Sender: TObject);
begin
  inherited;
  if FEGFParam = Nil then
    FEGFParam:= TFEGFParam.Create(Application);
  FEGFParam.PGRelatorio.Pages[1].TabVisible:=True;
  If FEGFParam.ShowModal =  mrOk then
  begin
    DMEGF.QRPenhorProduto.close;

    if trim(FEGFParam.ME1Produto.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('DESC_PRODUTO',trim(FEGFParam.ME1Produto.Text))
    else
      DMEGF.QRPenhorProduto.SetVariable('DESC_PRODUTO',null);

    if trim(FEGFParam.ME1Local.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('COD_FILIAL',strtoint(trim(FEGFParam.ME1Local.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('COD_FILIAL',null);

    if trim(FEGFParam.ME1ContaCorrente.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('COD_CONTA_CORRENTE',strtoint(trim(FEGFParam.ME1ContaCorrente.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FEGFParam.ME1Banco.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('COD_BANCO_AGENCIA',strtoint(trim(FEGFParam.ME1Banco.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('COD_BANCO_AGENCIA',null);

    if trim(FEGFParam.ME1DtCreditoInicio.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('DT_CREDITO_INI',strtodate(trim(FEGFParam.ME1DtCreditoInicio.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('DT_CREDITO_INI',null);

    if trim(FEGFParam.ME1DtCreditoFim.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('DT_CREDITO_FIM',strtodate(trim(FEGFParam.ME1DtCreditoFim.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('DT_CREDITO_FIM',null);

    if trim(FEGFParam.ME1DtVencimentoInicio.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('DT_VENCIMENTO_INI',strtodate(trim(FEGFParam.ME1DtVencimentoInicio.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('DT_VENCIMENTO_INI',null);

    if trim(FEGFParam.ME1DtVencimentoFim.Text) <> '' then
      DMEGF.QRPenhorProduto.SetVariable('DT_VENCIMENTO_FIM',strtodate(trim(FEGFParam.ME1DtVencimentoFim.Text)))
    else
      DMEGF.QRPenhorProduto.SetVariable('DT_VENCIMENTO_FIM',null);

    if FEGFParam.RG1Baixados.ItemIndex = 0 then
      DMEGF.QRPenhorProduto.SetVariable('IND_BAIXADO',null);
    if FEGFParam.RG1Baixados.ItemIndex = 1 then
      DMEGF.QRPenhorProduto.SetVariable('IND_BAIXADO','SIM');
    if FEGFParam.RG1Baixados.ItemIndex = 2 then
      DMEGF.QRPenhorProduto.SetVariable('IND_BAIXADO','NAO');

    DMEGF.QRPenhorProduto.open;

    if FRPenhorProduto = nil then
      FRPenhorProduto := TFRPenhorProduto.create(application);

    If FEGFParam.RGPreview.ItemIndex = 0 then
      FRPenhorProduto.QRPrimario.Preview
    else
      FRPenhorProduto.QRPrimario.Print;

    DMEGF.QRPenhorProduto.Close;
  end;

end;

procedure TFEGFCad.RelatorioVencimentodeEGF1Click(Sender: TObject);
begin
  inherited;
  if FEGFParam = Nil then
    FEGFParam:= TFEGFParam.Create(Application);
  FEGFParam.PGRelatorio.Pages[2].TabVisible:=True;
  If FEGFParam.ShowModal =  mrOk then
  begin
    DMEGF.QREGFMes.close;

    if trim(FEGFParam.ME2Produto.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('DESC_PRODUTO',trim(FEGFParam.ME2Produto.Text))
    else
      DMEGF.QREGFMes.SetVariable('DESC_PRODUTO',null);

    if trim(FEGFParam.ME2Local.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('COD_FILIAL',strtoint(trim(FEGFParam.ME2Local.Text)))
    else
      DMEGF.QREGFMes.SetVariable('COD_FILIAL',null);

    if trim(FEGFParam.ME2ContaCorrente.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('COD_CONTA_CORRENTE',strtoint(trim(FEGFParam.ME2ContaCorrente.Text)))
    else
      DMEGF.QREGFMes.SetVariable('COD_CONTA_CORRENTE',null);

    if trim(FEGFParam.ME2Banco.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('COD_BANCO_AGENCIA',strtoint(trim(FEGFParam.ME2Banco.Text)))
    else
      DMEGF.QREGFMes.SetVariable('COD_BANCO_AGENCIA',null);

    if trim(FEGFParam.ME2DtCreditoInicio.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('DT_CREDITO_INI',strtodate(trim(FEGFParam.ME2DtCreditoInicio.Text)))
    else
      DMEGF.QREGFMes.SetVariable('DT_CREDITO_INI',null);

    if trim(FEGFParam.ME2DtCreditoFim.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('DT_CREDITO_FIM',strtodate(trim(FEGFParam.ME2DtCreditoFim.Text)))
    else
      DMEGF.QREGFMes.SetVariable('DT_CREDITO_FIM',null);

    if trim(FEGFParam.ME2DtVencimentoInicio.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('DT_VENCIMENTO_INI',strtodate(trim(FEGFParam.ME2DtVencimentoInicio.Text)))
    else
      DMEGF.QREGFMes.SetVariable('DT_VENCIMENTO_INI',null);

    if trim(FEGFParam.ME2DtVencimentoFim.Text) <> '' then
      DMEGF.QREGFMes.SetVariable('DT_VENCIMENTO_FIM',strtodate(trim(FEGFParam.ME2DtVencimentoFim.Text)))
    else
      DMEGF.QREGFMes.SetVariable('DT_VENCIMENTO_FIM',null);

    if FEGFParam.RG2Baixados.ItemIndex = 0 then
      DMEGF.QREGFMes.SetVariable('IND_BAIXADO',null);
    if FEGFParam.RG2Baixados.ItemIndex = 1 then
      DMEGF.QREGFMes.SetVariable('IND_BAIXADO','SIM');
    if FEGFParam.RG2Baixados.ItemIndex = 2 then
      DMEGF.QREGFMes.SetVariable('IND_BAIXADO','NAO');

    DMEGF.QREGFMes.open;

    if FREGFMensal = nil then
      FREGFMensal := TFREGFMensal.create(application);

    If FEGFParam.RGPreview.ItemIndex = 0 then
      FREGFMensal.QRPrimario.Preview
    else
      FREGFMensal.QRPrimario.Print;

    DMEGF.QREGFMes.Close;
  end;

end;

procedure TFEGFCad.SBHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMEGF.QEGFCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

procedure TFEGFCad.BaixadoPenhor1Click(Sender: TObject);
begin
  inherited;
  if DMEGF.QEGF.Eof then
    raise Exception.Create('Não tem nenhum EGF aberto.');

  if not DMEGF.QEGFDT_BAIXA_PENHOR.IsNull then
    raise Exception.Create('Esse EGF já foi baixado no penhor.');

  DMEGF.QEGF.Edit;
  DMEGF.QEGFDT_BAIXA_PENHOR.Value := date;

  if FEGFBaixaPenhor = nil then
    FEGFBaixaPenhor := TFEGFBaixaPenhor.create(application);

  if FEGFBaixaPenhor.ShowModal = mrok then
  begin
    DMEGF.QEGF.Post;
  end
  else
  begin
    DMEGF.QEGF.cancel;
  end;
end;

procedure TFEGFCad.VoltarBaixadoPenhor1Click(Sender: TObject);
begin
  inherited;
  if DMEGF.QEGF.Eof then
    raise Exception.Create('Não tem nenhum EGF aberto.');

  if DMEGF.QEGFDT_BAIXA_PENHOR.IsNull then
    raise Exception.Create('O Penhor desse EGF não está baixado.');

  if MessageDlg('Deseja Realmente voltar a baixa do Penhor desse EGF?',mtConfirmation,[mbyes,mbNo],0) = mrYes then
  begin
    DMEGF.QEGF.Edit;
    DMEGF.QEGFDT_BAIXA_PENHOR.Text := '';
    DMEGF.QEGFVAL_BAIXA_PENHOR.Text := '';

    DMEGF.QEGF.Post;
  end;
end;

procedure TFEGFCad.SBDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
    DMEGF.QEGFCOD_DEPARTAMENTO.Value := dmdepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;

end;

procedure TFEGFCad.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  if DSEGFLiq.State in [dsEdit, dsInsert] then
    if DMEGF.QEGFLiqVAL_MOVIMENTO.Text <> '' then
      if DMEGF.QEGFLiqDT_MOVIMENTO.Text <> '' then
        if DMEGF.QEGFLiqVAL_JURO.Text = '' then
          DMEGF.QEGFLiqVAL_JURO.Value := DMEGF.QEGFLiqVAL_MOVIMENTO.Value - 
            (100 - ((DMEGF.QEGFLiqDT_MOVIMENTO.Value - DMEGF.QEGFDT_CREDITO.Value)*DMEGF.QEGFPERC_JUROS_AA.Value/365))/100 * DMEGF.QEGFLiqVAL_MOVIMENTO.Value;

end;               

procedure TFEGFCad.DSEGFLiqStateChange(Sender: TObject);
begin
  inherited;
  if DSEGFLiq.State in [dsEdit, dsInsert] then
    SBHistoricoLiq.Enabled := true
  else
    SBHistoricoLiq.Enabled := false;
end;

procedure TFEGFCad.SBHistoricoLiqClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = nil then
    FHistoricoCons := TFHistoricoCons.create(application);

  if FHistoricoCons.showmodal = mrok then
    DMEGF.QEGFLiqCOD_HISTORICO.Value :=
      DMHistorico.QHistoricoConsCOD_HISTORICO.Value;
end;

end.
