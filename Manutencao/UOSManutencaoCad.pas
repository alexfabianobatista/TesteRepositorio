unit UOSManutencaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, ExtCtrls, Grids, DBGrids, ActnList, DBDirceu, OracleNavigator,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOSManutencaoCad = class(TFTCadSimples)
    Opes1: TMenuItem;
    Encerramento1: TMenuItem;
    VoltaEncerramento1: TMenuItem;
    ImpressoFormulrio1: TMenuItem;
    N2: TMenuItem;
    GeraCorretivas1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit5: TDBEdit;
    BTPrioridadeCons: TBitBtn;
    BTEquipamentoItemCons: TBitBtn;
    BTEquipamentoCons: TBitBtn;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit6: TDBEdit;
    TabSheet2: TTabSheet;
    BTTipoServicoCons: TBitBtn;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    Preventiva: TTabSheet;
    Panel2: TPanel;
    Label9: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBEdit13: TDBEdit;
    BTProcedimentoCons: TBitBtn;
    DBEdit14: TDBEdit;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    DBEdit16: TDBEdit;
    DataSource1: TDataSource;
    Label12: TLabel;
    DBEdit17: TDBEdit;
    Label14: TLabel;
    DBEdit18: TDBEdit;
    Label15: TLabel;
    DBEdit19: TDBEdit;
    btn3ProdCons: TBitBtn;
    DBDirceu1: TDBDirceu;
    OracleNavigator1: TOracleNavigator;
    DBGrid2: TDBGrid;
    Label16: TLabel;
    DBEdit20: TDBEdit;
    btDepartamentoCons: TBitBtn;
    DBDirceu2: TDBDirceu;
    procedure BTEquipamentoConsClick(Sender: TObject);
    procedure BTEquipamentoItemConsClick(Sender: TObject);
    procedure BTPrioridadeConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BTProcedimentoConsClick(Sender: TObject);
    procedure BTTipoServicoConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Encerramento1Click(Sender: TObject);
    procedure ImpressoFormulrio1Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure VoltaEncerramento1Click(Sender: TObject);
    procedure GeraCorretivas1Click(Sender: TObject);
    procedure BTOSAtividadeConsClick(Sender: TObject);
    procedure btn3ProdConsClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btDepartamentoConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOSManutencaoCad: TFOSManutencaoCad;

implementation

uses UOSManutencao_cl, UEquipamentoCons, UEquipamento_cl,
  UEquipamentoItemCons, UPrioridadeCons, UPrioridade_cl,
  UTipoEquipamentoCons, UTipoServico_cl, UProcedimentoCons,
  UProcedimento_cl, UTipoServicoCons, UOSManutencaoCons,
  UOSManutencaoEncerramento, UROSManutencaoFormulario, UGeraOSCorretiva,
  UAtividadeCons, UAtividade_cl, UUsuario_cl, UOracle_cl, UProdutoCons,
  UProduto_cl, UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFOSManutencaoCad.BTEquipamentoConsClick(Sender: TObject);
begin
  inherited;
  If FEquipamentoCons = Nil then
    FEquipamentoCons := TFEquipamentoCons.Create(Application);
  If FEquipamentoCons.showModal = mrOk then
  begin
    DMOSManutencao.QOSManutencaoCod_Equipamento_cab.Value := DMEquipamento.QEquipamentoConsCod_Equipamento_Cab.Value;
  end;
end;

procedure TFOSManutencaoCad.BTEquipamentoItemConsClick(Sender: TObject);
begin
  inherited;
  If FEquipamentoItemCons = Nil then
    FEquipamentoItemCons := TFEquipamentoItemCons.Create(Application);
  If FEquipamentoItemCons.showModal = mrOk then
  begin
    DMOSManutencao.QOSManutencaoCod_Equipamento_Item.Value := DMEquipamento.QEquipamentoItemConsCod_Equipamento_Item.Value;
  end;
end;

procedure TFOSManutencaoCad.BTPrioridadeConsClick(Sender: TObject);
begin
  inherited;
  If FPrioridadeCons = Nil then
    FPrioridadeCons := TFPrioridadeCons.Create(Application);
  If FPrioridadeCons.showModal = mrOk then
  begin
    DMOSManutencao.QOSManutencaoCod_Prioridade.Value := DMPrioridade.QPrioridadeConsCod_Prioridade.Value;
  end;
end;

procedure TFOSManutencaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOSManutencao do
  begin
    QOSManutencao.Open;
    QOSManutencaoItem.Open;
    QOSManutencaoAtiv.Open;
    QOSManutencaoPeca.Open;
  end;
end;

procedure TFOSManutencaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMOSManutencao do
  begin
    QOSManutencao.Close;
  end;
  action:=caFree;
  FOSManutencaoCad := nil;
end;

procedure TFOSManutencaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      FOSManutencaoCad.BTEquipamentoCons.Enabled:=True;
      FOSManutencaoCad.BTEquipamentoItemCons.Enabled:=True;
      FOSManutencaoCad.BTPrioridadeCons.Enabled:=True;
      FOSManutencaoCad.BTTipoServicoCons.Enabled:=True;
      btDepartamentoCons.Enabled := true;
    end
  Else
    begin
      FOSManutencaoCad.BTEquipamentoCons.Enabled:=False;
      FOSManutencaoCad.BTEquipamentoItemCons.Enabled:=False;
      FOSManutencaoCad.BTPrioridadeCons.Enabled:=False;
      FOSManutencaoCad.BTTipoServicoCons.Enabled:=False;
      btDepartamentoCons.Enabled := false;
    end;
end;

procedure TFOSManutencaoCad.BTProcedimentoConsClick(Sender: TObject);
begin
  inherited;
  If FProcedimentoCons = Nil then
    FProcedimentoCons := TFProcedimentoCons.Create(Application);
  If FProcedimentoCons.showModal = mrOk then
  begin
    DMOSManutencao.QOSManutencaoItemCod_Procedimento_Cab.Value := DMProcedimento.QProcedimentoConsCod_Procedimento_Cab.Value;
  end;
end;

procedure TFOSManutencaoCad.BTTipoServicoConsClick(Sender: TObject);
begin
  inherited;
  If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.showModal = mrOk then
  begin
    DMOSManutencao.QOSManutencaoCod_Tipo_Servico.Value := DMTipoServico.QTipoServicoConsCod_Tipo_Servico.Value;
  end;
end;

procedure TFOSManutencaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   If FOSManutencaoCons = Nil then
    FOSManutencaoCons := TFOSManutencaoCons.Create(Application);
  If FOSManutencaoCons.ShowModal = mrOk then
  With DMOSManutencao do
  Begin
    QOSManutencao.Close;
    QOSManutencao.SetVariable('PK',QOSManutencaoConsNum_OS_Manutencao.Value);
    QOSManutencao.Open;
  End;
end;

procedure TFOSManutencaoCad.Encerramento1Click(Sender: TObject);
begin
  inherited;
  with DMOSManutencao do
  begin
    if QOSManutencaoNum_OS_Manutencao.Text = '' then
      raise exception.create('Impossivel finalizar, nenhuma O.S. selecionada.');
    if QOSManutencaoDt_Encerramento.Text <> '' then
      raise exception.create('O.S. já encerrada');
    if FOSManutencaoEncerramento = nil then
      FOSManutencaoEncerramento := TFOSManutencaoEncerramento.create(Application);
    QOSManutencaoMov.Close;
    QOSManutencaoMov.SetVariable('NUM_OS_MANUTENCAO',QOSManutencaoNum_OS_Manutencao.Value);
    QOSManutencaoMov.Open;
  end;
  FOSManutencaoEncerramento.showModal;
end;
procedure TFOSManutencaoCad.ImpressoFormulrio1Click(Sender: TObject);
begin
  inherited;
  with DMOSManutencao do
  begin
    if QOSManutencaoNum_OS_Manutencao.text <> '' then
    begin
      If FROSManutencaoFormulario= Nil then
        FROSManutencaoFormulario := TFROSManutencaoFormulario.Create(Application);
      QROSFormulario.Close;
      QROSFormulario.SetVariable('NUM_OS_MANUTENCAO',QOSManutencaoNum_OS_Manutencao.text);
      QROSFormulario.open;
      QROSManutencaoPeca.Close;
      QROSManutencaoPeca.SetVariable(':PK',QROSFormularioNUM_OS_MANUTENCAO.Value);
      QROSManutencaoPeca.Open;
      FROSManutencaoFormulario.QRLEmpresa.Caption := 'Empresa: ' +
      DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' +
      DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_USUARIO','COD_USUARIO = ' + intToStr(DMUsuario.codUsuarioCorrente)));

      //FROSManutencaoFormulario.QRPrimario.Preview;
      FROSManutencaoFormulario.QRCompositeReport1.Preview;
      QROSFormulario.Close;
    end
    else
      showmessage('É necessario Carregar uma Ordem de Serviço em Aberto');
  end;
end;

procedure TFOSManutencaoCad.DBEdit15Exit(Sender: TObject);
begin
  inherited;
  if (Trim(DBedit7.text) = '')and(DBEdit15.text <> '') then
  begin
    DBEdit7.text:= DateToStr(StrToDate(DBEdit6.text)+ StrToFloat(DBEdit15.text));
    DBEdit2.SetFocus;
  end;

end;

procedure TFOSManutencaoCad.VoltaEncerramento1Click(Sender: TObject);
begin
  inherited;
  with DMOSManutencao do
  begin
    if QOSManutencaoDt_Encerramento.Text <> '' then
    Begin
      QOSManutencao.Edit;
      QOSManutencaoDt_Encerramento.Text:='';
      QOSManutencao.Post;
    end;
  end;
end;

procedure TFOSManutencaoCad.GeraCorretivas1Click(Sender: TObject);
begin
  inherited;
  if FGeraOSCorretiva = nil then
    FGeraOSCorretiva := TFGeraOSCorretiva.create(Application);
  FGeraOSCorretiva.showmodal;
end;

procedure TFOSManutencaoCad.BTOSAtividadeConsClick(Sender: TObject);
begin
  inherited;
  If FAtividadeCons = Nil then
    FAtividadeCons := TFAtividadeCons.Create(Application);
  If FAtividadeCons.showModal = mrOk then
  begin
    DMOSManutencao.QOSManutencaoAtivCod_Atividade_Cab.Value := DMAtividade.QAtividadeConsCod_Atividade_Cab.Value;
  end;
end;

procedure TFOSManutencaoCad.btn3ProdConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    DMOSManutencao.QOSManutencaoPecaCOD_PRODUTO.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  end;
end;

procedure TFOSManutencaoCad.DataSource1StateChange(Sender: TObject);
begin
  inherited;
  if dataSource1.State in [dsInsert, dsEdit] then
    btn3ProdCons.Enabled := true
  else
    btn3ProdCons.Enabled := false;
end;

procedure TFOSManutencaoCad.btDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = MrOk then
  begin
    with DMOSManutencao do
    begin
      QOSManutencaoCOD_DEPARTAMENTO.Value :=
      DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
    end;
  end;
end;

end.
