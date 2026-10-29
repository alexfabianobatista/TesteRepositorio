unit UInfoCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFInfoCadastro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    Image1: TImage;
    Image2: TImage;
    DSInfoCadastro: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInfoCadastro: TFInfoCadastro;

implementation

uses
  UOracle_cl, UCadastro_cl;
  
{$R *.dfm}

end.
