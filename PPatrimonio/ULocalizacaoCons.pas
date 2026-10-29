unit ULocalizacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFLocalizacaoCons = class(TFTConsulta)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocalizacaoCons: TFLocalizacaoCons;

implementation

uses ULocalizacao_cl;

{$R *.DFM}

procedure TFLocalizacaoCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FLocalizacaoCons := nil;
end;

procedure TFLocalizacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMLocalizacao do
  Begin
    QLocalizacaoCons.Close;
    If( Trim(MeTexto.Text) <> '')Then
      QLocalizacaoCons.SetVariable('DESCRICAO', Trim(MeTexto.Text) )
    Else
      QLocalizacaoCons.SetVariable('DESCRICAO', null );
    QLocalizacaoCons.Open;
  End;
end;

end.
