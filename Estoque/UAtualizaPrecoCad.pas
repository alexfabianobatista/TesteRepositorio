unit UAtualizaPrecoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFAtualiza_PrecoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualiza_PrecoCad: TFAtualiza_PrecoCad;

implementation

uses UProduto_cl, UAtualiza_PrecoCons;

{$R *.DFM}

procedure TFAtualiza_PrecoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FAtualiza_PrecoCons = nil then
     FAtualiza_PrecoCons:= TFAtualiza_PrecoCons.Create(Application);
  if FAtualiza_PrecoCons.ShowModal = mrOk then
     with DMProduto do
     begin
       QAtualiza_precoCad.Close;
       QAtualiza_precoCad.SetVariable('PK',QAtualiza_PrecoConsCOD_ATUALIZA_PRECO.Value);
       QAtualiza_precoCad.Open;
     end;
end;

procedure TFAtualiza_PrecoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMProduto do
  begin
    QAtualiza_precoCad.Close;
    QAtualiza_precoCad.Open;
  end;
end;

procedure TFAtualiza_PrecoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProduto.QAtualiza_precoCad.Close;
  Action := CaFree;
  FAtualiza_PrecoCad := Nil;
end;

end.
