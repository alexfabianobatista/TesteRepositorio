unit UImovel_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmCidade, UFmCadastro, UFmCondominio;

type
  TFImovel_Cons = class(TFTConsulta)
    FmCadastro: TFmCadastro;
    FmCidade: TFmCidade;
    FmCondominio: TFmCondominio;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImovel_Cons: TFImovel_Cons;

implementation

uses UImobiliaria_cl;

{$R *.dfm}

procedure TFImovel_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QImovel_Cons.Close;
  DMImobiliaria.QImovel_Cons.SetVariable('Desc_Imovel',Trim(MeTexto.Text));
  If Trim(FmCadastro.MeCadastro.Text) <> '' Then
     DMImobiliaria.QImovel_Cons.SetVariable('Cod_Proprietario',Trim(FmCadastro.MeCadastro.Text))
  Else
     DMImobiliaria.QImovel_Cons.SetVariable('Cod_Proprietario',Null);

  If Trim(FmCidade.MeCidade.Text) <> '' Then
     DMImobiliaria.QImovel_Cons.SetVariable('Cod_Cidade',Trim(FmCidade.MeCidade.Text))
  Else
     DMImobiliaria.QImovel_Cons.SetVariable('Cod_Cidade',Null);

  If Trim(FmCondominio.MeCondominio.Text) <> '' Then
     DMImobiliaria.QImovel_Cons.SetVariable('Cod_Condominio',Trim(FmCondominio.MeCondominio.Text))
  Else
     DMImobiliaria.QImovel_Cons.SetVariable('Cod_Condominio',Null);
  DMImobiliaria.QImovel_Cons.Open;   
end;

end.
