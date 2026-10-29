unit UCondicao_pgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFCondicao_pgto = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSConsulta: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCondicao_pgto: TFCondicao_pgto;

implementation

uses UOficina_cl, UCondicao_pgtoCons;

{$R *.DFM}

end.
