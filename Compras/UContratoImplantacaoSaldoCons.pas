unit UContratoImplantacaoSaldoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Db, Grids, DBGrids, Mask, Buttons, variants;

type
  TFContratoImplantacaoSaldoCons = class(TFTConsulta)
    EDCod_Cadastro: TEdit;
    GroupBox1: TGroupBox;
    MEDT_I: TMaskEdit;
    MEDT_F: TMaskEdit;
    BtConsCadastro: TBitBtn;
    Label3: TLabel;
    MeProduto: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoImplantacaoSaldoCons: TFContratoImplantacaoSaldoCons;

implementation

uses UContratoArroz_cl, UCadastroCons, UProdutoCons, UProduto_cl, UCadastro_cl;

{$R *.DFM}

procedure TFContratoImplantacaoSaldoCons.BtConsCadastroClick(
  Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    EDCod_Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFContratoImplantacaoSaldoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMContratoArroz do
  Begin
    QContratoImplantacaoSaldoCons.Close;
    If Trim(MEDT_I.Text) <> '' Then
      QContratoImplantacaoSaldoCons.SetVariable('DT_IMPLANTACAO_I',StrToDate(MEDT_I.Text))
    Else
      QContratoImplantacaoSaldoCons.SetVariable('DT_IMPLANTACAO_I',Null);

    If Trim(MEDT_F.Text) <> '' Then
      QContratoImplantacaoSaldoCons.SetVariable('DT_IMPLANTACAO_F',StrToDate(MEDT_F.Text))
    Else
      QContratoImplantacaoSaldoCons.SetVariable('DT_IMPLANTACAO_F',Null);

    If Trim(MEProduto.Text) <> '' Then
      QContratoImplantacaoSaldoCons.SetVariable('COD_PRODUTO',MEProduto.Text)
    Else
      QContratoImplantacaoSaldoCons.SetVariable('COD_PRODUTO',Null);

    QContratoImplantacaoSaldoCons.Open;
  End;
end;

procedure TFContratoImplantacaoSaldoCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

end.
