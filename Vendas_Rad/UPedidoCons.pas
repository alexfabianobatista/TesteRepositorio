unit UPedidoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

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
    RgQtZero: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoCons: TFPedidoCons;

implementation

uses UCadastroCons, UFilialCons, UCadastro_cl, UFilial_cl,
     UEstoque_cl, UPedido_cl, UPedidoItensCons, UUsuario_cl;

{$R *.DFM}

procedure TFPedidoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
//  DmUsuario.Checar_Filial_Usuario(Trim(MEFilial.Text),'VENDA'); nao usado devido a tela FNotaSaida fazer uso desta tela de consulta
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

    if Trim(MEDataI.Text) <> '/  /' Then
       QPedidoCons.SetVariable('DATA_I',MEDataI.Text);
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
    FPedidoItensCons := TFPedidoItensCons.Create(Application);
  FPedidoItensCons.ShowModal;
end;

procedure TFPedidoCons.FormActivate(Sender: TObject);
begin
  inherited;
  DBGrid1.SetFocus;
end;

end.
