unit UVendedorCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, DBDirceu, variants, ActnList, DBPanel,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFVendedorCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BtIncRegiaoVend: TBitBtn;
    BtDelRegiaoVend: TBitBtn;
    Label17: TLabel;
    DBEdit18: TDBEdit;
    Label18: TLabel;
    DBEdit19: TDBEdit;
    Vendedor1: TMenuItem;
    Vendedor2: TMenuItem;
    SBCotas: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    Vendedorporregio1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    VendedorCompleto1: TMenuItem;
    SpeedButton1: TSpeedButton;
    VendedorporCidade1: TMenuItem;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    DSVendedorRegiao: TDataSource;
    VendedorDetalhesVenda1: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    CidadeporSupervisor1: TMenuItem;
    TabSheet3: TTabSheet;
    Label36: TLabel;
    DBEdit37: TDBEdit;
    DsPremioVendedor: TDataSource;
    Label37: TLabel;
    DBEdit38: TDBEdit;
    Label38: TLabel;
    DBEdit39: TDBEdit;
    Label39: TLabel;
    DBEdit40: TDBEdit;
    Label40: TLabel;
    DBEdit41: TDBEdit;
    Label41: TLabel;
    DBEdit42: TDBEdit;
    Label42: TLabel;
    DBEdit43: TDBEdit;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    TabSheet4: TTabSheet;
    DsTabelaVendedor: TDataSource;
    GroupBox5: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox6: TGroupBox;
    DBGrid5: TDBGrid;
    BtIncluiTabela: TBitBtn;
    BtExcluiTabela: TBitBtn;
    DsTabelaVendedorAll: TDataSource;
    Label43: TLabel;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    Label44: TLabel;
    GroupBox7: TGroupBox;
    Label45: TLabel;
    DBEdit46: TDBEdit;
    Label46: TLabel;
    DBEdit47: TDBEdit;
    Label47: TLabel;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    Label48: TLabel;
    DBEdit73: TDBEdit;
    Label49: TLabel;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    DBPanel13: TDBPanel;
    DBPanel14: TDBPanel;
    DBPanel15: TDBPanel;
    DBPanel16: TDBPanel;
    DBPanel17: TDBPanel;
    DBPanel18: TDBPanel;
    DBPanel19: TDBPanel;
    DBPanel20: TDBPanel;
    DBPanel21: TDBPanel;
    DBPanel22: TDBPanel;
    DBPanel23: TDBPanel;
    DBPanel24: TDBPanel;
    DBPanel25: TDBPanel;
    DBPanel26: TDBPanel;
    DBPanel27: TDBPanel;
    DBPanel28: TDBPanel;
    DBPanel30: TDBPanel;
    DBPanel31: TDBPanel;
    DBPanel32: TDBPanel;
    DBPanel33: TDBPanel;
    DBPanel29: TDBPanel;
    DBPanel34: TDBPanel;
    DbComissao3: TDBPanel;
    DBComissao4: TDBPanel;
    Opes1: TMenuItem;
    EmissodeEtiquetaEPL1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtIncRegiaoVendClick(Sender: TObject);
    procedure BtDelRegiaoVendClick(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure Vendedor2Click(Sender: TObject);
    procedure SBCotasClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure Vendedorporregio1Click(Sender: TObject);
    procedure VendedorCompleto1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure VendedorporCidade1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VendedorDetalhesVenda1Click(Sender: TObject);
    procedure CidadeporSupervisor1Click(Sender: TObject);
    procedure BtIncluiTabelaClick(Sender: TObject);
    procedure BtExcluiTabelaClick(Sender: TObject);
    procedure DBPanel16DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel25DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel22DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel28DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure EmissodeEtiquetaEPL1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorCad: TFVendedorCad;

implementation

uses UVendedor_cl, UVendedorCons, URegiao_cl, URVendedor_Supervisor,
  URVendedor_Vendedor, UVendedorQuota, UFRVendedor_Regiao,
  UrVendedorCompleto, UVendedorParam, UCidadeCons, UCidade_cl,
  URVendedorCidade, UCadastroParam, UDepartamentoCons, UDepartamento_cl,
  UBancosCons, UBancoAgencia_cl, UFilialCons, UFilial_cl, UTela_cl,
  URVendedor_Det, UCadastro_Rel_cl, URSupervisorCidade, UOracle_cl,
  UUsuario_cl, UParamSistema_cl, Cport, ShellAPI, Math;

{$R *.DFM}

procedure TFVendedorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.create(Application);
  If FVendedorCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    QVendedor.Close;
    QVendedor.SetVariable('PK',QVendedorConsCod_Vendedor.Value);
    QVendedor.Open;
  End;
end;

procedure TFVendedorCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    QVendedor.Open;
    QVendedorRegiao.Open;
    QVendRegiaoTela.Open;
    QVendedorPremio.Open;
    QTabelaVendedor.Open;
    QTabelaVendedor_All.Open;
  End;
  DMRegiao.QRegiaoAll.Open;

  if ((DMParamSistema.CodEmpresa = 'ABATE') and
         (DMUsuario.pTipoFuncionario <> 'DIRETOR') and (DMUsuario.pTipoFuncionario <> 'GERENTE') and
         (DMUsuario.pTipoFuncionario <> 'SUPERVISOR')) then
    SBCotas.Visible := False
  else
    SBCotas.Visible := True;

  DBPanel11.CharCase := ecNormal; //deixar o e-mail em minusculo. Vanessa 02/08/2014
{ percentual de comissao 3 e 4 é utilizado somente pelo bissolotti e tem uma trigger trg_comissao_bissolotti que
calcula e grava na tabela tb_pedido_item - Cesar 29/02/2016}

  If DMParamSistema.CodEmpresa = 'BISSOLOTTI' Then
   Begin
     DBComissao3.Visible := True;
     DBComissao4.Visible := True;
   End
  Else
   Begin
     DBComissao3.Visible := False;
     DBComissao4.Visible := False;
   End;
//A center Frio utiliza duas comissões, de venda (Vendedor) e serviço(técnico). Alex 04/02/2022
  if DMParamSistema.CodEmpresa = 'CENTERFRIO' then
  begin
    DBPanel13.LCaption := 'Comissão Vendedor';
    DBPanel13.Width := 98;
    DBPanel13.Height := 37;
    DBPanel13.Left := 8;

    DBPanel14.LCaption := 'Comissão Técnico';
    DBPanel14.Width := 94;
    DBPanel14.Height := 37;
    DBPanel14.Left := 110;

    DBPanel15.Left := 372;
    DBPanel17.Left := 447;

    DbComissao3.Visible := true;
    DbComissao3.LCaption := 'Comissão Total O.S.';
    DbComissao3.Left := 210;
    DbComissao3.Width := 110;
    DbComissao3.Height := 37;
  end;
{Mecanica do Ivo saiu do grupo NFCE e começou a utilizar o sistema completo e precisa calcular as comissões para os mecânicos. Alex 26/02/2025}
  if DMParamSistema.CodEmpresa = 'NFCE-IVO' then
  begin
    DBPanel13.LCaption := 'Comissão Vendedor';
    DBPanel13.Width := 98;
    DBPanel13.Height := 37;
    DBPanel13.Left := 8;

    DBPanel14.LCaption := 'Comissão Mecânico';
    DBPanel14.Width := 99;
    DBPanel14.Height := 37;
    DBPanel14.Left := 110;
    DBPanel15.Left := 372;
    DBPanel17.Left := 447;

    DbComissao3.Visible := true;
    DbComissao3.LCaption := 'Comissão Total O.S.';
    DbComissao3.Left := 215;
    DbComissao3.Width := 110;
    DbComissao3.Height := 37;
  end;
  if DMParamSistema.CodEmpresa = 'INJEPAR' then
  begin
    DBPanel13.LCaption := 'Comissão Peça';
    DBPanel13.Width := 98;
    DBPanel13.Height := 37;
    DBPanel13.Left := 8;

    DBPanel14.LCaption := 'Comissão Serviço';
    DBPanel14.Width := 94;
    DBPanel14.Height := 37;
    DBPanel14.Left := 110;

    DBPanel15.Left := 372;
    DBPanel17.Left := 447;
  end;
end;

procedure TFVendedorCad.BtIncRegiaoVendClick(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    Try
      QVendedorRegiao.Insert;
      QVendedorRegiaoCod_Vendedor.Value := QVendedorCod_Vendedor.Value;
      QVendedorRegiaoCod_Regiao.Value := DMRegiao.QRegiaoAllCod_Regiao.Value;
      QVendedorRegiao.Post;
      //QVendRegiaoTela.Close;
      //QVendRegiaoTela.Open;
    Except
      QVendedorRegiao.Cancel;
    End;
  End;
end;

procedure TFVendedorCad.BtDelRegiaoVendClick(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    QVendedorRegiao.Close;
    QVendedorRegiao.SetVariable('Cod_Vendedor',QVendedorCod_Vendedor.Value);
    QVendedorRegiao.SetVariable('Cod_Regiao',QVendRegiaoTelaCod_Regiao.Value);
    QVendedorRegiao.Open;
    QVendedorRegiao.Delete;
    //QVendRegiaoTela.Close;
    //QVendRegiaoTela.Open;
  End;
end;

procedure TFVendedorCad.Vendedor1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = Nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[3].TabVisible := True;
  if FVendedorParam.ShowModal = mrOk then
  begin
    if FVendedorParam.Rg3Situacao.ItemIndex = 0 then
      DMVendedor.QRSupervisor.SetVariable('IND_SITUACAO','ATIVO');
    if FVendedorParam.Rg3Situacao.ItemIndex = 1 then
      DMVendedor.QRSupervisor.SetVariable('IND_SITUACAO','INATIVO');
    if FVendedorParam.Rg3Situacao.ItemIndex = 2 then
      DMVendedor.QRSupervisor.SetVariable('IND_SITUACAO',null);
    DMVendedor.QRSupervisor.Close;
    DMVendedor.QRSupervisor.Open;
    If FRVendedor_Supervisor = Nil then
      FRVendedor_Supervisor := TFRVendedor_Supervisor.Create(Application);
    FRVendedor_Supervisor.QRPrimario.Preview;
  end;
end;

procedure TFVendedorCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtDelRegiaoVend.Enabled := DMVendedor.QVendedor.State = dsBrowse;
  BtIncRegiaoVend.Enabled := DMVendedor.QVendedor.State = dsBrowse;
end;

procedure TFVendedorCad.Vendedor2Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = Nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[0].TabVisible := True;
  if FVendedorParam.ShowModal = mrOk then
  Begin
    DMVendedor.QRVendedor.Close;
    Case FVendedorParam.Rg0Situacao.ItemIndex of
      0 : DMVendedor.QRVendedor.SetVariable('SITUACAO','ATIVO');
      1 : DMVendedor.QRVendedor.SetVariable('SITUACAO','INATIVO');
      2 : DMVendedor.QRVendedor.SetVariable('SITUACAO',Null);
    End;

    //Frames-------------------------
    If Trim(FVendedorParam.FmDepartamento1.MeDepartamento.Text) <> '' Then
       DMVendedor.QRVendedor.SetVariable('COD_DEPARTAMENTO',Trim(FVendedorParam.FmDepartamento1.MeDepartamento.Text))
    Else
       DMVendedor.QRVendedor.SetVariable('COD_DEPARTAMENTO',Null);


    If Trim(FVendedorParam.FmVendedor1.Mevendedor.text) <> '' Then
       DMVendedor.QRVendedor.SetVariable('COD_VENDEDOR',Trim(FVendedorParam.FmVendedor1.Mevendedor.text))
    Else
       DMVendedor.QRVendedor.SetVariable('COD_VENDEDOR',Null);

    If Trim(FVendedorParam.FmEstado1.MeEstado.text) <> '' Then
       DMVendedor.QRVendedor.SetVariable('COD_ESTADO',Trim(FVendedorParam.FmEstado1.MeEstado.text))
    Else
       DMVendedor.QRVendedor.SetVariable('COD_ESTADO',Null);
    //-------------------------------

    DMVendedor.QRVendedor.Open;
    If FRVendedor_Vendedor = Nil then
      FRVendedor_Vendedor := TFRVendedor_Vendedor.Create(Application);
    If FVendedorParam.RGPreview.ItemIndex = 0 then
      FRVendedor_Vendedor.QRPrimario.Preview
    Else
      FRVendedor_Vendedor.QRPrimario.Print;
    DMVendedor.QRVendedor.Close;
  End;
end;

procedure TFVendedorCad.SBCotasClick(Sender: TObject);
begin
  inherited;
  If FVendedorQuota = Nil then
    FVendedorQuota := TFVendedorQuota.Create(Application);
  DMTela.VerificaTela('CADASTRO',FVendedorQuota.Caption,FVendedorQuota.Name);
  FVendedorQuota.ShowModal;
end;

procedure TFVendedorCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(31);
end;

procedure TFVendedorCad.Vendedorporregio1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = Nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[0].TabVisible := True;
  If FVendedorParam.ShowModal = mrOk then
  Begin
    DMVendedor.QRVendedorRegiao.Close;
    Case FVendedorParam.Rg0Situacao.ItemIndex of
      0 : DMVendedor.QRVendedorRegiao.SetVariable('SITUACAO','ATIVO');
      1 : DMVendedor.QRVendedorRegiao.SetVariable('SITUACAO','INATIVO');
      2 : DMVendedor.QRVendedorRegiao.SetVariable('SITUACAO',Null);
    End;

    if trim(FVendedorParam.FmVendedor1.MeVendedor.Text) = '' then
      DMVendedor.QRVendedorRegiao.SetVariable('COD_VENDEDOR',null)
    else
      DMVendedor.QRVendedorRegiao.SetVariable('COD_VENDEDOR',FVendedorParam.FmVendedor1.MeVendedor.Text);

    if trim(FVendedorParam.FmEstado1.MeEstado.Text) = '' then
      DMVendedor.QRVendedorRegiao.SetVariable('COD_ESTADO',null)
    else
      DMVendedor.QRVendedorRegiao.SetVariable('COD_ESTADO',trim(FVendedorParam.FmEstado1.MeEstado.Text));

    DMVendedor.QRVendedorRegiao.Open;
    if FRVendedor_Regiao = nil then
       FRVendedor_Regiao := TFRVendedor_Regiao.Create(Application);
    FRVendedor_Regiao.QRLTitulo.Caption := 'Regiões Atendidas pelo Vendedor';
    If FVendedorParam.RGPreview.ItemIndex = 0 then
       FRVendedor_Regiao.QRPrimario.Preview
    Else
       FRVendedor_Regiao.QRPrimario.Print;
    DMVendedor.QRVendedorRegiao.Close;
  End;

end;

procedure TFVendedorCad.VendedorCompleto1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = Nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[0].TabVisible := True;
  If FVendedorParam.ShowModal = mrOk then
  Begin
    DMVendedor.QRVendedor.Close;
    Case FVendedorParam.Rg0Situacao.ItemIndex of
      0 : DMVendedor.QRVendedor.SetVariable('SITUACAO','ATIVO');
      1 : DMVendedor.QRVendedor.SetVariable('SITUACAO','INATIVO');
      2 : DMVendedor.QRVendedor.SetVariable('SITUACAO',Null);
    End;

    DMVendedor.QRVendedor.Open;
    If FRVendedorCompleto = Nil then
      FRVendedorCompleto := TFRVendedorCompleto.Create(Application);
    If FVendedorParam.RGPreview.ItemIndex = 0 then
       FRVendedorCompleto.QRPrimario.Preview
    Else
       FRVendedorCompleto.QRPrimario.Print;
    DMVendedor.QRVendedor.Close;
  End;
end;

procedure TFVendedorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMVendedor do
  Begin
    QVendedor.Close;
    QVendedorRegiao.Close;
    QVendRegiaoTela.Close;
    QVendedorPremio.Close;
    QTabelaVendedor.Close;
    QTabelaVendedor_All.Close;
  End;
  DMRegiao.QRegiaoAll.Close;
  Action := CaFree;
  FVendedorCad := Nil;
end;

procedure TFVendedorCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil then
    FCidadeCons:= TFCidadeCons.Create(Application);
  If FCidadeCons.Showmodal = mrOk then
  Begin
    DMVendedor.QVendedorDESC_CIDADE.Value:= DMCidade.QCidadeConsDESC_CIDADE.Value ;
    DMVendedor.QVendedorCOD_ESTADO.Value:= DMCidade.QCidadeConsCod_Estado.Value; //DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO ' , 'COD_ESTADO = '+CHR(39)+Trim(DMCidade.QCidadeConsCod_Estado.Text)+CHR(39) );
  End;
end;

procedure TFVendedorCad.VendedorporCidade1Click(Sender: TObject);
begin
  inherited;
   if FVendedorParam = Nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[1].TabVisible := True;
  FVendedorParam.FmVendedor2.Label1.Caption := 'Vendedor';
  If FVendedorParam.ShowModal = mrOk then
  with DMVendedor do
  begin
    QRCidadeVendedor.Close;
    //Frames-----------------------------
    if Trim(FVendedorParam.FmVendedor2.MeVendedor.Text) = '' then
       QRCidadeVendedor.SetVariable('VENDEDOR',Null)
    else
       QRCidadeVendedor.SetVariable('VENDEDOR',StrToInt(Trim(FVendedorParam.FmVendedor2.MeVendedor.Text)));
    //-----------------------------------

    QRCidadeVendedor.Open;

    if FRVendedorCidade = nil then
       FRVendedorCidade:= TFRVendedorCidade.Create(Application);
    if FVendedorParam.RGPreview.ItemIndex = 0 then
       FRVendedorCidade.QRPrimario.Preview
    else
       FRVendedorCidade.QRPrimario.Print;
    QRCidadeVendedor.Close;
  end;

end;

procedure TFVendedorCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMVendedor.QVendedor;
end;

procedure TFVendedorCad.VendedorDetalhesVenda1Click(Sender: TObject);
begin
  inherited;
  with DMCadastro_Rel do
  begin
    QRVendedor_Det.Close;
    QRVendedor_Det.Open;

    if FRVendedor_Det = nil then
       FRVendedor_Det:= TFRVendedor_Det.Create(Application);
    FRVendedor_Det.QRPrimario.Preview;
    QRVendedor_Det.Close;
  end;
end;

procedure TFVendedorCad.CidadeporSupervisor1Click(Sender: TObject);
begin
  inherited;
   if FVendedorParam = Nil then
    FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[1].TabVisible := True;
  FVendedorParam.FmVendedor2.Label1.Caption := 'Supervisor';
  If FVendedorParam.ShowModal = mrOk then
  with DMVendedor do
  begin
    QRSupervisorCidade.Close;
    //Frames--------------------------
    if Trim(FVendedorParam.FmVendedor2.MeVendedor.Text) = '' then
       Raise Exception.Create('Favor informar codigo do supervisor');
    QRSupervisorCidade.SetVariable('COD_SUPERVISOR',StrToInt(Trim(FVendedorParam.FmVendedor2.MeVendedor.Text)));
    //--------------------------------

    QRSupervisorCidade.Open;

    if FRSupervisorCidade = nil then
       FRSupervisorCidade:= TFRSupervisorCidade.Create(Application);
    FRSupervisorCidade.QrlSupervisor.Caption := FVendedorParam.FmVendedor2.MeVendedor.Text + ' - '+ FVendedorParam.FmVendedor2.EdVendedor.Text;
    if FVendedorParam.RGPreview.ItemIndex = 0 then
       FRSupervisorCidade.QRPrimario.Preview
    else
       FRSupervisorCidade.QRPrimario.Print;
    QRSupervisorCidade.Close;
  end;

end;

procedure TFVendedorCad.BtIncluiTabelaClick(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    Try
      QTabelaVendedor.Insert;
      QTabelaVendedorCod_Vendedor.Value := QVendedorCod_Vendedor.Value;
      QTabelaVendedorCod_Tabela_Pocket.Value := QTabelaVendedor_AllCod_Tabela_Pocket.Value;
      QTabelaVendedor.Post;
    Except
      QTabelaVendedor.Cancel;
    End;
  End;

end;

procedure TFVendedorCad.BtExcluiTabelaClick(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    QTabelaVendedor.Delete;
    //QVendRegiaoTela.Close;
    //QVendRegiaoTela.Open;
  End;

end;

procedure TFVendedorCad.DBPanel16DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFVendedorCad.DBPanel25DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FBancosCons;
  Classe := TFBancosCons;
end;

procedure TFVendedorCad.DBPanel22DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FDepartamentoCons;
  Classe := TFDepartamentoCons;
end;

procedure TFVendedorCad.DBPanel28DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFVendedorCad.EmissodeEtiquetaEPL1Click(Sender: TObject);
var
  wString : TStringList;
  qtdEtiqueta : String;
  i : integer;
const
  arquivo = 'C:\Temp\etiqueta.prn';
begin
  inherited;
  DMVendedor.QVendedor.Open;
  DMUsuario.QUsuario.Open;
  wString := TStringList.create;
  wString.clear;

  if (DMVendedor.QVendedorCOD_VENDEDOR.Text = '') then
    raise exception.Create('Pesquise uma Vendedor.');
  if (DMVendedor.QVendedorDESC_CELULAR.Text = '') then
    raise exception.Create('Informe um número de celular para este Vendedor.');
  if (DMVendedor.QVendedorDESC_E_MAIL.Text = '') then
    raise exception.Create('Informe um e-mail para este Vendedor.');
  if (Trim(DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text) = '') then
    raise exception.Create('Configure a sua impressora Zebra no Cadastro de Usúario. Ex.:\\localhost\nomeimpressora');

  If InputQuery('Imprimir', 'Informe a quantidade de etiquetas:',qtdEtiqueta) then
  begin
    if MessageDlg('Deseja Gerar ' + qtdEtiqueta + ' etiqueta(s) do Vendedor ' + DMVendedor.QVendedorNOME.Text +'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    for i := 1 to strtoint(qtdEtiqueta) do
    begin
      wString.Add('I8,A,001');
      wString.Add('');
      wString.Add('');
      wString.Add('Q288,024');
      wString.Add('q831');
      wString.Add('rN');
      wString.Add('S3');
      wString.Add('D7');
      wString.Add('ZT');
      wString.Add('JF');
      wString.Add('O');
      wString.Add('R0,0');
      wString.Add('f100');
      wString.Add('N');
      wString.Add('A814,220,2,1,2,2,N,"'          +DMParamSistema.QParamSistemaDESC_EMPRESA.Text+'"');
      wString.Add('A814,196,2,1,2,2,N," "');
      wString.Add('A814,172,2,1,2,2,N,"Vendedor: '+DMVENDEDOR.QVendedorNOME.Text+'"');
      wString.Add('A814,124,2,1,2,2,N,"E-mail: '  +DMVendedor.QVendedorDESC_E_MAIL.Text+'"');
      wString.Add('A814,76,2,1,2,2,N,"Celular: '  +DMVendedor.QVendedorDESC_CELULAR.Text+'"');
      wString.Add('P1');
      try
        wString.SaveToFile(arquivo);
        ShellExecute(Handle, 'open', PChar('cmd.exe'), PChar('/c type '+ arquivo +' > '+ DMUsuario.QUsuarioDESC_IMPRESSORA_ZEBRA_EPL.Text), nil, SW_HIDE);
      finally
        Sleep(1200);
        wString.Clear;
      if FileExists(arquivo) then
        DeleteFile(arquivo);
      end;
    end;
    i := i + 1;
  end;
  DMVendedor.QVendedor.close;
  DMUsuario.QUsuario.Close;
end;
end.
