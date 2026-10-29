unit UPedidoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus;

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
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtDepartamentoConsClick(Sender: TObject);
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
  UDepartamentoCons, UDepartamento_cl, UParamSistema_cl, UPedidoCad,
  URPedido_Espelho, UOracle_cl;

{$R *.DFM}

procedure TFPedidoCons.BtProcurarClick(Sender: TObject);
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
       
    If RgSituacao.ItemIndex = 0 Then
       QPedidoCons.SetVariable('IND_SITUACAO',Null)
    else
       QPedidoCons.SetVariable('IND_SITUACAO','1');

    if Trim(MEDataI.Text) <> '/  /' Then
       QPedidoCons.SetVariable('DATA_I',MEDataI.Text);
    If RgListarAtendidos.ItemIndex = 0 Then
       QPedidoCons.SetVariable('SUBSTITUICAO','1 = 1')
    Else
       QPedidoCons.SetVariable('SUBSTITUICAO','TB_PEDIDO_CAB.COD_PEDIDO_CAB IN (SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM WHERE (QT_PEDIDO - QT_ATENDIDO - QT_CANCELADO) <> 0 AND TB_PEDIDO_ITEM.COD_PEDIDO_CAB = TB_PEDIDO_CAB.COD_PEDIDO_CAB)');

    QPedidoCons.Open;
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
  MEDataI.Text := DateToStr(Date-30);

end;

procedure TFPedidoCons.FormActivate(Sender: TObject);
begin
  inherited;
  DBGrid1.SetFocus;
end;

procedure TFPedidoCons.BtDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil Then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk Then
    MeDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;

end;

end.
