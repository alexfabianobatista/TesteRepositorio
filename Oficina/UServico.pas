unit UServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls;

type
  TFServicoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Cadastrodeservios1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FServicoCad: TFServicoCad;

implementation

uses UOficina_cl, UServicoCons, URServico;

{$R *.DFM}

end.


