unit UIncentivo_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmCadastro;

type
  TFIncentivo_Cons = class(TFTConsulta)
    FmCadastro: TFmCadastro;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIncentivo_Cons: TFIncentivo_Cons;

implementation

uses UIncentivo_cl;

{$R *.dfm}

procedure TFIncentivo_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMIncentivo.QIncentivo_Cons.Close;
  If Trim(FMCadastro.MeCadastro.Text) <> '' Then
     DMIncentivo.QIncentivo_Cons.SetVariable('Cod_Cadastro',Trim(FMCadastro.MeCadastro.Text))
  else
     DMIncentivo.QIncentivo_Cons.SetVariable('Cod_Cadastro',Null);
  DMIncentivo.QIncentivo_Cons.Open;
end;

end.
