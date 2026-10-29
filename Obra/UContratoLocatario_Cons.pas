unit UContratoLocatario_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, UFmCadastro, UFmCondominio, Menus, DB, Grids,
  DBGrids, StdCtrls, Mask, Buttons;

type
  TFContratoLocatario_Cons = class(TFTConsulta)
    FmCondominio: TFmCondominio;
    FmCadastro: TFmCadastro;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoLocatario_Cons: TFContratoLocatario_Cons;

implementation

uses UImobiliaria_cl;

{$R *.dfm}

procedure TFContratoLocatario_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QLocatario_Cons.Close;
  If Trim(FmCondominio.MeCondominio.Text) <> '' Then
     DMImobiliaria.QLocatario_Cons.SetVariable('Cod_Condominio',Trim(FmCondominio.MeCondominio.Text))
  Else
     DMImobiliaria.QLocatario_Cons.SetVariable('Cod_Condominio',Null);

  If Trim(FmCadastro.MeCadastro.Text) <> '' Then
     DMImobiliaria.QLocatario_Cons.SetVariable('Cod_Proprietario',Trim(FmCadastro.MeCadastro.Text))
  Else
     DMImobiliaria.QLocatario_Cons.SetVariable('Cod_Proprietario',Null);
  DMImobiliaria.QLocatario_Cons.Open;   
end;

end.
