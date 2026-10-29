unit UContratoArrozCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFContratoArrozCons = class(TFTConsulta)
    Label2: TLabel;
    BtConsCadastro: TBitBtn;
    Label3: TLabel;
    MeProduto: TMaskEdit;
    BitBtn1: TBitBtn;
    MeData: TMaskEdit;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoArrozCons: TFContratoArrozCons;

implementation

uses UNotaEntrada_cl, UContratoArroz_cl, UCadastroCons, UProdutoCons, UCadastro_cl,
  UProduto_cl;

{$R *.DFM}

procedure TFContratoArrozCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFContratoArrozCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFContratoArrozCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMContratoArroz do
  Begin
    QContrato_ArrozCons.Close;
    If Trim(MEData.Text) <> '' Then
      QContrato_ArrozCons.SetVariable('DT_INICIAL',StrToDate(MEData.Text))
    Else
      QContrato_ArrozCons.SetVariable('DT_INICIAL',Null);

    If Trim(METexto.Text) <> '' Then
      QContrato_ArrozCons.SetVariable('CODIGO',METexto.Text)
    Else
      QContrato_ArrozCons.SetVariable('CODIGO',Null);

    If Trim(MEProduto.Text) <> '' Then
      QContrato_ArrozCons.SetVariable('PRODUTO',MEProduto.Text)
    Else
      QContrato_ArrozCons.SetVariable('PRODUTO',Null);

    QContrato_ArrozCons.Open;
  End;
end;

end.
