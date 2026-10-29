unit UTipoNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFTipoNota = class(TForm)
    Label1: TLabel;
    BtNF: TBitBtn;
    BtNFe: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtNFClick(Sender: TObject);
    procedure BtNFeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public
    TipoNota: String;
  end;

var
  FTipoNota: TFTipoNota;

implementation

{$R *.dfm}

procedure TFTipoNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if TipoNota = '' then
    Raise Exception.Create('É necessário escolher um tipo de nota.');
end;

procedure TFTipoNota.BtNFClick(Sender: TObject);
begin
  TipoNota := 'NORMAL';
  Close;
end;

procedure TFTipoNota.BtNFeClick(Sender: TObject);
begin
  TipoNota := 'ELETRONICA';
  Close;
end;

procedure TFTipoNota.FormActivate(Sender: TObject);
begin
  TipoNota := '';
end;

end.
