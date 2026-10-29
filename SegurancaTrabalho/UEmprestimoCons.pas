unit UEmprestimoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, variants, Menus;

type
  TFEmprestimoCons = class(TFTConsulta)
    MEFuncionario: TMaskEdit;
    MEProduto: TMaskEdit;
    Equipamento: TLabel;
    GroupBox1: TGroupBox;
    MEDt_Emprestimo_I: TMaskEdit;
    MEDt_Emprestimo_F: TMaskEdit;
    BTFuncionarioCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    RG1IndRetornavel: TRadioGroup;
    Label2: TLabel;
    MECaracteristica: TMaskEdit;
    BTCaractristica: TBitBtn;
    RGSituacao: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEFilial: TMaskEdit;
    BtFilial: TBitBtn;
    procedure BTFuncionarioConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure BTCaractristicaClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmprestimoCons: TFEmprestimoCons;

implementation

uses UEmprestimo_cl, UFFuncionarioCons, UFuncionario_cl,
  UProdutoSegurancaCons, UProdutoSeguranca_cl,
  UCaracteristicaProdutoCons, UCaracteristicaProduto_cl, UFilialCons,
  UFilial_cl;

{$R *.DFM}

procedure TFEmprestimoCons.BTFuncionarioConsClick(Sender: TObject);
begin
  inherited;
  if FFuncionarioCons = nil then
   FFuncionarioCons:=TFFuncionarioCons.create(application);
  if FFuncionarioCons.showmodal = mrok then
    FEmprestimoCons.MEFuncionario.Text := DMFuncionario.QFuncionarioConsCod_Funcionario.Text;

end;

procedure TFEmprestimoCons.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
   FProdutoSegurancaCons:=TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrok then
    FEmprestimoCons.MEProduto.Text := DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFEmprestimoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEmprestimo do
  Begin
    QEmprestimoCons.Close;
    if Trim(MEFuncionario.Text) = '' then
      QEmprestimoCons.SetVariable('COD_FUNCIONARIO',Null)
    else
      QEmprestimoCons.SetVariable('COD_FUNCIONARIO',Trim(MEFuncionario.Text));
    if Trim(MEProduto.Text) = '' then
      QEmprestimoCons.SetVariable('COD_PRODUTO',Null)
    else
      QEmprestimoCons.SetVariable('COD_PRODUTO',Trim(MECaracteristica.Text));
    if Trim(MECaracteristica.Text) = '' then
      QEmprestimoCons.SetVariable('COD_CARACTERISTICA_PRODUTO',Null)
    else
      QEmprestimoCons.SetVariable('COD_CARACTERISTICA_PRODUTO',Trim(MECaracteristica.Text));
    if Trim(MEFilial.Text) = '' then
      QEmprestimoCons.SetVariable('COD_FILIAL',Null)
    else
      QEmprestimoCons.SetVariable('COD_FILIAL',Trim(MEFilial.Text));
    if Trim(MEDT_Emprestimo_I.Text) = '' then
      QEmprestimoCons.SetVariable('DATA_I',Null)
    else
      QEmprestimoCons.SetVariable('DATA_I',Trim(MEDT_Emprestimo_I.Text));
    if Trim(MEDT_Emprestimo_F.Text) = '' then
      QEmprestimoCons.SetVariable('DATA_F',Null)
    else
      QEmprestimoCons.SetVariable('DATA_F',Trim(MEDT_Emprestimo_F.Text));
    if FEmprestimoCons.RG1IndRetornavel.ItemIndex = 0 then
       QEmprestimoCons.SetVariable('IND_RETORNAVEL','SIM')
    else if FEmprestimoCons.RG1IndRetornavel.ItemIndex = 1 then
       QEmprestimoCons.SetVariable('IND_RETORNAVEL','NAO')
    else
       QEmprestimoCons.SetVariable('IND_RETORNAVEL',NULL);
    if FEmprestimoCons.RGSituacao.ItemIndex = 0 then
       QEmprestimoCons.SetVariable('SITUACAO',NULL)
    else if FEmprestimoCons.RGSituacao.ItemIndex = 1 then
       QEmprestimoCons.SetVariable('SITUACAO','DIGITADO')
    else
       QEmprestimoCons.SetVariable('SITUACAO','CONFIRMADO');
    QEmprestimoCons.Open;
  End;
end;

procedure TFEmprestimoCons.BTCaractristicaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    MECaracteristica.Text := DMCaracteristicaProduto.QCaracteristicaProdutoConsCod_Caracteristica_Produto.Text;
end;

procedure TFEmprestimoCons.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showModal = mrOk then
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

end.
