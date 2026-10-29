unit UCadastroPrecoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, UFmCadastro, Menus, DB, Grids, DBGrids, StdCtrls,
  Mask, Buttons;

type
  TFCadastroPrecoCons = class(TFTConsulta)
    FmCadastro: TFmCadastro;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroPrecoCons: TFCadastroPrecoCons;

implementation

uses UProduto_cl;

{$R *.dfm}

procedure TFCadastroPrecoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMProduto.QCadastroPrecoCons.Close;
  if Trim(FmCadastro.MeCadastro.Text) = '' then
    DMProduto.QCadastroPrecoCons.SetVariable('COD_CADASTRO', 0)
  else
    DMProduto.QCadastroPrecoCons.SetVariable('COD_CADASTRO', Trim(FmCadastro.MeCadastro.Text));
  DMProduto.QCadastroPrecoCons.Open;
end;

end.
