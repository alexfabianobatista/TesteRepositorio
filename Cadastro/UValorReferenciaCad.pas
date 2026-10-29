unit UValorReferenciaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFValorReferenciaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FValorReferenciaCad: TFValorReferenciaCad;

implementation

uses UValorReferencia_cl;

{$R *.DFM}

procedure TFValorReferenciaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMValorReferencia.QValorReferenciaCad.Open;
end;

procedure TFValorReferenciaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMValorReferencia.QValorReferenciaCad.Close;
end;

end.
