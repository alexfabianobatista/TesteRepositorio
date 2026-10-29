unit UEmissaoEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFEmissaoEtiquetas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MeCodigo: TMaskEdit;
    MeDescricao: TMaskEdit;
    MePreco: TMaskEdit;
    MeQuantidade: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    MeDesc_Unidade: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmissaoEtiquetas: TFEmissaoEtiquetas;

implementation

uses UEtiquetas_Cl, UProdutoRelatorio_cl;

{$R *.dfm}

procedure TFEmissaoEtiquetas.BitBtn1Click(Sender: TObject);
Var  wNumEtiquetas : Integer;
begin
  if not DMEtiquetas.CDEtiquetas.Active then
     DMEtiquetas.CDEtiquetas.CreateDataSet;
  DMEtiquetas.CDEtiquetas.Open;
  DMEtiquetas.CDEtiquetas.EmptyDataSet;

  If Trim(MeDescricao.Text) = '' Then
     Raise Exception.Create('Preencher descrição produto');
  If Trim(MeQuantidade.Text) = '' Then
     Raise Exception.Create('Preencher quantidade de etiquetas');

  for wNumEtiquetas := StrToInt(Trim(MeQuantidade.Text))
      downto 1 do
  begin
    DMEtiquetas.CDEtiquetas.Append;
    If Trim(MeCodigo.Text) <> '' Then
       DMEtiquetas.CDEtiquetasCOD_PRODUTO.Value := Trim(MeCodigo.Text);
    DMEtiquetas.CDEtiquetasDESC_PRODUTO.Value := Trim(MeDescricao.Text);
    If Trim(MePreco.Text) <> '' Then
       DMEtiquetas.CDEtiquetasVAL_PRODUTO.Value := StrToFloat(Trim(MePreco.Text));
    if Trim(MeDesc_Unidade.Text) <> '' Then
       DMEtiquetas.CDEtiquetasdesc_unidade.Value := Trim(MeDesc_Unidade.Text);
    DMEtiquetas.CDEtiquetas.Post;
  end;
  DMProdutoRelatorio.ImprimeEtiquetaZebra(DMEtiquetas.CDEtiquetas);
  DMEtiquetas.CDEtiquetas.Close;
end;

procedure TFEmissaoEtiquetas.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
