unit UOrdemCarregamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFOrdemCarregamentoCad = class(TFTCadSimples)
    DSOrdemCarregamentoItem: TDataSource;
    OrdemdeCarregamento1: TMenuItem;
    Espelho1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SBCadastroCons: TSpeedButton;
    SBFilialCons: TSpeedButton;
    Label11: TLabel;
    SbCadastroDestinoCons: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    SBProdutoCons: TSpeedButton;
    SBMotoristaCons: TSpeedButton;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label12: TLabel;
    SBOrdemCompraCons: TSpeedButton;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit11: TDBEdit;
    DBEdCodProduto: TDBEdit;
    DBEdit10: TDBEdit;
    DBRGTipoFrete: TDBRadioGroup;
    DBRGFormaPgto: TDBRadioGroup;
    DBEdQtdTonelada: TDBEdit;
    EdQtd: TEdit;
    DBEdit9: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit12: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    DBEdit7: TDBEdit;
    Operaes1: TMenuItem;
    CancelarOrdemCarregamento1: TMenuItem;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit19: TDBEdit;
    Label19: TLabel;
    SbMensagemCons: TSpeedButton;
    DBEdit20: TDBEdit;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu7: TDBDirceu;
    SBPlacaVeiculoCons: TSpeedButton;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    SbCodMotorista: TSpeedButton;
    DBDirceu8: TDBDirceu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCadastroConsClick(Sender: TObject);
    procedure SBFilialConsClick(Sender: TObject);
    procedure SBMotoristaConsClick(Sender: TObject);
    procedure SBOrdemCompraConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSOrdemCarregamentoItemStateChange(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBEdCodProdutoExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure OrdemdeCarregamento1Click(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdDescProdutoChange(Sender: TObject);
    procedure EdQtdExit(Sender: TObject);
    procedure Espelho1Click(Sender: TObject);
    procedure DBRGTipoFreteChange(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBEdit10Exit(Sender: TObject);
    procedure SbCadastroDestinoConsClick(Sender: TObject);
    procedure DBEdQtdToneladaChange(Sender: TObject);
    procedure CancelarOrdemCarregamento1Click(Sender: TObject);
    procedure SbMensagemConsClick(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure SBPlacaVeiculoConsClick(Sender: TObject);
    procedure SbCodMotoristaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    wfloQtdTonAtual : Real;    
  public
    { Public declarations }
  end;

var
  FOrdemCarregamentoCad: TFOrdemCarregamentoCad;

implementation

uses UOrdemCarregamento_cl, UOracle_cl, UCadastroCons, UCadastro_cl,
  UFilialCons, UVeiculoConhecimentoCons, UOrdemCompraCons, UFilial_cl, UVeiculoConhecimento_cl,
  UOrdemCompra_cl, UOrdemCarregamentoCons, UProdutoCons, UProduto_cl,
  UConhecimentoParam, UUsuario_cl, UROrdemCarregamento, UParamSistema_cl,
  UROrdemCarregamentoSituacao, UMotivoCons, UMotivo_cl, USequencia_cl,
  UMensagemCons, UMensagem_cl;

{$R *.DFM}

procedure TFOrdemCarregamentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMOrdemCarregamento.QOrdemCarregamentoCab.Close;
  DMOrdemCarregamento.QOrdemCarregamentoItem.Close;
  DMOrdemCarregamento.QOrdemCarregamentoCons.Close;
  DMOrdemCarregamento.QOrdemCompraItem.Close;
  DMOrdemCompra.QOrdemCompraCons.Close;
  Action := CaFree;
  FOrdemCarregamentoCad := nil;
end;

procedure TFOrdemCarregamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMOrdemCarregamento.QOrdemCarregamentoCab.open;
  DMOrdemCarregamento.QOrdemCarregamentoItem.open;
end;

procedure TFOrdemCarregamentoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
  Begin
    SBCadastroCons.Enabled := True;
    SBCadastroDestinoCons.Enabled := True;
    SBFilialCons.Enabled := True;
    SBProdutoCons.Enabled := True;
    SBMotoristaCons.Enabled := True;
    SBMensagemCons.Enabled := True;
    SbCodMotorista.Enabled := True;
  End
  Else
  Begin
    SBCadastroCons.Enabled := False;
    SBCadastroDestinoCons.Enabled := False;
    SBFilialCons.Enabled := False;
    SBProdutoCons.Enabled := False;
    SBMotoristaCons.Enabled := False;
    SBMensagemCons.Enabled := False;
    SbCodMotorista.Enabled := False;
  End;
  MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
end;

procedure TFOrdemCarregamentoCad.SBIncluirClick(Sender: TObject);
begin
  DMOracle.DBCemapa.StartTransaction;
  inherited;                         
end;

procedure TFOrdemCarregamentoCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMOrdemCarregamento.QOrdemCarregamentoCabCOD_FILIAL.Text),'CONHECIMENTO');
  DBEdCodProdutoExit(Self);

  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOrdemCarregamentoCad.SBCancelarClick(Sender: TObject);
begin
  DMOrdemCarregamento.QOrdemCarregamentoItem.Cancel;
  inherited;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFOrdemCarregamentoCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOrdemCarregamentoCad.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMOrdemCarregamento.QOrdemCarregamentoCabCod_Cadastro.value:=DMCadastro.QCadastroConsCod_Cadastro.value;
end;

procedure TFOrdemCarregamentoCad.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:=TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMOrdemCarregamento.QOrdemCarregamentoCabCOD_FILIAL.value := DMFilial.QFilialConsCod_Filial.value;
end;

procedure TFOrdemCarregamentoCad.SBMotoristaConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMOrdemCarregamento.QOrdemCarregamentoItemCOD_MOTORISTA.value := DMCadastro.QCadastroConsCod_Cadastro.value;
end;

procedure TFOrdemCarregamentoCad.SBOrdemCompraConsClick(Sender: TObject);
begin
  inherited;
  If(FOrdemCompraCons = nil)Then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  If FOrdemCompraCons.ShowModal = mrOk Then
  begin
    DMOrdemCarregamento.QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.value := DMOrdemCompra.QOrdemCompraConsCOD_ORDEM_COMPRA_CAB.value;
    DBEdit12Exit(self);
  End;
end;

procedure TFOrdemCarregamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If(FOrdemCarregamentoCons = nil)Then
    FOrdemCarregamentoCons := TFOrdemCarregamentoCons.Create(Application);
  If(FOrdemCarregamentoCons.showmodal = mrOk)Then
  Begin
    DMOrdemCarregamento.QOrdemCarregamentoCab.Close;
    DMOrdemCarregamento.QOrdemCarregamentoCab.SetVariable('PK',DMOrdemCarregamento.QOrdemCarregamentoConsCOD_ORDEM_CARREGAMENTO_CAB.Value);
    DMOrdemCarregamento.QOrdemCarregamentoCab.Open;
  End;
end;

procedure TFOrdemCarregamentoCad.DSOrdemCarregamentoItemStateChange(
  Sender: TObject);
begin
  inherited;
  If (DSOrdemCarregamentoItem.State in [dsInsert]) Then
  Begin
    DMOrdemCarregamento.QOrdemCarregamentoItemIND_TIPO_FRETE.Value := 'CIF';
    DMOrdemCarregamento.QOrdemCarregamentoItemIND_TIPO_PGTO.Value := 'CONHECIMENTO'; 
  End;

  If (DSOrdemCarregamentoItem.State in [dsEdit]) Then
  Begin
    wfloQtdTonAtual := DMOrdemCarregamento.QOrdemCarregamentoItemQTD_TONELADA.Value;
  End;

  If (DSOrdemCarregamentoItem.State in [dsInsert,dsEdit]) Then
  Begin
    SBOrdemCompraCons.Enabled := True;
    SBProdutoCons.Enabled := True;
    SBMotoristaCons.Enabled := True;
    SBPlacaVeiculoCons.Enabled := True;
  End
  Else
  Begin
    SBOrdemCompraCons.Enabled := False;
    SBProdutoCons.Enabled := False;
    SBMotoristaCons.Enabled := False;
    SBPlacaVeiculoCons.Enabled := False;
  End;
end;

procedure TFOrdemCarregamentoCad.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  If(FProdutoCons = nil)Then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk Then
    DMOrdemCarregamento.QOrdemCarregamentoItemCOD_PRODUTO.value := DMProduto.QProdutoConsCOD_PRODUTO.value;
end;

procedure TFOrdemCarregamentoCad.SBAlterarClick(Sender: TObject);
begin
  DMOracle.DBCemapa.StartTransaction;
  inherited;
end;

procedure TFOrdemCarregamentoCad.DBEdCodProdutoExit(Sender: TObject);
var
  wSql1, wSql2 : string;
begin
  inherited;
  With DMOrdemCarregamento do
  Begin
    If(Trim(QOrdemCarregamentoItemCOD_PRODUTO.Text) <> '')AND(Trim(QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.Text) <> '')Then
    Begin
      wSql1 := 'SELECT COD_PRODUTO FROM TB_ORDEM_COMPRA_ITEM';
//      wSql2 := 'COD_ORDEM_COMPRA_CAB = ' + QOrdemCompraItemCOD_ORDEM_COMPRA_CAB.Text + ' AND COD_PRODUTO = ' + QOrdemCarregamentoItemCOD_PRODUTO.Text;
      wSql2 := 'COD_ORDEM_COMPRA_CAB = ' + QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.Text + ' AND COD_PRODUTO = ' + QOrdemCarregamentoItemCOD_PRODUTO.Text;
      If Trim( DMOracle.BuscaNome(wSql1, wSql2)) = '' Then
      Begin
        DBEdCodProduto.SetFocus;
        raise Exception.Create('Produto escolhido não consta na Ordem de Compra escolhida');
      End;
    End;
  End;
end;

procedure TFOrdemCarregamentoCad.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
    DMOrdemCarregamento.QOrdemCarregamentoItemCOD_PRODUTO.Value := DMOrdemCarregamento.QOrdemCompraItemCOD_PRODUTO.Value;
end;

procedure TFOrdemCarregamentoCad.OrdemdeCarregamento1Click(
  Sender: TObject);
var
  wstrSituacao : String;
begin
  inherited;
  If(FConhecimentoParam = nil)Then
  Begin
    FConhecimentoParam := TFConhecimentoParam.Create(Application);
    FConhecimentoParam.ME13EmissaoInicial.Text := '01/' + FormatDateTime('MM/YYYY',Date);
    FConhecimentoParam.ME13EmissaoFinal.Text := DateToStr(Date);
  End;
  FConhecimentoParam.PGRelatorio.Pages[12].TabVisible:=True;
  If(FConhecimentoParam.showmodal = mrOk)Then
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FConhecimentoParam.ME13CodFilial.Text),'CONHECIMENTO');
    If(FConhecimentoParam.ME13EmissaoInicial.Text = '')OR(FConhecimentoParam.ME13EmissaoFinal.Text = '')Then
      raise Exception.Create('É necessário informar um período');
    With DMOrdemCarregamento do
    Begin
      QROrdemCarregamentoSituacao.Close;
      If(Trim(FConhecimentoParam.Me13CodOrigem.Text)<>'')Then
        QROrdemCarregamentoSituacao.SetVariable('ORIGEM',Trim(FConhecimentoParam.Me13CodOrigem.Text))
      Else
        QROrdemCarregamentoSituacao.SetVariable('ORIGEM',null);

      If(Trim(FConhecimentoParam.Me13CodDestino.Text)<>'')Then
        QROrdemCarregamentoSituacao.SetVariable('DESTINO',Trim(FConhecimentoParam.Me13CodDestino.Text))
      Else
        QROrdemCarregamentoSituacao.SetVariable('DESTINO',null);

      If(Trim(FConhecimentoParam.ME13CodFilial.Text)<>'')Then
        QROrdemCarregamentoSituacao.SetVariable('FILIAL',Trim(FConhecimentoParam.ME13CodFilial.Text))
      Else
        QROrdemCarregamentoSituacao.SetVariable('FILIAL',null);

      If(Trim(FConhecimentoParam.Me13CodMotorista.Text)<>'')Then
        QROrdemCarregamentoSituacao.SetVariable('MOTORISTA',Trim(FConhecimentoParam.Me13CodMotorista.Text))
      Else
        QROrdemCarregamentoSituacao.SetVariable('MOTORISTA',null);

      If(Trim(FConhecimentoParam.Me13CodProduto.Text)<>'')Then
        QROrdemCarregamentoSituacao.SetVariable('PRODUTO',Trim(FConhecimentoParam.Me13CodProduto.Text))
      Else
        QROrdemCarregamentoSituacao.SetVariable('PRODUTO',null);

      Case FConhecimentoParam.RG13IndSituacao.ItemIndex Of
        0: Begin
             wstrSituacao := 'Abertas';
             QROrdemCarregamentoSituacao.SetVariable('SITUACAO','A');
           End;
        1: Begin
             wstrSituacao := 'Atendidas';
             QROrdemCarregamentoSituacao.SetVariable('SITUACAO','B');
           End;
        2: Begin
             wstrSituacao := 'Canceladas';
             QROrdemCarregamentoSituacao.SetVariable('SITUACAO','C');
           End;
        3: Begin
             wstrSituacao := 'Todas';
             QROrdemCarregamentoSituacao.SetVariable('SITUACAO',null);
           End;
      End;
      QROrdemCarregamentoSituacao.SetVariable('DT_INICIO',Trim(FConhecimentoParam.ME13EmissaoInicial.Text));
      QROrdemCarregamentoSituacao.SetVariable('DT_FINAL',Trim(FConhecimentoParam.ME13EmissaoFinal.Text));
      QROrdemCarregamentoSituacao.Open;

      if FROrdemCarregamentoSituacao = nil then
        FROrdemCarregamentoSituacao := TFROrdemCarregamentoSituacao.create(application);
      FROrdemCarregamentoSituacao.QRLbPeriodo.Caption := 'Período entre ' + FConhecimentoParam.ME13EmissaoInicial.Text + ' até ' + FConhecimentoParam.ME13EmissaoFinal.Text + ' de Ordens de Carregamento ' + wstrSituacao;
      If FConhecimentoParam.RGPreview.ItemIndex = 0 then
        FROrdemCarregamentoSituacao.QRPrimario.Preview
      else
        FROrdemCarregamentoSituacao.QRPrimario.Print;
      QROrdemCarregamentoSituacao.Close;
    End;
  End;
end;

procedure TFOrdemCarregamentoCad.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  If(Trim(DBEdit12.Text) = '')Then
  Begin
    DMOrdemCarregamento.QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.Text := '';
    DMOrdemCarregamento.QOrdemCompraItem.Close;
  End
  Else
  Begin
    DMOrdemCarregamento.QOrdemCompraItem.Close;
    DMOrdemCarregamento.QOrdemCompraItem.SetVariable('COD_OC_CAB',Trim(DMOrdemCarregamento.QOrdemCarregamentoItemCOD_ORDEM_COMPRA_CAB.Text));
    DMOrdemCarregamento.QOrdemCompraItem.Open;
    DMOrdemCarregamento.QOrdemCarregamentoItemCOD_PRODUTO.Text := '';
    DMOrdemCarregamento.QOrdemCarregamentoItemQTD_TONELADA.Text := '';
    If(DMOrdemCarregamento.QOrdemCompraItem.RecordCount = 0)Then
      raise Exception.Create('Esta Ordem de Compra não possui Itens');
  End;
end;

procedure TFOrdemCarregamentoCad.DBEdDescProdutoChange(Sender: TObject);
begin
  inherited;
  If (Trim(DBEdCodProduto.Text) <> '')Then
  Begin
    EdQtd.Enabled := True;
    DBEdQtdTonelada.Enabled := True;
  End
  Else
  Begin
    EdQtd.Enabled := False;
    EdQtd.Text := '';
    DBEdQtdTonelada.Enabled := False;
  End;
end;

procedure TFOrdemCarregamentoCad.EdQtdExit(Sender: TObject);
var
  wfloNumEmbalagem : Real;
  wstrDescUnidade : String;
begin
  inherited;
  If(EdQtd.Text <> '')Then
  Begin
    With DMOrdemCarregamento do
    Begin
      If QOrdemCarregamentoItemCOD_PRODUTO.Text <> '' then
       Begin
        wfloNumEmbalagem := StrToFloat( DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','TB_PRODUTO.COD_PRODUTO = ' + QOrdemCarregamentoItemCOD_PRODUTO.Text) );
        wstrDescUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','TB_PRODUTO.COD_PRODUTO = ' + QOrdemCarregamentoItemCOD_PRODUTO.Text);
        If(Trim(wstrDescUnidade) = 'T')Then
          QOrdemCarregamentoItemQTD_TONELADA.Value := wfloNumEmbalagem * StrToFloat(EdQtd.Text)
        Else
          If(Trim(wstrDescUnidade) = 'SC')OR(Trim(wstrDescUnidade) = 'KG')Then
            QOrdemCarregamentoItemQTD_TONELADA.Value := (wfloNumEmbalagem * StrToFloat(EdQtd.Text))/1000
          Else
          Begin
            EdQtd.SetFocus;
            raise Exception.create('A Unidade do Produto escolhida não é T, KG nem SC');
          End;
       End;
    End;
  End;
end;

procedure TFOrdemCarregamentoCad.Espelho1Click(Sender: TObject);
begin
  inherited;
  With DMOrdemCarregamento do
  Begin
    If( QOrdemCarregamentoCab.RecordCount = 0 )Then
      raise Exception.create('É necessário escolher uma Ordem de Carregamento');
    If( QOrdemCarregamentoCabNUM_ORDEM_CARREGAMENTO.IsNull )Then
      raise Exception.create('Esta Ordem de Carregamento ainda não foi Confirmada');
    DmUsuario.Checar_Filial_Usuario(Trim(QOrdemCarregamentoCabCOD_FILIAL.Text),'CONHECIMENTO');
    QROrdemCarregamento.Close;
    QROrdemCarregamento.SetVariable('ORDEM_CARREGAMENTO',QOrdemCarregamentoCabCOD_ORDEM_CARREGAMENTO_CAB.Text);
    QROrdemCarregamento.Open;
    If FROrdemCarregamento = Nil then
      FROrdemCarregamento := TFROrdemCarregamento.create(application);
    FROrdemCarregamento.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Text;//DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = ' + DMParamSistema.QParamSistemaCOD_FILIAL.Text);
    FROrdemCarregamento.QRLEmpresa1.Caption := FROrdemCarregamento.QRLEmpresa.Caption;
    FROrdemCarregamento.QRLEndEmpresa.Caption := QROrdemCarregamentoDESC_ENDERECO.Value + ' - '+QROrdemCarregamentoDESC_BAIRRO.Value + ' CEP '+ QROrdemCarregamentoDESC_CEP.Value ;
    FROrdemCarregamento.QRLCidadeEmpresa.Caption := QROrdemCarregamentoDESC_CIDADE.Value + ' - ' + QROrdemCarregamentoCOD_ESTADO.Value;
    FROrdemCarregamento.QRPrimario.Preview;
    QROrdemCarregamento.Close;
  End;
end;

procedure TFOrdemCarregamentoCad.DBRGTipoFreteChange(Sender: TObject);
begin
  inherited;
  If(DBRGTipoFrete.ItemIndex = 1)Then
  Begin
    DBRGFormaPgto.ItemIndex := 2;
  End;
end;

procedure TFOrdemCarregamentoCad.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  wfloQtdTonAtual := DMOrdemCarregamento.QOrdemCarregamentoItemQTD_TONELADA.Value;
end;

procedure TFOrdemCarregamentoCad.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  If(DMOrdemCarregamento.QOrdemCarregamentoItemCod_Motorista.Text <> '')Then
    DMOrdemCarregamento.QOrdemCarregamentoItemDESC_PLACA_VEICULO.Value:=
      DMOracle.BuscaNome('SELECT DESC_PLACA FROM TB_CADASTRO','COD_CADASTRO ='+ DMOrdemCarregamento.QOrdemCarregamentoItemCod_Motorista.Text);
end;

procedure TFOrdemCarregamentoCad.SbCadastroDestinoConsClick(
  Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMOrdemCarregamento.QOrdemCarregamentoCabCod_Cadastro_Destino.value:=DMCadastro.QCadastroConsCod_Cadastro.value;

end;

procedure TFOrdemCarregamentoCad.DBEdQtdToneladaChange(Sender: TObject);
var
  wfloNumEmbalagem : Real;
  wstrDescUnidade : String;
begin
  inherited;
  If(DBEdQtdTonelada.Text<>'')Then
  Begin
    With DMOrdemCarregamento do
    Begin
      If(QOrdemCarregamentoItemCOD_PRODUTO.Text <> '')Then
      Begin

        wfloNumEmbalagem := StrToFloat( DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                            'TB_PRODUTO.COD_PRODUTO = ' + QOrdemCarregamentoItemCOD_PRODUTO.Text) );
        wstrDescUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO',
                           'TB_PRODUTO.COD_PRODUTO = ' + QOrdemCarregamentoItemCOD_PRODUTO.Text);

        If(Trim(wstrDescUnidade) = 'T')Then
          EdQtd.Text := FormatFloat( '#####0.00', StrToFloat(DBEdQtdTonelada.Text) / wfloNumEmbalagem)
        Else
          If(Trim(wstrDescUnidade) = 'SC')OR(Trim(wstrDescUnidade) = 'KG')Then
            EdQtd.Text := FormatFloat( '#####0.00', StrToFloat(DBEdQtdTonelada.Text) * 1000 / wfloNumEmbalagem)
          Else
          Begin
            DBEdQtdTonelada.SetFocus;
            raise Exception.create('A Unidade do Produto escolhida não é T, KG nem SC');
          End;
      End;
    End;
  End;
end;

procedure TFOrdemCarregamentoCad.CancelarOrdemCarregamento1Click(
  Sender: TObject);
begin
  inherited;
  With DMOrdemCarregamento do
  Begin
    If(QOrdemCarregamentoCab.IsEmpty)Then
      raise Exception.Create('É necessário escolher uma Ordem de Carregamento para Cancelamento')
    Else
    Begin
      If(FMotivoCons = nil)Then
        FMotivoCons := TFMotivoCons.Create(Application);
      If(FMotivoCons.Showmodal = mrOk)Then
      Begin
        Try
          QOrdemCarregamentoCab.Edit;
          QOrdemCarregamentoCabCOD_MOTIVO_CANCELAMENTO.Value := DMMotivo.QMotivoConsCOD_MOTIVO.Value;
          QOrdemCarregamentoCabIND_SITUACAO.Value := 'C';
          QOrdemCarregamentoCab.Post;
          DMOracle.DBCemapa.Commit;
        Except
          QOrdemCarregamentoCab.cancel;
        End;
      End;
    End;
  End
end;

procedure TFOrdemCarregamentoCad.SbMensagemConsClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.create(application);
  If FMensagemCons.showmodal = MrOk then
    DMOrdemCarregamento.QOrdemCarregamentoCabCOD_MENSAGEM.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

procedure TFOrdemCarregamentoCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
  DMOrdemCarregamento.QOrdemCarregamentoCabNUM_ORDEM_CARREGAMENTO.Text := '';
end;

procedure TFOrdemCarregamentoCad.SBPlacaVeiculoConsClick(Sender: TObject);
begin
  inherited;
  if FveiculoConhecimentoCons = nil then
    FveiculoConhecimentoCons:=TFveiculoConhecimentoCons.create(application);
  if FveiculoConhecimentoCons.showmodal = mrOk then
    DMOrdemCarregamento.QOrdemCarregamentoItemDESC_PLACA_VEICULO.Value:=DMVeiculoConhecimento.QVeiculoConsDesc_Placa.value;
end;

procedure TFOrdemCarregamentoCad.SbCodMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
    DMOrdemCarregamento.QOrdemCarregamentoCabCOD_MOTORISTA.value := DMCadastro.QCadastroConsCod_Cadastro.value;

end;

procedure TFOrdemCarregamentoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMOrdemCarregamento.QOrdemCarregamentoCab;
end;

end.
