unit UCultivarCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFCultivarCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCultivarCad: TFCultivarCad;

implementation

uses UCultivar_cl, UCultivarCons;

{$R *.DFM}

procedure TFCultivarCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMCultivar do
  begin
    QCultivar.Close;
  end;
  action := CAFree;
  FCultivarCad := nil;
end;

procedure TFCultivarCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCultivar.QCultivar.Open;
end;

procedure TFCultivarCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   if FCultivarCons = nil then
     FCultivarCons:= TFCultivarCons.Create(Application);
   if FCultivarCons.ShowModal = mrOk then
   begin
     with DMCultivar do
     begin
       QCultivar.Close;
       QCultivar.SetVariable('PK',QCultivarConsCod_Cultivar.Value);
       QCultivar.Open;
     end;
   end;
end;

end.
