unit UGrupoProduto_Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFGrupoProduto_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label61: TLabel;
    ME1Filial: TMaskEdit;
    ED1Filial: TEdit;
    BT1Filial: TBitBtn;
    GroupBox11: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    ME1DtInicial: TMaskEdit;
    ME1DtFinal: TMaskEdit;
    Label79: TLabel;
    ME1Vendedor: TMaskEdit;
    Bt1Vendedor: TBitBtn;
    Ed1Vendedor: TEdit;
    TabSheet2: TTabSheet;
    Me2Grupo: TMaskEdit;
    Bt2Grupo: TBitBtn;
    Ed2DescGrupo: TEdit;
    Label1: TLabel;
    Me2Supervisor: TMaskEdit;
    Bt2Supervisor: TBitBtn;
    Ed2DescSupervisor: TEdit;
    Label2: TLabel;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    Me3Tabela: TMaskEdit;
    bt3Tabela: TBitBtn;
    Ed3Tabela: TEdit;
    Rg3Situacao: TRadioGroup;
    Rg1TipoRelatorio: TRadioGroup;
    Label4: TLabel;
    Me2Ano: TMaskEdit;
    Label5: TLabel;
    Me2Mes: TMaskEdit;
    procedure ME1FilialExit(Sender: TObject);
    procedure BT1FilialClick(Sender: TObject);
    procedure ME1VendedorExit(Sender: TObject);
    procedure Bt1VendedorClick(Sender: TObject);
    procedure Me2GrupoExit(Sender: TObject);
    procedure Bt2GrupoClick(Sender: TObject);
    procedure Me2SupervisorExit(Sender: TObject);
    procedure Bt2SupervisorClick(Sender: TObject);
    procedure Me3TabelaExit(Sender: TObject);
    procedure bt3TabelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoProduto_Param: TFGrupoProduto_Param;

implementation

uses UOracle_cl, UVendedorCons, UVendedor_cl, UFilialCons, UFilial_cl,
  UGrupoProduto_Cons, UGrupoProduto_cl, UPrecoPocket1_Cons,
  UPrecoPocket1_cl;

{$R *.dfm}

procedure TFGrupoProduto_Param.ME1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Filial.Text) <> '' then
    ED1Filial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM  TB_FILIAL',
                    'COD_FILIAL = '+ME1Filial.text)
  else
    ED1Filial.Text := 'Todas';

end;

procedure TFGrupoProduto_Param.BT1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
  ME1FilialExit(Self);

end;

procedure TFGrupoProduto_Param.ME1VendedorExit(Sender: TObject);
begin
  inherited;
 If Trim(Me1Vendedor.Text) <> '' Then
    Ed1Vendedor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                    'COD_VENDEDOR = '+Me1Vendedor.text)
  Else
    Ed1Vendedor.Text := 'Todos';

end;

procedure TFGrupoProduto_Param.Bt1VendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    Me1Vendedor.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  Me1VendedorExit(Self);

end;

procedure TFGrupoProduto_Param.Me2GrupoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Grupo.Text) <> '' then
    ED2DescGrupo.text:=DMOracle.BuscaNome('SELECT DESC_GRUPO_PRODUTO FROM  TB_GRUPO_PRODUTO',
                    'COD_GRUPO_PRODUTO = '+ME2Grupo.text)
  else
    ED2DescGrupo.Text := 'Todas';
end;

procedure TFGrupoProduto_Param.Bt2GrupoClick(Sender: TObject);
begin
  inherited;
  if FGrupoProduto_Cons = Nil then
    FGrupoProduto_Cons := TFGrupoProduto_Cons.Create(Application);
  if FGrupoProduto_Cons.ShowModal = mrOk then
    ME2Grupo.Text := DMGrupoProduto.QGrupoProduto_ConsCod_Grupo_Produto.Text;
  ME2GrupoExit(Self);

end;

procedure TFGrupoProduto_Param.Me2SupervisorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Supervisor.Text) <> '' then
    ED2DescSupervisor.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                    'COD_VENDEDOR = '+ME2Supervisor.text)
  else
    ED2DescSupervisor.Text := 'Todas';
end;

procedure TFGrupoProduto_Param.Bt2SupervisorClick(Sender: TObject);
begin
  inherited;
   if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    ME2Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
  ME2SupervisorExit(Self);
end;

procedure TFGrupoProduto_Param.Me3TabelaExit(Sender: TObject);
begin
  inherited;
  Ed3Tabela.Text := DMOracle.BuscaParametro('DESC_TABELA','TB_TABELA_POCKET','COD_TABELA_POCKET',Me3Tabela.text,'Todas');

end;

procedure TFGrupoProduto_Param.bt3TabelaClick(Sender: TObject);
begin
  inherited;
  if FPrecoPocket1_Cons = Nil then
    FPrecoPocket1_Cons := TFPrecoPocket1_Cons.Create(Application);
  if FPrecoPocket1_Cons.ShowModal = mrOk then
    Me3Tabela.Text := DMPrecoPocket1.QPrecoPocket_ConsCOD_TABELA_POCKET.Text;
  Me3TabelaExit(Self);

end;

end.
