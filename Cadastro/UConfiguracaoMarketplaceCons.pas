unit UConfiguracaoMarketplaceCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmFilial;

type
  TFConfiguracaoMarketplaceCons = class(TFTConsulta)
    FmFilial1: TFmFilial;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfiguracaoMarketplaceCons: TFConfiguracaoMarketplaceCons;

implementation

uses
  UConfiguracaoMarketplace_cl, UBiblioteca;

{$R *.dfm}

procedure TFConfiguracaoMarketplaceCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  FormActivate(Sender);
end;

procedure TFConfiguracaoMarketplaceCons.FormActivate(Sender: TObject);
begin
  inherited;
  with DMConfiguracaoMarketplace do
  begin
    QConfiguracaoMarketplaceCons.Close;
    Bib.setVariableOuNull(QConfiguracaoMarketplaceCons,'FILIAL',Trim(FmFilial1.MeFilial.Text));
    QConfiguracaoMarketplaceCons.Open;
  end;
end;

end.
