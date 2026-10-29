unit UContratoVenda_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, Menus;

type
  TFContrato_VendaCons = class(TFTConsulta)
    MECodFilial: TMaskEdit;
    Label2: TLabel;
    MEFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MECodCliente: TMaskEdit;
    Label3: TLabel;
    MECliente: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MECodProduto: TMaskEdit;
    Label4: TLabel;
    MEProduto: TMaskEdit;
    SbProduto: TSpeedButton;
    MECodCorretora: TMaskEdit;
    Label5: TLabel;
    EdCorretora: TMaskEdit;
    SpeedButton4: TSpeedButton;
    GroupBox5: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    RgSaldoEmbarque: TRadioGroup;
    RgMercado: TRadioGroup;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodClienteExit(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MECodCorretoraExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_VendaCons: TFContrato_VendaCons;

implementation

uses Ucontrato_cl, UFilialCons, UFilial_cl, UOracle_cl, UCadastroCons,
  UCadastro_cl, UProdutoCons, UProduto_cl, UBancosCons, UBancoAgencia_cl,
  UContaCorrenteCons, UUsuario_cl;

{$R *.DFM}

procedure TFContrato_VendaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MECodFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
      MECodFilialExit(Self);
    end;
end;

procedure TFContrato_VendaCons.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
    MEFilial.Clear;
end;

procedure TFContrato_VendaCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = MrOk then
    begin
      MECodCliente.text:=DMCadastro.QCadastroConsCod_Cadastro.text;
      MECodClienteExit(Self);
    end;
end;

procedure TFContrato_VendaCons.MECodClienteExit(Sender: TObject);
begin
  inherited;
  if trim(MECodCliente.text)<>'' then
    MECliente.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text)
  else
    MECliente.Clear;
end;

procedure TFContrato_VendaCons.SbProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FprodutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    begin
      MECodProduto.text:=DMProduto.QprodutoConsCod_Produto.Text;
      MECodProdutoExit(Self);
    end;
end;

procedure TFContrato_VendaCons.MECodProdutoExit(Sender: TObject);
begin
  inherited;
  if trim(MECodProduto.text)<>'' then
    MEProduto.text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text)
  else
    MEProduto.Clear;
end;

procedure TFContrato_VendaCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    MeCodCorretora.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFContrato_VendaCons.MECodCorretoraExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodCorretora.text)<>'' then
    EdCorretora.text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCorretora.Text)
  else
    EdCorretora.Clear;
end;

procedure TFContrato_VendaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'AGRICOLA');
  with DMContrato do
    begin
      MontaSql(0,0,-1,RgSaldoEmbarque.ItemIndex,MECodFilial.Text,MECodCliente.text,MECodProduto.Text,MECodCorretora.text,METexto.text,MeDtInicial.Text,MeDtFinal.Text,RgMercado.ItemIndex);
    end;
end;

procedure TFContrato_VendaCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMContrato.QContrato_VendCons; //evita para de funcionar pela perda do dataset
end;

end.
