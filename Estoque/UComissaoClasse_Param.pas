unit UComissaoClasse_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFComissaoClasse_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label52: TLabel;
    Bt0Vendedor: TSpeedButton;
    Me0Vendedor: TMaskEdit;
    Ed0Vendedor: TMaskEdit;
    procedure Me0VendedorExit(Sender: TObject);
    procedure Bt0VendedorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComissaoClasse_Param: TFComissaoClasse_Param;

implementation

uses UOracle_cl, UVendedorCons, UVendedor_cl;

{$R *.DFM}

procedure TFComissaoClasse_Param.Me0VendedorExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Vendedor.Text)<>'' then
    Ed0Vendedor.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                         'COD_VENDEDOR = '+Me0Vendedor.Text)
  else
    Ed0Vendedor.Clear;
end;

procedure TFComissaoClasse_Param.Bt0VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
    begin
      ME0Vendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
      ME0VendedorExit(Self);
    end;

end;

end.
