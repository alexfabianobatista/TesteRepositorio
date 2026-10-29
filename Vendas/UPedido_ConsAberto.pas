unit UPedido_ConsAberto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants,
  ActnList, ComCtrls, Menus;

type
  TFPedido_ConsAberto = class(TFTConsulta)
    Label2: TLabel;
    Label3: TLabel;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    MEProduto: TMaskEdit;
    BtConsProduto: TBitBtn;
    BtConsCadastro: TBitBtn;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedido_ConsAberto: TFPedido_ConsAberto;

implementation

uses UPedido_cl, UCadastroCons, UFilial_cl, UFilialCons, UCadastro_cl,
  UParamSistema_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFPedido_ConsAberto.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPedido do
  Begin
    QPedidoAberto.Close;
    If Trim(METexto.Text) = '' then
      QPedidoAberto.SetVariable('CADASTRO',Null)
    Else
      QPedidoAberto.SetVariable('CADASTRO',METexto.Text);
    If Trim(MEFilial.Text) = '' then
      QPedidoAberto.SetVariable('FILIAL',Null)
    Else
      QPedidoAberto.SetVariable('FILIAL',MEFilial.Text);
    If Trim(MEProduto.Text) = '' then
      QPedidoAberto.SetVariable('PRODUTO',Null)
    Else
      QPedidoAberto.SetVariable('PRODUTO',MEProduto.Text);

    QPedidoAberto.Open;
  end;
end;

procedure TFPedido_ConsAberto.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    //METextoExit(Self);
  End;

end;

procedure TFPedido_ConsAberto.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
   // MEFilialExit(Self);
  End;
end;

procedure TFPedido_ConsAberto.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFPedido_ConsAberto.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
