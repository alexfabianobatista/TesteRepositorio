unit UDescontoProdutorCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFDescontoProdutorCons = class(TFTConsulta)
    Label2: TLabel;
    SBCadastro: TSpeedButton;
    MECadastro: TMaskEdit;
    MEProduto: TMaskEdit;
    SBProduto: TSpeedButton;
    EdCadastro: TEdit;
    EdProduto: TEdit;
    procedure SBCadastroClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDescontoProdutorCons: TFDescontoProdutorCons;

implementation

uses UDesconto_Produtor_cl, UCadastroCons, UProdutoCons, UOracle_cl,
  UUsuario_cl, UCadastro_cl, UProduto_cl;

{$R *.DFM}

procedure TFDescontoProdutorCons.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
      MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;
      EdCadastro.Text:=DMCadastro.QCadastroConsNome.Text;

end;

procedure TFDescontoProdutorCons.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutocons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    MEProduto.Text:=DMProduto.QProdutoConsCod_Produto.Text;
    EdProduto.Text:=DMProduto.QProdutoConsDesc_Produto.Text;
end;

procedure TFDescontoProdutorCons.MECadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(MECadastro.Text)<>'' then
    EdCadastro.Text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECadastro.text)

  else
    EdCadastro.Text:= 'Todos';

end;

procedure TFDescontoProdutorCons.MEProdutoExit(Sender: TObject);
begin
  inherited;
   if Trim(MEProduto.Text)<>'' then
    EdProduto.Text:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.text)
  else
    EdProduto.Text:= 'Todos';

end;

procedure TFDescontoProdutorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  //DmUsuario.Checar_Filial_Usuario( Trim(MECODFILIAL.Text),'AGRICOLA');
  with DMDescontoProdutor do
    begin
      QDescontoProdutorCons.Close;
      if Trim(MECadastro.Text)<>'' then
        QDescontoProdutorCons.SetVariable('CLIENTE',MECadastro.Text)
      else
        QDescontoProdutorCons.SetVariable('CLIENTE',Null);
      if Trim(MEProduto.Text)<>'' then
        QDescontoProdutorCons.SetVariable('PRODUTO',MEProduto.Text)
      else
        QDescontoProdutorCons.SetVariable('PRODUTO',Null);
      QDescontoProdutorCons.SetVariable('DT_VALIDADE',Null);
      QDescontoProdutorCons.Open;
    end;

end;

end.
