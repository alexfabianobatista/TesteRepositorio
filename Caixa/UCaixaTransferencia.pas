unit UCaixaTransferencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, variants,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;

type
  TFCaixaTransferencia = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    BtFilialCons: TSpeedButton;
    BtFilialRecebe: TSpeedButton;
    BtHistoricoCons: TSpeedButton;
    BtHistoricoEntrada: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DSCaixaTransfItem: TDataSource;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBGrid1: TDBGrid;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    MeDtInicial: TMaskEdit;
    Label16: TLabel;
    MeDtFinal: TMaskEdit;
    Label17: TLabel;
    MeFilial: TMaskEdit;
    BtFilialCaixa: TSpeedButton;
    BitBtn1: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    BtIncluir: TBitBtn;
    BtExcluir: TBitBtn;
    DsCaixaMovCons: TDataSource;
    DsCaixaTransfItem_Cx: TDataSource;
    OracleNavigator1: TOracleNavigator;
    Opes1: TMenuItem;
    Confirma1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    Label18: TLabel;
    DBEdit15: TDBEdit;
    RelatrioTransfernciaNumerrio1: TMenuItem;
    Label19: TLabel;
    BtHistorico: TSpeedButton;
    MeHistorico: TMaskEdit;
    procedure BtFilialConsClick(Sender: TObject);
    procedure BtFilialRecebeClick(Sender: TObject);
    procedure BtHistoricoConsClick(Sender: TObject);
    procedure BtHistoricoEntradaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtFilialCaixaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtIncluirClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure Confirma1Click(Sender: TObject);
    procedure RelatrioTransfernciaNumerrio1Click(Sender: TObject);
    procedure BtHistoricoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaTransferencia: TFCaixaTransferencia;

implementation

uses UCaixa_Transf_cl, UFilialCons, UHistoricoCons, UFilial_cl,
  UHistorico_cl, UCaixaTransferenciaCons, UCaixa_cl, UParamSistema_cl,
  UOracle_cl, UPlanilha_cl, UCaixaTransferencia_Conf, UCaixaParam,
  UrCaixaTransferencia;

{$R *.DFM}

procedure TFCaixaTransferencia.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     DMCaixa_Transf.QCaixaTransfCabCOD_FILIAL_REMETENTE.Value:=DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFCaixaTransferencia.BtFilialRecebeClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     DMCaixa_Transf.QCaixaTransfCabCOD_FILIAL_RECEBE.Value:=DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFCaixaTransferencia.BtHistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=MrOk then
     DMCaixa_Transf.QCaixaTransfCabCOD_HISTORICO_SAIDA.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;
end;

procedure TFCaixaTransferencia.BtHistoricoEntradaClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=MrOk then
     DMCaixa_Transf.QCaixaTransfCabCOD_HISTORICO_ENTRADA.Value:=DMHistorico.QHistoricoConsCod_Historico.Value;

end;

procedure TFCaixaTransferencia.FormActivate(Sender: TObject);
begin
  inherited;
  DMCaixa_Transf.QCaixaTransfCab.Open;
  DMCaixa_Transf.QCaixaTransfItem.Open;
  DMCaixa_Transf.QCaixaTransfItem_Cx.Open;
end;

procedure TFCaixaTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCaixa_Transf.QCaixaTransfCab.Close;
  DMCaixa_Transf.QCaixaTransfItem.Close;
  DMCaixa_Transf.QCaixaTransfItem_Cx.Close;
end;

procedure TFCaixaTransferencia.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtFilialCons.Enabled := DSPrimario.State <> DSbrowse;
  BtHistoricoCons.Enabled := DSPrimario.State <> DSbrowse;
  BtFilialRecebe.Enabled := DSPrimario.State <> DSbrowse;
  BtHistoricoEntrada.Enabled := DSPrimario.State <> DSbrowse;
  MMCadSimples.Items[2].Items[0].Enabled := DMCaixa_Transf.QCaixaTransfCabInd_Situacao.Value = '1';
  MMCadSimples.Items[2].Items[1].Enabled := DMCaixa_Transf.QCaixaTransfCabInd_Situacao.Value = '2';
end;

procedure TFCaixaTransferencia.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCaixaTransferenciaCons = Nil then
    FCaixaTransferenciaCons:=TFCaixaTransferenciaCons.Create(Application);
  If FCaixaTransferenciaCons.ShowModal=mrOk then
    Begin
      DMCaixa_Transf.QCaixaTransfCab.Close;
      DMCaixa_Transf.QCaixaTransfCab.SetVariable('PK',DMCaixa_Transf.QCaixaTransCab_ConsCOD_CAIXA_TRANSF_CAB.Value);
      DMCaixa_Transf.QCaixaTransfCab.Open;
    End;
end;

procedure TFCaixaTransferencia.BtFilialCaixaClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
     MeFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFCaixaTransferencia.BitBtn1Click(Sender: TObject);
begin
  inherited;
    with DMCaixa do
    begin
      QCaixa_Mov_Cons.Close;
      if Trim(MeFilial.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('COD_FILIAL',StrToInt(Trim(MeFilial.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('COD_FILIAL',Null);
      if Trim(MeHistorico.Text) <> '' then
        QCaixa_Mov_Cons.SetVariable('COD_HISTORICO',StrToInt(Trim(MeHistorico.Text)))
      else
        QCaixa_Mov_Cons.SetVariable('COD_HISTORICO',Null);

      if Trim(MeDtInicial.Text) = '' then
         Raise Exception.Create ('Campo Data Inicial Deve Ser Informado');
      QCaixa_Mov_Cons.SetVariable('DT_INICIAL',StrToDate(MeDtInicial.Text));

      if Trim(MeDtFinal.Text) = '' then
         Raise Exception.Create ('Campo Data Final Deve Ser Informado');
      QCaixa_Mov_Cons.SetVariable('DT_FINAL',StrToDate(MeDtFinal.Text));

      QCaixa_Mov_Cons.Open;
    end;

end;

procedure TFCaixaTransferencia.BtIncluirClick(Sender: TObject);
begin
  inherited;

  With DMCaixa_Transf Do
  Begin
    If QCaixaTransfItem_Cx.Locate('COD_CAIXA_MOV',DMCaixa.QCaixa_Mov_ConsCod_Caixa_Mov.Value,[]) Then
       Raise Exception.Create('Lançamento já incluido neste lote');
    QCaixaTransfItem_Cx.Insert;
      QCaixaTransfItem_CxCod_Caixa_Mov.Value := DMCaixa.QCaixa_Mov_ConsCod_Caixa_Mov.Value;
      QCaixaTransfItem_CxDt_Lancamento.Value := DMCaixa.QCaixa_Mov_ConsDt_Movimento.Value;
      QCaixaTransfItem_CxVal_Lancamento.Value := DMCaixa.QCaixa_Mov_ConsVal_Movimento.Value;
      QCaixaTransfItem_CxNum_Documento.Value := DMCaixa.QCaixa_Mov_ConsNum_Documento.Value;
    QCaixaTransfItem_Cx.Post;
  End;
end;

procedure TFCaixaTransferencia.BtExcluirClick(Sender: TObject);
begin
  inherited;
  DMCaixa_Transf.QCaixaTransfItem_Cx.Delete;
end;

procedure TFCaixaTransferencia.VoltaConfirmao1Click(Sender: TObject);
Var wComando : String;
begin
  inherited;
  If DMCaixa_Transf.QCaixaTransfCabInd_Situacao.Value <> '2' Then
     Raise Exception.Create ('Somente pode ser voltado confirmação de lotes confirmados!');
  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMCaixa_Transf.QCaixaTransfCabDT_LANCAMENTO.Value Then
     raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');

  if MessageDlg('Voltar Confirmação?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMOracle.DBCemapa.StartTransaction;
    try
       DMCaixa_Transf.pVolta_Confirmacao := True;  // para permitir executar o Edit
       DMCaixa_Transf.QCaixaTransfCab.Edit;
       DMCaixa_Transf.pVolta_Confirmacao := False;
       DMPlanilha.Descontabiliza(DMCaixa_Transf.QCaixaTransfCabCOD_CAIXA_TRANSF_CAB.Value,'TRANSF_CX');

       With DMOracle do
       Begin
         QExecSQL.Close;  //exclui lancamento do caixa saida
         QExecSQL.SQL.Clear;
         wComando := 'DELETE FROM TB_CAIXA_MOV';
         wComando := wComando + ' WHERE COD_CAIXA_MOV = '+FloatToStr(DMCaixa_Transf.QCaixaTransfCabCod_Caixa_Mov_Remete.Value);
         QExecSQL.SQL.Add(wComando);
         QExecSQL.ExecSQL;

         QExecSQL.SQL.Clear;    //exclui lancamento da entrada
         wComando := 'DELETE FROM TB_CAIXA_MOV';
         wComando := wComando + ' WHERE COD_CAIXA_MOV = '+FloatToStr(DMCaixa_Transf.QCaixaTransfCabCod_Caixa_Mov_Recebe.Value);
         QExecSQL.SQL.Add(wComando);
         QExecSQL.ExecSQL;
       End;
       DMCaixa_Transf.QCaixaTransfCabInd_Situacao.Value := '1';
       DMCaixa_Transf.QCaixaTransfCab.Post;
       DMOracle.DBCemapa.Commit;
       ShowMessage('Volta confirmação efetuada com Sucesso!');
    except
       DMCaixa_Transf.QCaixaTransfCab.Cancel;
       DMOracle.DBCemapa.RollBack;
       Raise;
    end;
  end;
end;

procedure TFCaixaTransferencia.Confirma1Click(Sender: TObject);
begin
  inherited;
  If DMCaixa_Transf.QCaixaTransfCabInd_Situacao.Value <> '1' Then
     Raise Exception.Create ('lote já confirmado!');
  If FCaixaTransferencia_Conf=Nil then
    FCaixaTransferencia_Conf:=TFCaixaTransferencia_Conf.Create(Application);
  DMCaixa_Transf.QCaixaTransfSoma.Close;
  DMCaixa_Transf.QCaixaTransfSoma.Open;
  FCaixaTransferencia_Conf.ShowModal;

end;

procedure TFCaixaTransferencia.RelatrioTransfernciaNumerrio1Click(
  Sender: TObject);
begin
  inherited;
  If FCaixaParam=Nil then
    FCaixaParam:=TFCaixaParam.Create(Application);
  FCaixaParam.PGRelatorio.Pages[13].TabVisible:=True;
  If FCaixaParam.ShowModal=MrOk then
   begin
     with DMCaixa_Transf do
     begin
       QRCaixaTransf.Close;
       if Trim(FCaixaParam.Me13DtInicial.text) = '' then
          raise exception.create ('É necessário informar a data inicial');
       if Trim(FCaixaParam.Me13DtFinal.text) = '' then
          raise exception.create ('É necessário informar a data final');
       if Trim(FCaixaParam.ME13Filial.Text)<>'' then
          QRCaixaTransf.SetVariable('COD_FILIAL',StrToInt(Trim(FCaixaParam.Me13Filial.Text)))
       else
          QRCaixaTransf.SetVariable('COD_FILIAL',Null);
       Case FCaixaParam.Rg13Situacao.ItemIndex of
         0 : QRCaixaTransf.SetVariable('Ind_Situacao','1');
         1 : QRCaixaTransf.SetVariable('Ind_Situacao','2');
         2 : QRCaixaTransf.SetVariable('Ind_Situacao',Null);
       End;
       QRCaixaTransf.SetVariable('DT_INICIAL',StrToDate(FCaixaParam.Me13DtInicial.Text));
       QRCaixaTransf.SetVariable('DT_FINAL',StrToDate(FCaixaParam.Me13DtFinal.Text));
       QRCaixaTransf.Open;
       if FRCaixaTransferencia = Nil then
          FRCaixaTransferencia:=TFRCaixaTransferencia.Create(Application);
       If FCaixaParam.RGPreview.ItemIndex=0 then
          FRCaixaTransferencia.QRPrimario.Preview
       else
          FRCaixaTransferencia.QRPrimario.Print;
       QRCaixaTransf.Close;
     end;
   end;
end;

procedure TFCaixaTransferencia.BtHistoricoClick(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=MrOk then
     MeHistorico.Text:=DMHistorico.QHistoricoConsCod_Historico.Text;

end;

procedure TFCaixaTransferencia.SBConfirmarClick(Sender: TObject);
begin
  if DMCaixa_Transf.QCaixaTransfCabDT_LANCAMENTO.Value <= DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value then
    raise Exception.create('Fechamento Financeiro');

  inherited;
end;

procedure TFCaixaTransferencia.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit3.Text);
end;

procedure TFCaixaTransferencia.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit5.Text);
end;

end.
