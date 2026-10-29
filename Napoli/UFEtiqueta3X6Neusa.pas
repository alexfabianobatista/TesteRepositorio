unit UFEtiqueta3X6Neusa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TFEtiqueta3X6Neusa = class(TForm)
    Label1: TLabel;
    MeDescricao1: TMaskEdit;
    Label2: TLabel;
    MeDescricao2: TMaskEdit;
    Label3: TLabel;
    MeDescricao3: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    MeQuantidade: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEtiqueta3X6Neusa: TFEtiqueta3X6Neusa;

implementation

uses UEtiquetas_Cl, UProdutoRelatorio_cl;

{$R *.dfm}

procedure TFEtiqueta3X6Neusa.BitBtn1Click(Sender: TObject);
Var  wNumEtiquetas : Integer;
begin
  if not DMEtiquetas.CDEtiquetas.Active then
     DMEtiquetas.CDEtiquetas.CreateDataSet;
  DMEtiquetas.CDEtiquetas.Open;
  DMEtiquetas.CDEtiquetas.EmptyDataSet;

  for wNumEtiquetas := StrToInt(Trim(MeQuantidade.Text))
      downto 1 do
  begin
    DMEtiquetas.CDEtiquetas.Append;
    If Trim(MeDescricao1.Text) <> '' Then
       DMEtiquetas.CDEtiquetasDESCRICAO1.Value := Trim(MeDescricao1.Text);
    DMEtiquetas.CDEtiquetasDESCRICAO1.Value := Trim(MeDescricao1.Text);
    If Trim(MeDescricao2.Text) <> '' Then
       DMEtiquetas.CDEtiquetasDESCRICAO2.Value := Trim(MeDescricao2.Text);
    if Trim(MeDescricao3.Text) <> '' Then
       DMEtiquetas.CDEtiquetasDESCRICAO3.Value := Trim(MeDescricao3.Text);
    DMEtiquetas.CDEtiquetas.Post;
  end;
  DMProdutoRelatorio.ImprimeEtiquetaZebra3x6(DMEtiquetas.CDEtiquetas);
  DMEtiquetas.CDEtiquetas.Close;
end;

end.
