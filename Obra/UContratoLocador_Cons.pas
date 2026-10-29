unit UContratoLocador_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmCadastro, UFmImovel;

type
  TFContratoLocador_Cons = class(TFTConsulta)
    FmCadastro: TFmCadastro;
    FmImovel: TFmImovel;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoLocador_Cons: TFContratoLocador_Cons;

implementation

uses UImobiliaria_cl;

{$R *.dfm}

procedure TFContratoLocador_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QLocador_Cons.Close;
  If Trim(FmCadastro.MeCadastro.Text) <> '' Then
     DMImobiliaria.QLocador_Cons.SetVariable('Cod_Cadastro',Trim(FmCadastro.MeCadastro.Text))
  Else
     DMImobiliaria.QLocador_Cons.SetVariable('Cod_Cadastro',Null);
  If Trim(FmImovel.MeImovel.Text) <> '' Then
     DMImobiliaria.QLocador_Cons.SetVariable('Cod_Imovel',Trim(FmImovel
     .MeImovel.Text))
  Else
     DMImobiliaria.QLocador_Cons.SetVariable('Cod_Imovel',Null);
  DMImobiliaria.QLocador_Cons.Open;
end;

end.
