unit USuinoDespesaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, UFmCadastro, Menus, DB, Grids, DBGrids, StdCtrls,
  Mask, Buttons;

type
  TFSuinoDespesaCons = class(TFTConsulta)
    FmCadastro: TFmCadastro;
    MeDataIni: TMaskEdit;
    Label2: TLabel;
    MeDataFin: TMaskEdit;
    Label3: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSuinoDespesaCons: TFSuinoDespesaCons;

implementation

uses USuino_cl, UBiblioteca;

{$R *.dfm}

procedure TFSuinoDespesaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmSuino.QSuinoDespesaCons.Close;
  if Trim(FmCadastro.MeCadastro.Text) = '' then
    DmSuino.QSuinoDespesaCons.SetVariable('COD_CADASTRO', Null)
  else
    DmSuino.QSuinoDespesaCons.SetVariable('COD_CADASTRO', Trim(FmCadastro.MeCadastro.Text));
  DmSuino.QSuinoDespesaCons.SetVariable('DT_DESPESA_INI', MeDataIni.Text);
  DmSuino.QSuinoDespesaCons.SetVariable('DT_DESPESA_FIN', MeDataFin.Text);
  DmSuino.QSuinoDespesaCons.Open;
end;

procedure TFSuinoDespesaCons.FormCreate(Sender: TObject);
var wDataIni, wDataFin: TDate;
begin
  inherited;
  Bib.PriUltDataVar(wDataIni, wDataFin, True);
  MeDataIni.Text := FormatDateTime('dd/mm/yyyy', wDataIni);
  MeDataFin.Text := FormatDateTime('dd/mm/yyyy', wDataFin);
end;

end.
