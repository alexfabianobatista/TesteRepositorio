unit UContratoCPRCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFContratoCPRCons = class(TFTConsulta)
    GBEmissao: TGroupBox;
    MEEmissaoI: TMaskEdit;
    MEEmissaoF: TMaskEdit;
    GroupBox1: TGroupBox;
    MEVencimentoI: TMaskEdit;
    MEVencimentoF: TMaskEdit;
    Label2: TLabel;
    EdCodProduto: TEdit;
    Label3: TLabel;
    EdCodCadastro: TEdit;
    BtProdutoCons: TSpeedButton;
    BtCadastroCons: TSpeedButton;
    EdProdutoDesc: TEdit;
    EdCadastroNome: TEdit;
    procedure BtProdutoConsClick(Sender: TObject);
    procedure BtCadastroConsClick(Sender: TObject);
    procedure EdCodCadastroExit(Sender: TObject);
    procedure EdCodProdutoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoCPRCons: TFContratoCPRCons;

implementation

uses UContratoCPR, UContratoCPR_cl, UProdutoCons, UCadastroCons,
  UProduto_cl, UCadastro_cl, UOracle_cl;

{$R *.DFM}

procedure TFContratoCPRCons.BtProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    EdProdutoDesc.Text:=DMProduto.QProdutoConsDesc_Produto.Value;
    EdCodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.Value);
  end;  
end;

procedure TFContratoCPRCons.BtCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    EdCadastroNome.Text:=DMCadastro.QCadastroConsNome.Value;
    EdCodCadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
  end;
end;

procedure TFContratoCPRCons.EdCodCadastroExit(Sender: TObject);
begin
  inherited;
  if Trim(EdCodCadastro.Text) <> '' then
     EdCadastroNome.Text:=DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+EdCodCadastro.text)
  else
     EdCadastroNome.Clear;
end;

procedure TFContratoCPRCons.EdCodProdutoExit(Sender: TObject);
begin
  inherited;
 if Trim(EdCodProduto.Text) <> '' then
    EdProdutoDesc.Text:=DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+EdCodProduto.text)
  else
    EdProdutoDesc.Clear;
end;

procedure TFContratoCPRCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMContrato_CPR do
  begin
    QContrato_CPRCons.Close;
    if Trim(EdCodProduto.Text) = '' then
       QContrato_CPRCons.SetVariable('COD_PRODUTO',Null)
    else
       QContrato_CPRCons.SetVariable('COD_PRODUTO',EdCodProduto.Text);

    if Trim(METexto.Text) = '' then
       QContrato_CPRCons.SetVariable('NUM_CONTRATO_CPR',Null)
    else
       QContrato_CPRCons.SetVariable('NUM_CONTRATO_CPR',METexto.Text);

    if Trim(EdCodCadastro.Text) = '' then
       QContrato_CPRCons.SetVariable('COD_CADASTRO',Null)
    else
       QContrato_CPRCons.SetVariable('COD_CADASTRO',EdCodCadastro.Text);

    if Trim(MEEmissaoI.Text) = '' then
       QContrato_CPRCons.SetVariable('mDTEmissaoI',Null)
    else
       QContrato_CPRCons.SetVariable('mDTEmissaoI',StrToDate(MEEmissaoI.Text));

    if Trim(MEEmissaoF.Text) = '' then
       QContrato_CPRCons.SetVariable('mDTEmissaoF',Null)
    else
       QContrato_CPRCons.SetVariable('mDTEmissaoF',StrToDate(MEEmissaoF.Text));

    if Trim(MEVencimentoI.Text) = '' then
       QContrato_CPRCons.SetVariable('mDTVencimentoI',Null)
    else
       QContrato_CPRCons.SetVariable('mDTVencimentoI',StrToDate(MEVencimentoI.Text));

    if Trim(MEVencimentoF.Text) = '' then
       QContrato_CPRCons.SetVariable('mDTVencimentoF',Null)
    else
       QContrato_CPRCons.SetVariable('mDTVencimentoF',StrToDate(MEVencimentoF.Text));

    QContrato_CPRCons.Open;

  end;
end;

end.
