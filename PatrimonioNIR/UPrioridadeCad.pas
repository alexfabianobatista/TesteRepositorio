unit UPrioridadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFPrioridadeCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaodePrioridades1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodePrioridades1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrioridadeCad: TFPrioridadeCad;

implementation

uses UPrioridade_cl, UPrioridadeCons, UFuncionario_cl, URPrioridade;

{$R *.DFM}

procedure TFPrioridadeCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DmPrioridade do
  Begin
    QPrioridade.Close;
    QPrioridade.Open;
  End;
end;

procedure TFPrioridadeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   With DmPrioridade do
    QPrioridade.Close;
  Action := CaFree;
  FPrioridadeCad := Nil;
end;

procedure TFPrioridadeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPrioridadeCons = Nil then
    FPrioridadeCons := TFPrioridadeCons.Create(Application);
  If FPrioridadeCons.ShowModal = mrOk then
  With DMPrioridade do
  Begin
    QPrioridade.Close;
    QPrioridade.SetVariable('PK',QPrioridadeConsCod_Prioridade.Value);
    QPrioridade.Open;
  End;
end;

procedure TFPrioridadeCad.RelaodePrioridades1Click(Sender: TObject);
begin
  inherited;
  with DMPrioridade do
  begin
    QRPrioridade.Close;
    QRPrioridade.Open;

    if FRPrioridade = Nil then
      FRPrioridade := TFRPrioridade.Create(Application);
    FRPrioridade.QRPrimario.Preview;
    FRPrioridade.Close;
  end;
end;

end.
