unit UImobiliaria_Param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmFilial,
  UFmCadastro, UFmCondominio, UFmDatas, UFmImovel;

type
  TFImobiliaria_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    Fm1Condominio: TFmCondominio;
    Fm1Cadastro: TFmCadastro;
    Fm1Filial: TFmFilial;
    TabSheet2: TTabSheet;
    Fm2Condominio: TFmCondominio;
    Fm2Cadastro: TFmCadastro;
    Fm2Datas: TFmDatas;
    Fm2Imovel: TFmImovel;
    TabSheet3: TTabSheet;
    Fm3Cadastro: TFmCadastro;
    Fm3Datas: TFmDatas;
    Fm3Imovel: TFmImovel;
    Fm3Filial: TFmFilial;
    TabSheet4: TTabSheet;
    Fm4Filial: TFmFilial;
    Fm4Cadastro: TFmCadastro;
    TabSheet5: TTabSheet;
    Fm5Condominio: TFmCondominio;
    Fm5Cadastro: TFmCadastro;
    Fm5Imovel: TFmImovel;
    Fm5Datas: TFmDatas;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImobiliaria_Param: TFImobiliaria_Param;

implementation

{$R *.dfm}

end.
