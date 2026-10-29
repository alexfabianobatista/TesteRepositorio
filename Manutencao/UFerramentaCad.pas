unit UFerramentaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFFerramentaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaodeFerramentas1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeFerramentas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFerramentaCad: TFFerramentaCad;

implementation

uses UFerramenta_cl, URFerramentasCons, URFerramentas;

{$R *.DFM}

procedure TFFerramentaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMFerramenta.QFerramenta.Open;
end;

procedure TFFerramentaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMFerramenta.QFerramenta.Close;
  action := caFree;
  FFerramentaCad := nil;
end;

procedure TFFerramentaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FrFerramentasCons = Nil then
    FrFerramentasCons := TFrFerramentasCons.Create(Application);
  if FrFerramentasCons.ShowModal = mrOk then
  With DMFerramenta do
  Begin
    QFerramenta.Close;
    QFerramenta.SetVariable('PK',QFerramentaConsCod_Ferramenta.Value);
    QFerramenta.Open;
  End;

end;

procedure TFFerramentaCad.RelaodeFerramentas1Click(Sender: TObject);
begin
  inherited;
 with DMFerramenta do
  begin
    QRFerramenta.Close;
    QRFerramenta.Open;
    If FRFerramentas = Nil then
      FRFerramentas := TFRFerramentas.Create(Application);
      FRFerramentas.QRPrimario.Preview;
     QRFerramenta.Close;
  End;
end;

end.
