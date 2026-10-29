unit UEmissaoEtiquetasOsare;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFEmissaoEtiquetasOsare = class(TForm)
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
    RGTipoValor: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmissaoEtiquetasOsare: TFEmissaoEtiquetasOsare;

implementation

uses UEtiquetas_Cl, UProdutoRelatorio_cl;

{$R *.dfm}

procedure TFEmissaoEtiquetasOsare.BitBtn1Click(Sender: TObject);
Var  wNumEtiquetas : Integer;
begin
  if not DMEtiquetas.CDEtiquetas.Active then
     DMEtiquetas.CDEtiquetas.CreateDataSet;
  DMEtiquetas.CDEtiquetas.Open;
  DMEtiquetas.CDEtiquetas.EmptyDataSet;

  If Trim(MePreco.Text) = '' Then
     Raise Exception.Create('Preecha o valor para o produto.');
  If Trim(MeQuantidade.Text) = '' Then
     Raise Exception.Create('Preencha a quantidade de etiquetas.');

  for wNumEtiquetas := StrToInt(Trim(MeQuantidade.Text))
      downto 1 do
  begin
    DMEtiquetas.CDEtiquetas.Append;
    If Trim(MeCodigo.Text) <> '' Then
       DMEtiquetas.CDEtiquetasCOD_PRODUTO.Value := Trim(MeCodigo.Text);
    DMEtiquetas.CDEtiquetasDESC_PRODUTO.Value := Trim(MeDescricao.Text);
    If Trim(MePreco.Text) <> '' Then
       DMEtiquetas.CDEtiquetasVAL_PRODUTO.Value := StrToFloat(Trim(MePreco.Text));
    if (RGTipoValor.ItemIndex = 0) then
      DMEtiquetas.CDEtiquetastipo_valor.Value := '0'
    else
      DMEtiquetas.CDEtiquetastipo_valor.Value := '1';
    DMEtiquetas.CDEtiquetas.Post;
  end;
  DMProdutoRelatorio.ImprimeEtiquetaZebraOsare(DMEtiquetas.CDEtiquetas);
  DMEtiquetas.CDEtiquetas.Close;
end;

procedure TFEmissaoEtiquetasOsare.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFEmissaoEtiquetasOsare.FormCreate(Sender: TObject);
begin
   Label2.Visible := false;
   MeCodigo.Visible := false;
   Label1.Visible := false;
   MeDescricao.Visible := false;
end;

end.
