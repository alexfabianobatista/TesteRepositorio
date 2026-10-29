unit UInutilizacaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmFilial;

type
  TFInutilizacaoCons = class(TFTConsulta)
    FmFilial: TFmFilial;
    MENumero: TMaskEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoKeyPress(Sender: TObject; var Key: Char);
    procedure MENumeroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure Consultar;
  end;

var
  FInutilizacaoCons: TFInutilizacaoCons;

implementation

uses UNfe_cl, UOracle_cl;

{$R *.dfm}

procedure TFInutilizacaoCons.Consultar;
begin
  with DMNfe do
  begin
    QInutilizacaoCons.Close;
    QInutilizacaoCons.ClearVariables;
    if Trim(FmFilial.MeFilial.Text) <> '' then
      QInutilizacaoCons.SetVariable('FILIAL', FmFilial.MeFilial.Text);
    if Trim(METexto.Text) <> '' then
      QInutilizacaoCons.SetVariable('SERIE', METexto.Text);
    if Trim(MENumero.Text) > '0' then
      QInutilizacaoCons.SetVariable('NUMERO', MENumero.Text);
    QInutilizacaoCons.Open;
  end;
end;

procedure TFInutilizacaoCons.FormCreate(Sender: TObject);
begin
  inherited;
  FmFilial.MeFilial.Text := DMOracle.FastSelect('COD_FILIAL', 'TB_FILIAL',
      'IND_TIPO_NOTA <> ' + QuotedStr('NORMAL'));
end;

procedure TFInutilizacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TFInutilizacaoCons.METextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

procedure TFInutilizacaoCons.MENumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0;
end;

end.
