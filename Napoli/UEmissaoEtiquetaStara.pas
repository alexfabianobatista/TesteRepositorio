unit UEmissaoEtiquetaStara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TFEmissaoEtiquetaStara = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    MeDescricao: TMaskEdit;
    Label4: TLabel;
    MeQuantidade: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    MeCodOriginal: TMaskEdit;
    Label6: TLabel;
    MeLocalizacao: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmissaoEtiquetaStara: TFEmissaoEtiquetaStara;

implementation
uses UEtiquetas_Cl, UProdutoRelatorio_cl;

{$R *.dfm}

procedure TFEmissaoEtiquetaStara.BitBtn1Click(Sender: TObject);
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

  for wNumEtiquetas := StrToInt(Trim(MeQuantidade.Text)) downto 1 do
  begin
    DMEtiquetas.CDEtiquetas.Append;
    DMEtiquetas.CDEtiquetasDESC_PRODUTO.Value := Trim(MeDescricao.Text);
    If Trim(MeCodOriginal.Text) <> '' Then
       DMEtiquetas.CDEtiquetascod_original.Value := Trim(MeCodOriginal.Text);
    If Trim(MeLocalizacao.Text) <> '' Then
       DMEtiquetas.CDEtiquetasdesc_localizacao.Value := Trim(MeLocalizacao.Text);
    DMEtiquetas.CDEtiquetas.Post;
  end;
  DMProdutoRelatorio.ImprimeEtiquetaZebraDisam(DMEtiquetas.CDEtiquetas);
  DMEtiquetas.CDEtiquetas.Close;
end;

end.
