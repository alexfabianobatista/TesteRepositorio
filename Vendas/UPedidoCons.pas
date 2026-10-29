unit UPedidoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus,jpeg, ActnList, ComCtrls;

type
  TFPedidoCons = class(TFTConsulta)
    Label3: TLabel;
    Label4: TLabel;
    MEFilial: TMaskEdit;
    MEDataI: TMaskEdit;
    BtConsFilial: TBitBtn;
    BtConsCadastro: TBitBtn;
    Label2: TLabel;
    MePedido: TMaskEdit;
    Bt_PedidoItensCons: TBitBtn;
    RGCodigoAuxiliar: TRadioGroup;
    Label5: TLabel;
    MeDepartamento: TMaskEdit;
    BtDepartamentoCons: TBitBtn;
    RgSituacao: TRadioGroup;
    RgListarAtendidos: TRadioGroup;
    MECidade: TMaskEdit;
    BtCidadeCons: TBitBtn;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    LblChassi: TLabel;
    MEChassi: TMaskEdit;
    Label7: TLabel;
    MeVendedor: TMaskEdit;
    BtVendedor: TBitBtn;
    PanelSituacaoPedidoWeb: TPanel;
    LblCancelado: TLabel;
    LblFaturado: TLabel;
    LblAprovadoImpresso: TLabel;
    LblAprovado: TLabel;
    LblEmbarque: TLabel;
    Label8: TLabel;
    MePlaca: TMaskEdit;
    SBVeiculo: TSpeedButton;
    RgCondicao: TRadioGroup;
    MeObs: TMaskEdit;
    Label9: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtDepartamentoConsClick(Sender: TObject);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
    procedure BtCidadeConsClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtVendedorClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
  private
    { Private declarations }
    wTela_Chamou : String;
  public
    { Public declarations }
    Property pTela_Chamou : String Read wTela_Chamou Write wTela_Chamou;

  end;

var
  FPedidoCons: TFPedidoCons;

implementation

uses UCadastroCons, UFilialCons, UCadastro_cl, UFilial_cl,
     UEstoque_cl, UPedido_cl, UPedidoItensCons, UUsuario_cl,
  UDepartamentoCons, UDepartamento_cl, UParamSistema_cl, UCidade_cl, UCidadeCons,
  UImpressoraFiscal, UOracle_cl, UVendedorCons, UVendedor_cl, UVeiculo_cl,UVeiculoCons,
  UBiblioteca;

{$R *.DFM}

procedure TFPedidoCons.BtProcurarClick(Sender: TObject);
var
  wDescTipoFuncionario : String;
  i: Integer;
begin
  inherited;
  If pTela_Chamou = 'PEDIDO' Then
     DmUsuario.Checar_Filial_Usuario(Trim(MEFilial.Text),'VENDA');
  with DMPedido do
  begin

    QPedidoCons.Close;
    if Trim(METexto.Text) <> '' Then
       QPedidoCons.SetVariable('CADASTRO',METexto.Text)
    else
       QPedidoCons.SetVariable('CADASTRO',Null);

    if Trim(MePedido.Text) <> '' Then
       QPedidoCons.SetVariable('NUM_PEDIDO',MePedido.Text)
    else
       QPedidoCons.SetVariable('NUM_PEDIDO',Null);

    if Trim(MEFilial.Text) <> '' Then
       QPedidoCons.SetVariable('FILIAL',MEFilial.Text)
    else
       QPedidoCons.SetVariable('FILIAL',Null);

    if Trim(MEDepartamento.Text) <> '' Then
       QPedidoCons.SetVariable('COD_DEPARTAMENTO',MEDepartamento.Text)
    else
       QPedidoCons.SetVariable('COD_DEPARTAMENTO',Null);

    If Trim(MECidade.Text) <> '' Then
      QPedidoCons.SetVariable('COD_CIDADE', Trim(MECidade.Text))
    else
      QPedidoCons.SetVariable('COD_CIDADE', Null);

    If RgSituacao.ItemIndex = 0 Then
       QPedidoCons.SetVariable('IND_SITUACAO',Null)
    else
       QPedidoCons.SetVariable('IND_SITUACAO','2');

    if Trim(MEChassi.Text) <> '' Then
      QPedidoCons.SetVariable('DESC_CHASSI', Trim(MEChassi.Text))
    else
      QPedidoCons.SetVariable('DESC_CHASSI', Null);

    if Trim(MePlaca.Text) <> '-' then
      QPedidoCons.SetVariable('NUM_PLACA', Trim(MePlaca.Text))
    else
      QPedidoCons.SetVariable('NUM_PLACA', Null);
    // serve para o vendedor somente conseguir consultar suas vendas rafael 04/06/2014 solicitado por marcos cemapa
    wDescTipoFuncionario := DMOracle.BuscaNome('SELECT DESC_TIPO_FUNCIONARIO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
    if (not DMUsuario.Privilegiado) and
       (wDescTipoFuncionario = 'VENDEDOR') And  //colocado pelo César a pedido do Marcos da radiolandia 15/02/2021
       (DmParamSistema.CodEmpresa <> 'RADIO') and (DMParamSistema.CodEmpresa <> 'FERRAGMED') and   //Adicionado FerragemMedianeira, solicitado por Dani. 27/10/2023 - Alex.
       (DMParamSistema.CodEmpresa <> 'DINIZ') Then  //Adicionado Diniz, Solicitado por Edson 02/12/2024 - Andre.
      QPedidoCons.SetVariable('COD_VENDEDOR',IntToStr(DMusuario.CodVendedorPadrao))
    else
      if Trim(MeVendedor.Text) <> '' Then
        QPedidoCons.SetVariable('COD_VENDEDOR',MeVendedor.Text)
      else
        QPedidoCons.SetVariable('COD_VENDEDOR',Null);
    if Trim(MeObs.Text) <> '' Then
      QPedidoCons.SetVariable('DESC_OBSERVACAO','%'+Trim(MeObs.Text)+'%')
    else
      QPedidoCons.SetVariable('DESC_OBSERVACAO', Null);

    if Trim(MEDataI.Text) <> '/  /' Then
       QPedidoCons.SetVariable('DATA_I',MEDataI.Text);
    If (RgListarAtendidos.ItemIndex = 1) Then
      QPedidoCons.SetVariable('ATENDIDOS','N')
    else
      QPedidoCons.SetVariable('ATENDIDOS',NULL);
    Case RgCondicao.ItemIndex Of
      0 : QPedidoCons.SetVariable('IND_TIPO_PAGAMENTO','A VISTA');
      1 : QPedidoCons.SetVariable('IND_TIPO_PAGAMENTO','A PRAZO');
      2 : QPedidoCons.SetVariable('IND_TIPO_PAGAMENTO',Null);
    End;  
    QPedidoCons.Open;
    QPedidoCons.First;
  end;

end;

procedure TFPedidoCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil Then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk Then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFPedidoCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil Then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk Then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFPedidoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION')  then
  begin
    DBGrid1.Columns.Items[11].Index := 4;
    DBGrid1.Columns.Items[5].Index := 6;
    DBGrid1.Columns.Items[6].Index := 7;
  end;

  MEDataI.Text := DateToStr(Date-30);
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
     StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
  LblChassi.Visible := False;
  MEChassi.Visible  := False;
  DBGrid1.Columns.Items[12].Visible := False;

end;

procedure TFPedidoCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  With DMPedido do
  Begin
    QPedido.Close;
    QPedidoItem.Close;
    QPedido.SetVariable('PK',QPedidoConsCod_Pedido_Cab.Value);
    QPedido.Open;
    QPedidoItem.Open;
  End;
  If FPedidoItensCons = Nil then
  begin
    FPedidoItensCons := TFPedidoItensCons.Create(Application);
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FGLASS' then
      FPedidoItensCons.DBGrid1.Columns.Items[7].Index := 2;
  end;
  FPedidoItensCons.ShowModal;
end;

procedure TFPedidoCons.FormActivate(Sender: TObject);
begin
  inherited;
  DBGrid1.SetFocus;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' Then
     RGCodigoAuxiliar.Visible := True;
  DMParamSistema.QParamSistema.RefreshRecord;
  PanelSituacaoPedidoWeb.Enabled := DMParamSistema.QParamSistemaIND_SINCRONISMO_PEDIDO_WEB.Value = 'SIM';
  if PanelSituacaoPedidoWeb.Enabled then
  begin
    LblAprovado.Font.Color := RGB(StrToInt('$27'),StrToInt('$80'),StrToInt('$e3'));

    LblAprovadoImpresso.Font.Color := clGray;

    LblEmbarque.Font.Color := RGB(StrToInt('$22'),StrToInt('$22'),StrToInt('$22'));

    LblFaturado.Font.Color := RGB(StrToInt('$3f'),StrToInt('$b6'),StrToInt('$18'));

    LblCancelado.Font.Color := RGB(StrToInt('$ff'),StrToInt('$00'),StrToInt('$39'));
  end;
end;

procedure TFPedidoCons.BtDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil Then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk Then
    MeDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;

end; 

procedure TFPedidoCons.DSConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMPedido do
    begin
      QImagem_Consulta.Close;
      QImagem_Consulta.SetVariable('COD_PEDIDO_CAB', DMPedido.QPedidoConsCOD_PEDIDO_CAB.Value);
      QImagem_Consulta.Open;  
    end;
end;


procedure TFPedidoCons.BtCidadeConsClick(Sender: TObject);
begin
  inherited;
  If FCidadeCons = Nil Then
    FCidadeCons := TFCidadeCons.Create(Application);
  If FCidadeCons.ShowModal = mrOk Then
    MECidade.Text := DMCidade.QCidadeConsCOD_CIDADE.Text;
end;

procedure TFPedidoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFPedidoCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (DMPedido.QPedidoConsCOD_PEDIDO_WEB.Value > 0) and (Column.FieldName = 'COD_PEDIDO_CAB') Then
  Begin
    case DMPedido.QPedidoConsSTEP_PEDIDO_WEB.Value of
      1:
      begin
        DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$27'),StrToInt('$80'),StrToInt('$e3'));
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
      2:
      begin
        DBGrid1.Canvas.Brush.Color := clSilver;
        DBGrid1.Canvas.Font.Color := clBlack;
      end;
      3:
      begin
        DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$22'),StrToInt('$22'),StrToInt('$22'));
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
      4:
      begin
        DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$3f'),StrToInt('$b6'),StrToInt('$18'));
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
      else
      begin
        DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$ff'),StrToInt('$00'),StrToInt('$39'));
        DBGrid1.Canvas.Font.Color := clWhite;
      end;
    end;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else if (DMPedido.QPedidoConsCOD_PEDIDO_MARKETPLACE.Value <> '') and (Column.FieldName = 'COD_PEDIDO_CAB') then
  begin
    if DMPedido.QPedidoConsDESC_SITUACAO_MARKETPLACE.Text = 'APPROVED' then
    begin
      DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$27'),StrToInt('$80'),StrToInt('$e3'));
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMPedido.QPedidoConsDESC_SITUACAO_MARKETPLACE.Text = 'INVOICE' then
    begin
      DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$3f'),StrToInt('$b6'),StrToInt('$18'));
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMPedido.QPedidoConsDESC_SITUACAO_MARKETPLACE.Text = 'SHIPPED' then
    begin
      DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$22'),StrToInt('$22'),StrToInt('$22'));
      DBGrid1.Canvas.Font.Color := clWhite;
    end
    else if DMPedido.QPedidoConsDESC_SITUACAO_MARKETPLACE.Text = 'CANCELED' then
    begin
      DBGrid1.Canvas.Brush.Color := RGB(StrToInt('$ff'),StrToInt('$00'),StrToInt('$39'));
      DBGrid1.Canvas.Font.Color := clWhite;
    end;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFPedidoCons.BtVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil Then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk Then
    MeVendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
end;

procedure TFPedidoCons.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
    MePlaca.Text := DMVeiculo.QVeiculoConsNUM_PLACA.Value;

end;

end.
