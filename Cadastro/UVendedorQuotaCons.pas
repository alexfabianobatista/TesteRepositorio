unit UVendedorQuotaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus,
  UFmProduto;

type
  TFVendedorQuotaCons = class(TFTConsulta)
    SBVendedorCons: TSpeedButton;
    MEVendedorCons: TMaskEdit;
    EdVendedorCons: TEdit;
    Label3: TLabel;
    SbSupervisor: TSpeedButton;
    MeSupervisor: TMaskEdit;
    EdSupervisor: TEdit;
    FmProduto: TFmProduto;
    procedure SBVendedorConsClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure MEVendedorConsExit(Sender: TObject);
    procedure MEProdutoConsExit(Sender: TObject);
    procedure MeSupervisorExit(Sender: TObject);
    procedure SbSupervisorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorQuotaCons: TFVendedorQuotaCons;

implementation

uses UVendedor_cl, UVendedorCons, UClasseCons, UClasse_cl, UOracle_cl, UProduto_cl,
  UProdutoCons;

{$R *.DFM}

procedure TFVendedorQuotaCons.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.create(Application);
  If FVendedorCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    MEVendedorCons.Text := QVendedorConsCod_Vendedor.Text;
    MEVendedorConsExit(Self);
  End;
end;

procedure TFVendedorQuotaCons.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  {if FProdutoCons = Nil Then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  with DMProduto do
  begin
    MEProdutoCons.Text := QProdutoConsCod_Produto.Text;
    MEProdutoConsExit(Self);
  end;}
end;

procedure TFVendedorQuotaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMVendedor do
  begin
    QQuotaVendedorCons.Close;
    QQuotaVendedorCons.ClearVariables;
    if Trim(MEVendedorCons.Text) <> '' then
       QQuotaVendedorCons.SetVariable('VENDEDOR',MEVendedorCons.Text);
    if Trim(MeSupervisor.Text) <> '' then
       QQuotaVendedorCons.SetVariable('SUPERVISOR',Trim(MeSupervisor.Text));
    if Trim(FmProduto.MeProduto.Text) <> '' then
       QQuotaVendedorCons.SetVariable('PRODUTO',Trim(FmProduto.MeProduto.Text));
    QQuotaVendedorCons.Open;
  end;

end;

procedure TFVendedorQuotaCons.MEVendedorConsExit(Sender: TObject);
begin
  inherited;
  If Trim(MEVendedorCons.Text)<>'' Then
    EdVendedorCons.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+MEVendedorCons.Text)
  Else
    EdVendedorCons.Text:='TODOS';

end;

procedure TFVendedorQuotaCons.MEProdutoConsExit(Sender :TObject);
begin
  {if trim(MeProdutoCons.Text) <> '' then
    EdProdutoCons.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = ' + trim(MeProdutoCons.Text))
  else
    EdProdutoCons.Text := 'TODOS';}
end;

procedure TFVendedorQuotaCons.MeSupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(MeSupervisor.Text)<>'' Then
    EdSupervisor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+MeSupervisor.Text)
  Else
    EdSupervisor.Text:='TODOS';

end;

procedure TFVendedorQuotaCons.SbSupervisorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.create(Application);
  If FVendedorCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    MeSupervisor.Text := QVendedorConsCod_Vendedor.Text;
    MeSupervisorExit(Self);
  End;

end;

end.


