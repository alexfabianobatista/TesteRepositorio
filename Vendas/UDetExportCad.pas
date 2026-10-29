unit UDetExportCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, uOracle_cl, DBCtrls, Grids, DBGrids;

type
  TFDetExportCad = class(TFTCadSimples)
    DBPDrawBack: TDBPanel;
    DBPNumRE: TDBPanel;
    DBPChaveAcesso: TDBPanel;
    DBPQuantidadeExportada: TDBPanel;
    DBGrid1: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetExportCad: TFDetExportCad;

implementation

uses UNotaSaida_cl;

{$R *.dfm}

procedure TFDetExportCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QNfeExport.Open;
end;

procedure TFDetExportCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMNotaSaida.QNfeExport.Close;
end;

end.
