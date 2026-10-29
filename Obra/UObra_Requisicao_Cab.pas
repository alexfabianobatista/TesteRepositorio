unit UObra_Requisicao_Cab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleData, OraTeste, DBDirceu,
  OracleNavigator, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFObra_Requisicao_Cab = class(TFTCadSimples)
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
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BtCadastro: TSpeedButton;
    BtObra: TSpeedButton;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    BtFilial: TSpeedButton;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    Label10: TLabel;
    DBEdit13: TDBEdit;
    Label11: TLabel;
    DBEdit14: TDBEdit;
    Label12: TLabel;
    DBEdit15: TDBEdit;
    Label13: TLabel;
    DBEdit17: TDBEdit;
    BtProduto: TSpeedButton;
    Label14: TLabel;
    DBEdit18: TDBEdit;
    DBGrid1: TDBGrid;
    Opo1: TMenuItem;
    Confirmar2: TMenuItem;
    Cancelar2: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    LblSituacao: TLabel;
    DBEdit19: TDBEdit;
    Copia1: TMenuItem;
    Label15: TLabel;
    DBEdit20: TDBEdit;
    DespesasObra1: TMenuItem;
    DBEdit16: TDBEdit;
    DSSecundario: TDataSource;
    Label16: TLabel;
    DBEdit21: TDBEdit;
    Label17: TLabel;
    DBEdit22: TDBEdit;
    Label18: TLabel;
    DBEdit23: TDBEdit;
    BtOperacao: TSpeedButton;
    BtCentroCusto: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    ObraRequisioCentroCusto1: TMenuItem;
    Label19: TLabel;
    DBEdit26: TDBEdit;
    Label20: TLabel;
    DBEdit27: TDBEdit;
    Label21: TLabel;
    DBEdit28: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    Label22: TLabel;
    DBEdit8: TDBEdit;
    Label23: TLabel;
    DBEdit9: TDBEdit;
    BtObraItens: TSpeedButton;
    BtCentroCustoItens: TSpeedButton;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    DBEdit11: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit29: TDBEdit;
    Label27: TLabel;
    DBEdit30: TDBEdit;
    Label28: TLabel;
    DBEdit31: TDBEdit;
    Label29: TLabel;
    DBNavigator1: TOracleNavigator;
    Label30: TLabel;
    DBEdit32: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    PosicaoFinanceira1: TMenuItem;
    Label31: TLabel;
    DBEdit33: TDBEdit;
    BtConsLote: TBitBtn;
    DBDirceu8: TDBDirceu;
    RelatrioCustoEstoque1: TMenuItem;
    procedure BtCadastroClick(Sender: TObject);
    procedure BtObraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure DsSecundarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Confirmar2Click(Sender: TObject);
    procedure Cancelar2Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure DBEdit19Change(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure Copia1Click(Sender: TObject);
    procedure DespesasObra1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit18KeyPress(Sender: TObject; var Key: Char);
    procedure BtOperacaoClick(Sender: TObject);
    procedure BtCentroCustoClick(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure ObraRequisioCentroCusto1Click(Sender: TObject);
    procedure DBEdit21Change(Sender: TObject);
    procedure BtObraItensClick(Sender: TObject);
    procedure BtCentroCustoItensClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure PosicaoFinanceira1Click(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure RelatrioCustoEstoque1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure DBEdit14Enter(Sender: TObject);
  private
    { Private declarations }
  public

  { Public declarations }
  end;

var
  FObra_Requisicao_Cab: TFObra_Requisicao_Cab;
  wObra : string;

implementation

uses UObra_cl, UCadastroCons, UObraCons, UCadastro_cl, UFilialCons,
  UFilial_cl, UProdutoCons, UProduto_cl, UOracle_cl, UObra_Requisicao_Cons,
  UObra_Req_Conf, UParamSistema_cl, UObra_Requisicao_Canc,URequisicaoImpressao,
  UObra_Param, UObra_Rel_cl, UrObra_Desp_Analitico, UrObra_Desp_Sintetico,
  UCentroCustoCons, UCentroCusto_cl, UOperacaoCons, UOperacao_cl,
  UPlanilha_cl, UEstoque_cl, URObraReqCentroCusto, UrFinanceiroObra,
  URRequisicaoImpressao, UTipoLote_cl, UTipoLoteCons, UrObraCustoEstoque, ubiblioteca;

{$R *.DFM}

procedure TFObra_Requisicao_Cab.BtCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk Then
    DMObra.QObra_Req_CabCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFObra_Requisicao_Cab.BtObraClick(Sender: TObject);
begin
  inherited;
  If FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  If FObraCons.ShowModal=mrOk Then
    DMObra.QObra_Req_CabCod_Obra.Value:=DMObra.QObra_ConsCod_Obra.Value;

end;

procedure TFObra_Requisicao_Cab.FormActivate(Sender: TObject);
begin
  inherited;
  DMObra.QObra_Req_Cab.Open;
  DMObra.QObra_Req_Item.Open;
end;

procedure TFObra_Requisicao_Cab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMObra.QObra_Req_Cab.Close;
  DMObra.QObra_Req_Item.Close;
end;

procedure TFObra_Requisicao_Cab.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert,Dsedit] then
    Begin
      BtObra.Enabled:=True;
      BtCadastro.Enabled:=True;
      BtFilial.Enabled:=True;
      BtOperacao.Enabled:=True;
      BtCentroCusto.Enabled:=True;
    End
  Else
    Begin
      BtObra.Enabled:=False;
      BtCadastro.Enabled:=False;
      BtFilial.Enabled:=False;
      BtOperacao.Enabled:=False;
      BtCentroCusto.Enabled:=False;
    End;
  If DMObra.QObra_Req_CabInd_Situacao.Value = '1' Then
     LblSituacao.Caption := 'DIGITADA';
  If DMObra.QObra_Req_CabInd_Situacao.Value = '2' Then
     LblSituacao.Caption := 'CONFIRMADA';
  If DMObra.QObra_Req_CabInd_Situacao.Value = '3' Then
     LblSituacao.Caption := 'CANCELADA';
end;

procedure TFObra_Requisicao_Cab.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons  = Nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = MrOk Then
    DMObra.QObra_Req_CabCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
End;
procedure TFObra_Requisicao_Cab.BtProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons  = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = MrOk Then
    DMObra.QObra_Req_ItemCod_Produto.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);
  If DMParamSistema.CodEmpresa = 'CONKRETA' Then
    DBEdit14Exit(self);
end;

procedure TFObra_Requisicao_Cab.DsSecundarioStateChange(Sender: TObject);
begin
  inherited;
  BtProduto.Enabled:=DSSecundario.State in [Dsinsert,Dsedit];
  BtObraItens.Enabled:=DSSecundario.State in [Dsinsert,Dsedit];
  BtCentroCustoItens.Enabled:=DSSecundario.State in [Dsinsert,Dsedit];
  BtConsLote.Enabled := DSSecundario.State in [Dsinsert,Dsedit];

end;

procedure TFObra_Requisicao_Cab.SBConfirmarClick(Sender: TObject);
begin
  Try
    inherited;
    DMOracle.DBCemapa.Commit;
  Except
    Raise;
  End;
  FObra_Requisicao_Cab.Confirmar2Click(Self);
end;

procedure TFObra_Requisicao_Cab.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FObra_Requisicao_Cons = Nil then
    FObra_Requisicao_Cons := TFObra_Requisicao_Cons.Create(Application);
  If FObra_Requisicao_Cons.ShowModal = mrOk then
  With DMObra do
  Begin
    QObra_Req_Cab.Close;
    QObra_Req_Cab.SetVariable('PK',QObra_Req_ConsCod_Obra_Req_Cab.Value);
    QObra_Req_Cab.Open;
  End;
end;

procedure TFObra_Requisicao_Cab.Confirmar2Click(Sender: TObject);
begin
  inherited;
  If FObra_Req_Conf = Nil then
    FObra_Req_Conf := TFObra_Req_Conf.Create(Application);
  FObra_Req_Conf.ShowModal;
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'RAZENTE' Then
    If MessageDlg('Deseja Imprimir a Requisição',MtConfirmation, [mbYes, mbNo], 0) = MrYes then
      FObra_Requisicao_Cab.Copia1Click(Sender);
//       FRequisicaoImpressao.EmiteREQ(DMObra.QObra_Req_CabCod_Obra_Req_Cab.Value);
end;

procedure TFObra_Requisicao_Cab.Cancelar2Click(Sender: TObject);
begin
  inherited;
  If DMObra.QObra_Req_CabInd_Situacao.Value = '2' Then
     Raise Exception.Create('Não é possivel cancelar uma Requisição confirmada!');
  If DMObra.QObra_Req_CabInd_Situacao.Value = '3' Then
     Raise Exception.Create('Esta Requisição já está cancelada!');
  If FObra_Requisicao_Canc = Nil then
     FObra_Requisicao_Canc := TFObra_Requisicao_Canc.Create(Application);
  FObra_Requisicao_Canc.ShowModal;
  SBRefreshClick(Self);
end;

procedure TFObra_Requisicao_Cab.VoltarConfirmao1Click(Sender: TObject);
Var wComando : String;
    wQt_Atu_Estoque,wQuant : Real;
    wObra_Contrato,wObra_contrato_Produto : String;
begin
  inherited;
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMObra.QObra_Req_CabDt_Emissao.Value Then
     ShowMessage('Não é Permitido Voltar Confirmação - Fechamento Contabil')
  else
   Begin
     Try
        If DMObra.QObra_Req_CabInd_Situacao.Value <> '2' Then
           raise Exception.Create('Esta nota não foi confirmada!');
        DMOracle.DBCemapa.StartTransaction;
        With DMOracle do
        Begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_OBRA_REQ_CAB SET IND_SITUACAO='+Chr(39) + '1' + chr(39);
          wComando := wComando + ' WHERE COD_OBRA_REQ_CAB = '+DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Text;
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
        End;
        // 3.Voltar Conta Pagar
        DMObra.QContasPagar_Cab.Close;
        DMObra.QContasPagar_Cab.Open;
        DMObra.QContasPagar_Mov.Close;
        DMObra.QContasPagar_Mov.Open;
        While not DMObra.QContasPagar_Cab.Eof do
        Begin
          If DMObra.QContasPagar_MovInd_Tipo_Movimento.Value <> '' Then
          Begin
            If (DMObra.QContasPagar_MovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
              Raise Exception.Create('Conta a Pagar com baixas!')
            Else
              DMObra.QContasPagar_Mov.Delete;
          End;
          DMObra.QContasPagar_Cab.Delete;
        End;
        DMObra.QContasPagar_Cab.Close;
        DMObra.QContasPagar_Mov.Close;
        // 8.Descontabilizar
        DMPlanilha.DesContabiliza(DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value,'OBRA');
        // 8.VOLTA ESTOQUE
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('PK',DMObra.QObra_Req_CabCod_Operacao.Value);
        DMOperacao.QOperacao.Open;
        DMObra.QObra_Req_Item.First;
        While Not DMObra.QObra_Req_Item.Eof Do
        Begin    //Na volta da confirmação estava dizendo que o produto do tipo serviço não pode ficar negativo. Pedido Marlise RA-Eletro. Junior.12/02/2015.
            If DMOperacao.QOperacaoInd_Estoque.Value = 'S' Then
             Begin
               if DMOracle.FastSelect('IND_TIPO_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + DMObra.QObra_Req_ItemCOD_PRODUTO.Text) <> 'SERVIÇO' then
               begin
                 If DMOperacao.QOperacaoInd_Tipo_Operacao.Value = 'S' Then
                   wQt_Atu_Estoque := DMObra.QObra_Req_ItemQt_Quantidade.Value
                 else
                   wQt_Atu_Estoque := DMObra.QObra_Req_ItemQt_Quantidade.Value * -1;
                 DMEstoque.Atualiza_Estoque(DMObra.QObra_Req_CabCod_Operacao.Value,DMObra.QObra_Req_CabCod_Filial.Value,
                                          DMObra.QObra_Req_ItemCod_Produto.Value,DMObra.QObra_Req_ItemCOD_LOTE_TIPO.Value,wQt_Atu_Estoque,
                                          0,DMObra.QObra_Req_CabDt_Emissao.Value,DMObra.QObra_Req_CabDt_Emissao.Value);
               end;
             End;
            // volta a quantidade utilizada no contrato - cesar 07/01/2016
            wObra_Contrato:=DMOracle.BuscaNome('SELECT COD_OBRA_CONTRATO FROM TB_OBRA_CONTRATO','COD_OBRA = '+DMObra.QObra_Req_ItemCod_Obra.Text);
            If wObra_Contrato <> '' Then
            Begin
              wObra_contrato_Produto :=DMOracle.BuscaNome('SELECT COD_OBRA_CONTRATO_PRODUTO FROM TB_OBRA_CONTRATO_PRODUTO','COD_OBRA_CONTRATO = '+wObra_Contrato +
                  ' And COD_PRODUTO='+DMObra.QObra_Req_ItemCod_Produto.Text);
              if wObra_contrato_Produto <> '' then
              begin
                wQuant :=StrToFloat(DMOracle.BuscaNome('SELECT nvl(QT_MOVIMENTO,0) FROM TB_OBRA_CONTRATO_PRODUTO','COD_OBRA_CONTRATO_PRODUTO = '+wObra_Contrato_Produto));
                wQuant := wQuant - DMObra.QObra_Req_ItemQt_Quantidade.Value;
                With DMOracle do
                Begin
                  QExecSQL.Close;
                  QExecSQL.SQL.Clear;
                  wComando := 'UPDATE TB_OBRA_CONTRATO_PRODUTO CAB SET QT_MOVIMENTO='+ Bib.TrocaVirgulaPorPonto(FloatToStr(wQuant));
                  wComando := wComando + ' WHERE COD_OBRA_CONTRATO_PRODUTO = '+wObra_Contrato_Produto;
                  QExecSQL.SQL.Add(wComando);
                  QExecSQL.ExecSQL;
                  QExecSQL.Close;
                End;
              end;
            end;
            DMObra.QObra_Req_Item.Next;
       End;

       DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Volta Confirmacao' );
       DMOracle.DBCemapa.Commit;
       DMObra.QObra_Req_Cab.Close;
       DMObra.QObra_Req_Cab.Open;
     Except
       DMOracle.DBCemapa.RollBack;
       Raise;
     End;
   End;
end;

procedure TFObra_Requisicao_Cab.DBEdit19Change(Sender: TObject);
begin
  inherited;
  With DmObra Do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QObra_Req_CabInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QObra_Req_CabInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QObra_Req_CabInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QObra_Req_CabInd_Situacao.Value = '3';
  End;
end;

procedure TFObra_Requisicao_Cab.VoltarCancelamento1Click(Sender: TObject);
Var wComando : String;
begin
  inherited;
  Try
    If DMObra.QObra_Req_CabInd_Situacao.Value <> '3' Then
       raise Exception.Create('Esta Requisição não foi Cancelada!');
    DMOracle.DBCemapa.StartTransaction;
    With DMOracle do
    Begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_OBRA_REQ_CAB SET IND_SITUACAO='+Chr(39) + '1' + chr(39);
      wComando := wComando + ' WHERE COD_OBRA_REQ_CAB = '+DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Text;
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    End;
    DMOracle.DBCemapa.Commit;
    DMObra.QObra_Req_Cab.Close;
    DMObra.QObra_Req_Cab.Open;
  Except
    DMOracle.DBCemapa.RollBack;
    Raise;
  End;
end;

procedure TFObra_Requisicao_Cab.Copia1Click(Sender: TObject);
begin
  inherited;
  //if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RAELETRO') then
//  Begin //Criado o Parametro na Filial para o tipo de impressão da requisição - Junior 12/07/2018.
    DMObra.QObra_Req_Emite.Close;
    DMObra.QObra_Req_Emite.SetVariable('COD_OBRA_REQ_CAB', DMObra.QObra_Req_CabCOD_OBRA_REQ_CAB.Value);
    DMObra.QObra_Req_Emite.Open;
    if DMObra.QObra_Req_EmiteIND_SITUACAO.Value <> '2' then
      raise Exception.Create('Esta Requisição não foi confirmada!');
    if DMObra.QObra_Req_EmiteIND_IMPRIME_REQ_OBRA.Value = 'RELATORIO' then
    begin
      FRRequisicaoImpressao := nil;
      if FRRequisicaoImpressao = nil then
      begin
        FRRequisicaoImpressao := TFRRequisicaoImpressao.Create(Application);
        FRRequisicaoImpressao.QRLTitulo.Caption := 'REQUISICAO';
        FRRequisicaoImpressao.QRPrimario.Preview;
      end;
    //DMObra.QObra_Req_Emite.Close;
    end
    else
      FRequisicaoImpressao.EmiteREQ(DMObra.QObra_Req_CabCod_Obra_Req_Cab.Value);
end;

procedure TFObra_Requisicao_Cab.DespesasObra1Click(Sender: TObject);
begin
  inherited;
  if FObra_Param = Nil then
     FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[1].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMObra_Rel do
  begin
    If FObra_Param.Rg1TipoRelatorio.ItemIndex = 0 Then
    Begin
      QRobra_Desp_Analitico.Close;
      if Trim(FObra_Param.ME1Filial.Text) = '' then
        QRobra_Desp_Analitico.SetVariable('COD_FILIAL',Null)
      else
        QRobra_Desp_Analitico.SetVariable('COD_FILIAL',StrToInt(Trim(FObra_Param.Me1Filial.Text)));
      if Trim(FObra_Param.Me1Obra.Text) = '' then
        QRobra_Desp_Analitico.SetVariable('COD_OBRA',Null)
      else
        QRobra_Desp_Analitico.SetVariable('COD_OBRA',StrToInt(Trim(FObra_Param.Me1Obra.Text)));
      If DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE' Then // cadastro e produto foi mudado para OR a pedido Carlos - Cesar 01/07/16
       Begin
         QRobra_Desp_Analitico.SetVariable('COD_PRODUTO','1=1');
         QRobra_Desp_Analitico.SetVariable('COD_CADASTRO','1=1');
         if (Trim(FObra_Param.Me1Cadastro.Text) <> '') And (Trim(FObra_Param.Me1Produto.Text) <> '') then
            QRobra_Desp_Analitico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_ITEM.COD_PRODUTO IN (' + Trim(FObra_Param.Me1Produto.Text)+') OR (TB_OBRA_REQ_CAB.COD_CADASTRO IN (' + Trim(FObra_Param.Me1Cadastro.Text)+'))')
         Else
            if Trim(FObra_Param.Me1Produto.Text) <> '' then // esta certo usar o cod_cadastro nao mexer - César
               QRobra_Desp_Analitico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_ITEM.COD_PRODUTO IN (' + Trim(FObra_Param.Me1Produto.Text)+')')
            Else
              if Trim(FObra_Param.Me1Cadastro.Text) <> '' then
                 QRobra_Desp_Analitico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_CAB.COD_CADASTRO IN (' + Trim(FObra_Param.Me1Cadastro.Text)+')');
       end
      else
      Begin
        if Trim(FObra_Param.Me1Cadastro.Text) = '' then
          QRobra_Desp_Analitico.SetVariable('COD_CADASTRO','1=1')
        else
          QRobra_Desp_Analitico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_CAB.COD_CADASTRO IN (' + Trim(FObra_Param.Me1Cadastro.Text)+')');
        if Trim(FObra_Param.Me1Produto.Text) = '' then
          QRobra_Desp_Analitico.SetVariable('COD_PRODUTO','1=1')
        else
          QRobra_Desp_Analitico.SetVariable('COD_PRODUTO','TB_OBRA_REQ_ITEM.COD_PRODUTO IN (' + Trim(FObra_Param.Me1Produto.Text)+')');
      End;
      if Trim(FObra_Param.ME1Operacao.Text) = '' then //várias operações - Lani(SR). Junior 09/09/2017
        QRobra_Desp_Analitico.SetVariable('COD_OPERACAO','1=1')
      else
        QRobra_Desp_Analitico.SetVariable('COD_OPERACAO','TB_OBRA_REQ_CAB.COD_OPERACAO IN (' + Trim(FObra_Param.ME1Operacao.Text)+')');
      if Trim(FObra_Param.Me1DtInicio.Text) <> '' then
        QRobra_Desp_Analitico.SetVariable('DT_INICIO',StrToDate(FObra_Param.Me1DtInicio.Text))
      else
        QRobra_Desp_Analitico.SetVariable('DT_INICIO',Null);
      if Trim(FObra_Param.Me1DtFinal.Text) <> '' then
        QRobra_Desp_Analitico.SetVariable('DT_FIM',StrToDate(FObra_Param.Me1DtFinal.Text))
      else
        QRobra_Desp_Analitico.SetVariable('DT_FIM',Null);

      if Trim(FObra_Param.Me1Competencia.Text) <> '/' then
        QRobra_Desp_Analitico.SetVariable('COMPETENCIA',(FObra_Param.Me1Competencia.Text))
      else
        QRobra_Desp_Analitico.SetVariable('COMPETENCIA',Null);
      case FObra_Param.Rg1TipoPagamento.ItemIndex of
        0: QRobra_Desp_Analitico.SetVariable('IND_CONDICAO_PAGTO','1');
        1: QRobra_Desp_Analitico.SetVariable('IND_CONDICAO_PAGTO','2');
        2: QRobra_Desp_Analitico.SetVariable('IND_CONDICAO_PAGTO',Null);
      End;
      QRobra_Desp_Analitico.SQL.Strings[QRobra_Desp_Analitico.SQL.Count - 1] := '';
      case FObra_Param.Rg1Ordem.ItemIndex of
        0: QRobra_Desp_Analitico.SQL.Add('ORDER BY COD_OBRA,DESC_PRODUTO');
        1: QRobra_Desp_Analitico.SQL.Add('ORDER BY COD_OBRA,COD_PRODUTO');
        2: QRobra_Desp_Analitico.SQL.Add('ORDER BY COD_OBRA,DT_EMISSAO');
      End;
      QRobra_Desp_Analitico.Open;
      if FrObra_Desp_Analitico = Nil then
        FrObra_Desp_Analitico := TFrObra_Desp_Analitico.Create(Application);
      FrObra_Desp_Analitico.QRLTitulo.Caption := 'Relacao Despesas Com Evento de '+FObra_Param.Me1DtInicio.Text+ ' Ate '+FObra_Param.Me1DtFinal.Text;
      FrObra_Desp_Analitico.QRLCompetencia.Caption := 'Competência : '+FObra_Param.Me1Competencia.Text;
      if FObra_Param.RGPreview.ItemIndex = 0 then
         FrObra_Desp_Analitico.QRPrimario.Preview
      else
        FrObra_Desp_Analitico.QRPrimario.Print;
      QRobra_Desp_Analitico.Close;
    End
   Else
    Begin
      QrObra_Desp_Sintetico.Close;
      if Trim(FObra_Param.ME1Filial.Text) = '' then
        QrObra_Desp_Sintetico.SetVariable('COD_FILIAL',Null)
      else
        QrObra_Desp_Sintetico.SetVariable('COD_FILIAL',StrToInt(Trim(FObra_Param.Me1Filial.Text)));
      if Trim(FObra_Param.Me1Obra.Text) = '' then
        QrObra_Desp_Sintetico.SetVariable('COD_OBRA',Null)
      else
        QrObra_Desp_Sintetico.SetVariable('COD_OBRA',StrToInt(Trim(FObra_Param.Me1Obra.Text)));
      If DmParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE' Then // cadastro e produto foi mudado para OR a pedido Carlos - Cesar 01/07/16
       Begin
         QrObra_Desp_Sintetico.SetVariable('COD_PRODUTO','1=1');
         QrObra_Desp_Sintetico.SetVariable('COD_CADASTRO','1=1');
         if (Trim(FObra_Param.Me1Cadastro.Text) <> '') And (Trim(FObra_Param.Me1Produto.Text) <> '') then
            QrObra_Desp_Sintetico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_ITEM.COD_PRODUTO IN (' + Trim(FObra_Param.Me1Produto.Text)+') OR (TB_OBRA_REQ_CAB.COD_CADASTRO IN (' + Trim(FObra_Param.Me1Cadastro.Text)+'))')
         Else
            if Trim(FObra_Param.Me1Produto.Text) <> '' then // esta certo usar o cod_cadastro nao mexer - César
               QrObra_Desp_Sintetico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_ITEM.COD_PRODUTO IN (' + Trim(FObra_Param.Me1Produto.Text)+')')
            Else
              if Trim(FObra_Param.Me1Cadastro.Text) <> '' then
                 QrObra_Desp_Sintetico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_CAB.COD_CADASTRO IN (' + Trim(FObra_Param.Me1Cadastro.Text)+')');
       end
      else
      Begin
        if Trim(FObra_Param.Me1Cadastro.Text) = '' then
          QrObra_Desp_Sintetico.SetVariable('COD_CADASTRO','1=1')
        else
          QrObra_Desp_Sintetico.SetVariable('COD_CADASTRO','TB_OBRA_REQ_CAB.COD_CADASTRO IN (' + Trim(FObra_Param.Me1Cadastro.Text)+')');
        if Trim(FObra_Param.Me1Produto.Text) = '' then
          QrObra_Desp_Sintetico.SetVariable('COD_PRODUTO','1=1')
        else
          QrObra_Desp_Sintetico.SetVariable('COD_PRODUTO','TB_OBRA_REQ_ITEM.COD_PRODUTO IN (' + Trim(FObra_Param.Me1Produto.Text)+')');
      End;
      if Trim(FObra_Param.ME1Operacao.Text) = '' then //várias operações - Lani(SR). Junior 09/09/2017
        QrObra_Desp_Sintetico.SetVariable('COD_OPERACAO','1=1')
      else
        QrObra_Desp_Sintetico.SetVariable('COD_OPERACAO','TB_OBRA_REQ_CAB.COD_OPERACAO IN (' + Trim(FObra_Param.ME1Operacao.Text)+')');
      if Trim(FObra_Param.Me1DtInicio.Text) <> '' then

        QrObra_Desp_Sintetico.SetVariable('DT_INICIO',StrToDate(FObra_Param.Me1DtInicio.Text))
      else
        QrObra_Desp_Sintetico.SetVariable('DT_INICIO',Null);
      if Trim(FObra_Param.Me1DtFinal.Text) <> '' then
        QrObra_Desp_Sintetico.SetVariable('DT_FIM',StrToDate(FObra_Param.Me1DtFinal.Text))
      else
        QrObra_Desp_Sintetico.SetVariable('DT_FIM',Null);
      if Trim(FObra_Param.Me1Competencia.Text) <> '/' then
        QrObra_Desp_Sintetico.SetVariable('COMPETENCIA',(FObra_Param.Me1Competencia.Text))
      else
        QrObra_Desp_Sintetico.SetVariable('COMPETENCIA',Null);
      case FObra_Param.Rg1TipoPagamento.ItemIndex of
        0: QrObra_Desp_Sintetico.SetVariable('IND_CONDICAO_PAGTO','1');
        1: QrObra_Desp_Sintetico.SetVariable('IND_CONDICAO_PAGTO','2');
        2: QrObra_Desp_Sintetico.SetVariable('IND_CONDICAO_PAGTO',Null);
      End;
      QrObra_Desp_Sintetico.SQL.Strings[QrObra_Desp_Sintetico.SQL.Count - 1] := '';
      case FObra_Param.Rg1Ordem.ItemIndex of
        0: QrObra_Desp_Sintetico.SQL.Add('ORDER BY COD_OBRA,DESC_PRODUTO');
        1: QrObra_Desp_Sintetico.SQL.Add('ORDER BY COD_OBRA,COD_PRODUTO');
      End;
      QrObra_Desp_Sintetico.Open;
      if FrObra_Desp_Sintetico = Nil then
        FrObra_Desp_Sintetico := TFrObra_Desp_Sintetico.Create(Application);
      FrObra_Desp_Sintetico.QRLTitulo.Caption := 'Relacao Despesas Com Evento de '+FObra_Param.Me1DtInicio.Text+ ' Ate '+FObra_Param.Me1DtFinal.Text;
      FrObra_Desp_Sintetico.QRLCompetencia.Caption := 'Competência : '+FObra_Param.Me1Competencia.Text;
      if FObra_Param.RGPreview.ItemIndex = 0 then
         FrObra_Desp_Sintetico.QRPrimario.Preview
      else
        FrObra_Desp_Sintetico.QRPrimario.Print;
      QrObra_Desp_Sintetico.Close;
    End;
  end;
end;

procedure TFObra_Requisicao_Cab.SBExcluirClick(Sender: TObject);
begin
//  inherited;
  If MessageDlg('Apagar esta requisição?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
    try
      if DMObra.QObra_Req_CabInd_Situacao.Value <> '1' Then
         raise Exception.Create('Somente requisições digitadas podem ser excluidas!');
      DMObra.QObra_Req_Item.First;
      while not DMObra.QObra_Req_Item.Eof do
        DMObra.QObra_Req_Item.Delete;
      DMObra.QObra_Req_Cab.Delete;
    except
      raise;
    end;
   End;
end;

procedure TFObra_Requisicao_Cab.DBEdit16KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = Chr(43) Then
  Begin
      DbNavigator1.BtnClick(NbInsert);
      Key := #0;
      DbEdit14.SetFocus;
  End;
end;

procedure TFObra_Requisicao_Cab.DBEdit18KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = Chr(43) Then
  Begin
      DbNavigator1.BtnClick(NbInsert);
      Key := #0;
      DbEdit14.SetFocus;
  End;
end;

procedure TFObra_Requisicao_Cab.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons  = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal=mrOk Then
    DMObra.QObra_Req_CabCod_Operacao.Value:=DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFObra_Requisicao_Cab.BtCentroCustoClick(Sender: TObject);
begin
  inherited;
  If FCentroCustoCons  = Nil then
     FCentroCustoCons := TFCentroCustoCons.Create(Application);
  If FCentroCustoCons.ShowModal=mrOk Then
    DMObra.QObra_Req_CabCod_Centro_Custo.Value:=DMCentroCusto.QCentroCustoConsCod_Centro_Custo.Value;

end;

procedure TFObra_Requisicao_Cab.DBEdit14Exit(Sender: TObject);
Var wCusto, wContrato : String;
begin
  inherited;

  If Trim(DBEdit14.Text) <> '' Then
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONKRETA' then
    Begin
      if Trim(DBEdit8.Text) <> '' then
      Begin
        wObra := DBEdit8.Text;
        wContrato := DMOracle.BuscaNome('SELECT COD_OBRA_CONTRATO FROM TB_OBRA_CONTRATO','COD_OBRA=' + Trim(DBedit8.Text));
        if DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_OBRA_CONTRATO_PRODUTO',
                            'COD_OBRA_CONTRATO ='+wContrato + ' AND COD_PRODUTO ='+ Trim(DBEdit14.Text))+'0' = '0' then
        ShowMessage('Preço do produto não cadastrado no contrato!')
      else
        DMObra.QObra_Req_ItemVal_Unitario.value := StrToFloat(DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_OBRA_CONTRATO_PRODUTO',
                          'COD_OBRA_CONTRATO ='+wContrato + ' AND COD_PRODUTO ='+ Trim(DBEdit14.Text)))+0;

      end
      else
        Raise Exception.Create('Primeiro Informe a Obra!');
    end
    else
    Begin
     DMOperacao.QOperacao.Close;
     DMOperacao.QOperacao.SetVariable('PK',DMObra.QObra_Req_CabCod_Operacao.Value);
     DMOperacao.QOperacao.Open;
     If DMOperacao.QOperacaoInd_Preco.Value = 'C' Then
      Begin
        wCusto:=DMOracle.BuscaNome('SELECT VL_CUSTO_MEDIO FROM TB_ESTOQUE',
          'COD_PRODUTO='+Trim(DBEdit14.Text) + ' AND COD_FILIAL =' +Trim(DBEdit10.Text) + ' AND COD_LOTE_TIPO = 1' );
        If wCusto <> '' Then
           DMObra.QObra_Req_ItemVal_Unitario.value := StrToFloat(wCusto);
      End
     Else
      Begin
        wCusto:=DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO='+Trim(DBEdit14.Text));
        If wCusto <> '' Then
           DMObra.QObra_Req_ItemVal_Unitario.value := StrToFloat(wCusto);
      End;
     //DBEdit33.Text := '1';
   End;
end;

procedure TFObra_Requisicao_Cab.ObraRequisioCentroCusto1Click(
  Sender: TObject);
begin
  inherited;
  If FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[7].TabVisible := True;
  If FObra_Param.ShowModal = mrOk then
  with DMObra_Rel do
  begin
    QRObraReqCentroCusto.Close;
    if Trim(FObra_Param.Me8Filial.Text) = '' then
      QRObraReqCentroCusto.SetVariable('FILIAL',Null)
    else
      QRObraReqCentroCusto.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.Me8Filial.Text)));
    if Trim(FObra_Param.ME8CentroCusto.Text) = '' then
      QRObraReqCentroCusto.SetVariable('CENTROCUSTO',Null)
    else
      QRObraReqCentroCusto.SetVariable('CENTROCUSTO',StrToInt(Trim(FObra_Param.ME8CentroCusto.Text)));
    if Trim(FObra_Param.ME8Obra.Text) = '' then
      QRObraReqCentroCusto.SetVariable('OBRA',Null)
    else
      QRObraReqCentroCusto.SetVariable('OBRA',StrToInt(Trim(FObra_Param.ME8Obra.Text)));
    QRObraReqCentroCusto.SetVariable('DT_INICIAL',StrToDate(FObra_Param.Me8DtInicial.Text));
    QRObraReqCentroCusto.SetVariable('DT_FINAL',StrToDate(FObra_Param.Me8DtFinal.Text));
    QRObraReqCentroCusto.Open;
    if FRObraReqCentroCusto = Nil then
      FRObraReqCentroCusto := TFRObraReqCentroCusto.Create(Application);
    FRObraReqCentroCusto.QRLFilial.Caption := 'Filial :'+FObra_Param.Ed8Filial.Text + ' De ' + FObra_Param.Me8DtInicial.Text + ' Ate ' + FObra_Param.Me8DtFinal.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRObraReqCentroCusto.QRPrimario.Preview
    else
      FRObraReqCentroCusto.QRPrimario.Print;
    QRObraReqCentroCusto.Close;
  end;
end;

procedure TFObra_Requisicao_Cab.DBEdit21Change(Sender: TObject);
begin
  inherited;
  If DBEdit21.Text <> '' Then
     DMObra.QObra_Req_CabInd_Tipo_Requisicao.Value := 'NOTA'
  Else
     DMObra.QObra_Req_CabInd_Tipo_Requisicao.Value := 'PROVISORIA';
end;

procedure TFObra_Requisicao_Cab.BtObraItensClick(Sender: TObject);
begin
  inherited;
  If FObraCons  = Nil then
     FObraCons := TFObraCons.Create(Application);
  If FObraCons.ShowModal=mrOk Then
    DMObra.QObra_Req_ItemCod_Obra.Value:=DMObra.QObra_ConsCod_Obra.Value;

end;

procedure TFObra_Requisicao_Cab.BtCentroCustoItensClick(Sender: TObject);
begin
  inherited;
  If FCentroCustoCons  = Nil then
     FCentroCustoCons := TFCentroCustoCons.Create(Application);
  If FCentroCustoCons.ShowModal=mrOk Then
    DMObra.QObra_Req_ItemCod_Centro_Custo.Value:=DMCentroCusto.QCentroCustoConsCod_Centro_Custo.Value;

end;

procedure TFObra_Requisicao_Cab.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMObra.QObra_Req_Cab;

  if DSSecundario.DataSet = nil then
    DSSecundario.DataSet := DMObra.QObra_Req_Item;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE' Then
   Begin
     Label16.Visible := False;
     Label23.Visible := False;
     Label24.Visible := False;
     Label25.Visible := False;
     Label26.Visible := False;
     Label27.Visible := False;
     Label28.Visible := False;
     Label29.Visible := False;
     Label30.Visible := False;
     DbEdit11.Visible := False;
     DbEdit21.Visible := False;
     DbEdit24.Visible := False;
     DbEdit25.Visible := False;
     DbEdit29.Visible := False;
     DbEdit30.Visible := False;
     DbEdit31.Visible := False;
     DbEdit32.Visible := False;
     DbEdit9.Visible := False;
     DbDirceu7.Visible := False;
     BtCentroCustoItens.Visible := False;
     DbRadioGroup1.Visible := False;
     Label22.Caption := 'Obra';
     DBRadioGroup2.Top := 166;
   End;
   If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONKRETA' Then
   Begin
     Label16.Visible := False;
     Label23.Visible := False;
     Label24.Visible := False;
     Label25.Visible := False;
     Label26.Visible := False;
     Label27.Visible := False;
     Label28.Visible := False;
     Label29.Visible := False;
     Label30.Visible := False;
     DbEdit11.Visible := False;
     DbEdit21.Visible := False;
     DbEdit24.Visible := False;
     DbEdit25.Visible := False;
     DbEdit29.Visible := False;
     DbEdit30.Visible := False;
     DbEdit31.Visible := False;
     DbEdit32.Visible := False;
     DbEdit9.Visible := False;
     DbDirceu7.Visible := False;
     BtCentroCustoItens.Visible := False;
     DbRadioGroup1.Visible := False;
     Label22.Caption := 'Obra';
     DBRadioGroup2.Top := 166;

     DBEdit16.ReadOnly := False;
     Label31.Visible := False;
     dbEdit33.Visible := False;
     BtConsLote.Visible := False;
     DBDirceu8.Visible := False;
     Label9.Visible := False;
     Label10.Visible := False;
     DBEdit12.Visible := False;
     DBEdit13.Visible := False;

     Label11.Left := 312;
     Dbedit14.Left := 312;
     DBedit17.Left := 397;
     BtProduto.Left := 372;
     Label22.Top := 279;
     DBedit8.Top := 295;
     BtObraItens.Top := 295;
     DBDirceu6.Top := 295;
     DBEdit8.TabOrder := 15;
     DBEdit14.TabOrder := 16;

   End;
end;

procedure TFObra_Requisicao_Cab.DBEdit3Exit(Sender: TObject);
// Var wCodigo : String;
begin
  inherited;
{  If Trim(DbEdit3.Text) <> '' Then   // esta rotina serve para buscar se o cliente ja possui requisicoes provisorias
   Begin                             // entao ele tem a opcao de trazer para a tela esta requisicao
     wCodigo := DMOracle.BuscaNome('SELECT COD_OBRA_REQ_CAB FROM TB_OBRA_REQ_CAB','COD_CADASTRO = '+Trim(DbEdit3.Text) + ' And IND_TIPO_REQUISICAO = ' + Chr(39) + 'PROVISORIA' + Chr(39));
     If wCodigo <> '' Then
      Begin
        If FObra_Requisicao_Cons = Nil then
          FObra_Requisicao_Cons := TFObra_Requisicao_Cons.Create(Application);
        FObra_Requisicao_Cons.MeCadastro.Text := Trim(DbEdit3.Text);
        FObra_Requisicao_Cons.RgTipoRequisicao.ItemIndex := 0;
        FObra_Requisicao_Cons.BtProcurarClick(Self);
        If FObra_Requisicao_Cons.ShowModal = mrOk then
        With DMObra do
        Begin
          QObra_Req_Cab.Close;
          QObra_Req_Cab.SetVariable('PK',QObra_Req_ConsCod_Obra_Req_Cab.Value);
          QObra_Req_Cab.Open;
        End;
      End;
   End;
}
end;

procedure TFObra_Requisicao_Cab.PosicaoFinanceira1Click(Sender: TObject);
Var wValor, wCrberto, wCrPago, wCpberto, wCpPago, wCrINCC : Real;
begin
  inherited;
   if FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[8].TabVisible := True;
  if FObra_Param.ShowModal = mrOk then
  with DMObra_Rel do
  begin
    QRObraFinanceiro.Close;
    if Trim(FObra_Param.Me9Filial.Text) = '' then
      QRObraFinanceiro.SetVariable('COD_FILIAL',Null)
    else
      QRObraFinanceiro.SetVariable('COD_FILIAL',StrToInt(Trim(FObra_Param.Me9Filial.Text)));
    if Trim(FObra_Param.Me9Obra.Text) = '' then
      QRObraFinanceiro.SetVariable('COD_OBRA',Null)
    else
      QRObraFinanceiro.SetVariable('COD_OBRA',StrToInt(Trim(FObra_Param.Me9Obra.Text)));
    if Trim(FObra_Param.Me9Cadastro.Text) = '' then
      QRObraFinanceiro.SetVariable('COD_CADASTRO',Null)
    else
      QRObraFinanceiro.SetVariable('COD_CADASTRO',StrToInt(Trim(FObra_Param.Me9Cadastro.Text)));
    If Trim(FObra_Param.Me9DtInicial.Text) = '' Then
       QRObraFinanceiro.SetVariable('DT_INICIO',StrToDate('01/01/2000'))
    Else
       QRObraFinanceiro.SetVariable('DT_INICIO',StrToDate(FObra_Param.Me9DtInicial.Text));
    If Trim(FObra_Param.Me9DtFinal.Text) = '' Then
       QRObraFinanceiro.SetVariable('DT_FIM',StrToDate('31/12/2200'))
    Else
       QRObraFinanceiro.SetVariable('DT_FIM',StrToDate(FObra_Param.Me9DtFinal.Text));
    QRObraFinanceiro.Open;
    wValor := 0;
    wCrberto:=0;
    wCrPago := 0;
    wCrINCC := 0;
    While Not QRObraFinanceiro.Eof Do
     Begin
       If QRObraFinanceiroInd_Tipo.Value = 'PRODUTOS' Then
          wValor := wValor + QRObraFinanceiroValor.Value;

       If QRObraFinanceiroInd_Tipo.Value = 'POSIÇÃO FINANCEIRA A RECEBER' Then
       Begin
         wCrberto := wCrberto + QRObraFinanceiroQuant.Value;
         wCrPago := wCrPago + QRObraFinanceiroValor.Value;  // cuidado que neste campo tem o valor INCC TAMBEM - César Angonese 
       End;
       If QRObraFinanceiroInd_Tipo.Value = 'POSIÇÃO FINANCEIRA A RECEBER - INCC' Then
       Begin
         wCrINCC := wCrINCC + QRObraFinanceiroVAL_INCC.Value;
       End;


       If QRObraFinanceiroInd_Tipo.Value = 'POSIÇÃO FINANCEIRA A PAGAR' Then
       Begin
         wCpberto := wCpberto + QRObraFinanceiroQuant.Value;
         wCpPago := wCpPago + QRObraFinanceiroValor.Value;
       End;
       QRObraFinanceiro.Next;
     End;
    QRObraFinanceiro.First;
    if FRFinanceiroObra = Nil then
      FRFinanceiroObra := TFRFinanceiroObra.Create(Application);
//    FRFinanceiroObra.QRLProdutos.Caption := FormatFloat('#,##0.00',wValor);
//    FRFinanceiroObra.QRLSaldoProdutos.Caption := FormatFloat('#,##0.00',QRObraFinanceirovl_contrato.Value - wValor);
    FRFinanceiroObra.QRLReceber.Caption := FormatFloat('#,##0.00',wCrberto+wCrPago);
    FRFinanceiroObra.QRLVlContrato.Caption := FormatFloat('#,##0.00',wCrberto+wCrPago);
    FRFinanceiroObra.QRLCrPago.Caption := FormatFloat('#,##0.00',wCrPago);
    FRFinanceiroObra.QRLRecebido_Res.Caption := FormatFloat('#,##0.00',wCrPago);
    FRFinanceiroObra.QRLCrINCC.Caption := FormatFloat('#,##0.00',wCrINCC);
    FRFinanceiroObra.QRLCrSaldo.Caption := FormatFloat('#,##0.00',wCrberto);

    FRFinanceiroObra.QRLPagar.Caption := FormatFloat('#,##0.00',wCpberto);
    FRFinanceiroObra.QRLCpPago.Caption := FormatFloat('#,##0.00',wCpPago);
    FRFinanceiroObra.QRLCpSaldo.Caption := FormatFloat('#,##0.00',wCpberto+wCpPago);
    FRFinanceiroObra.QRLCustoPagar.Caption := FormatFloat('#,##0.00',QRObraFinanceiroVl_Contrato.Value - wCpPago);
    FRFinanceiroObra.wSaldo := wCpberto+wCpPago;
    FRFinanceiroObra.QRLCpSaldo1.Caption := FormatFloat('#,##0.00',wCpberto+wCpPago);
    FRFinanceiroObra.QRLPagoRes.Caption := FormatFloat('#,##0.00',wCpPago);
//    FRFinanceiroObra.QRLSaldoObra.Caption := FormatFloat('#,##0.00',QRObraFinanceirovl_contrato.Value - wCpberto - wCpPago);
    FRFinanceiroObra.QRLSaldoObra.Caption := FormatFloat('#,##0.00',wCrberto + wCrPago - wCpberto - wCpPago);

    FRFinanceiroObra.QRLSaldoRes.Caption := FormatFloat('#,##0.00',wCrPago - wCpPago);
    If QRObraFinanceirovl_contrato.Value > 0 Then
     Begin
//       FRFinanceiroObra.QRLPorcentagem_Saldo.Caption := FormatFloat('##0.00',((QRObraFinanceirovl_contrato.Value - (wCpberto + wCpPago))  * 100) / QRObraFinanceirovl_contrato.Value)
       If (wCrberto + wCrPago) <> 0 Then
          FRFinanceiroObra.QRLPorcentagem_Saldo.Caption := FormatFloat('##0.00',(wCrberto + wCrPago - wCpberto - wCpPago) / (wCrberto + wCrPago) * 100)
       Else
          FRFinanceiroObra.QRLPorcentagem_Saldo.Caption := ''   
     End     
    Else
       FRFinanceiroObra.QRLPorcentagem_Saldo.Caption := '';
//       FRFinanceiroObra.QrlPercentual.Caption := FormatFloat('##0.00',100 - (wValor / QRObraFinanceirovl_contrato.Value * 100));
    If Trim(FObra_Param.Me9DtInicial.Text) = '' Then
       FRFinanceiroObra.QRLTitulo.Caption := 'Posição Financeira'
    Else
       FRFinanceiroObra.QRLTitulo.Caption := 'Posição Financeira De ' + FObra_Param.Me9DtInicial.Text + ' Até ' + FObra_Param.Me9DtFinal.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FRFinanceiroObra.QRPrimario.Preview
    else
      FRFinanceiroObra.QRPrimario.Print;
    QRObraFinanceiro.Close;
  end;

end;

procedure TFObra_Requisicao_Cab.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DMObra.QObra_Req_ItemCOD_PRODUTO.Value);
  if FTipoLoteCons.ShowModal = mrOk then
  begin
    DMObra.QObra_Req_Item.Edit;
    DMObra.QObra_Req_ItemCOD_LOTE_TIPO.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
  end;
end;

procedure TFObra_Requisicao_Cab.RelatrioCustoEstoque1Click(
  Sender: TObject);
begin
  inherited;
  If FObra_Param = Nil then
    FObra_Param := TFObra_Param.Create(Application);
  FObra_Param.PGRelatorio.Pages[9].TabVisible := True;
  If FObra_Param.ShowModal = mrOk then
  with DMObra_Rel do
  begin
    QrObraCustoEstoque.Close;
    if Trim(FObra_Param.Fm10Filial.MeFilial.Text) = '' then
      QrObraCustoEstoque.SetVariable('FILIAL',Null)
    else
      QrObraCustoEstoque.SetVariable('FILIAL',StrToInt(Trim(FObra_Param.Fm10Filial.MeFilial.Text)));
    if Trim(FObra_Param.Fm10Obra.MEObra.Text) = '' then
      QrObraCustoEstoque.SetVariable('OBRA',Null)
    else
      QrObraCustoEstoque.SetVariable('OBRA',StrToInt(Trim(FObra_Param.Fm10Obra.MEObra.Text)));
    QrObraCustoEstoque.SetVariable('DT_INICIAL',StrToDate(FObra_Param.Fm10Datas.MeDtInicial.Text));
    QrObraCustoEstoque.SetVariable('DT_FINAL',StrToDate(FObra_Param.Fm10Datas.MeDtFinal.Text));
    QrObraCustoEstoque.Open;
    if FrObraCustoEstoque = Nil then
      FrObraCustoEstoque := TFrObraCustoEstoque.Create(Application);
    FrObraCustoEstoque.QRLTitulo.Caption := 'Relatório Obra Custo Pelo Estoque  De ' + FObra_Param.Fm10Datas.MeDtInicial.Text + ' Ate ' + FObra_Param.Fm10Datas.MeDtFinal.Text;
    if FObra_Param.RGPreview.ItemIndex = 0 then
       FrObraCustoEstoque.QRPrimario.Preview
    else
      FrObraCustoEstoque.QRPrimario.Print;
    QrObraCustoEstoque.Close;
  end;

end;

procedure TFObra_Requisicao_Cab.DBNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONKRETA' then
    DBEdit8.SetFocus;
end;

procedure TFObra_Requisicao_Cab.DBEdit14Enter(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit8.Text) = '' then
    DBEdit8.Text := wObra;
end;

end.
