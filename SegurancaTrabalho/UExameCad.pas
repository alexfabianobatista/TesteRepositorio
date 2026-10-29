unit UExameCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFExameCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaoExames1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoExames1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExameCad: TFExameCad;

implementation

uses UExame_cl, UExameCons, URRelacaoExame;

{$R *.DFM}

procedure TFExameCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMExame.QExame.open;
end;

procedure TFExameCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FExameCons = Nil then
    FExameCons := TFExameCons.Create(Application);
  If FExameCons.ShowModal = mrOk then
  With DMExame do
  Begin
    QExame.Close;
    QExame.SetVariable('PK',QExameConsCod_Exame.Value);
    QExame.Open;
  End;
end;

procedure TFExameCad.RelaoExames1Click(Sender: TObject);
begin
  inherited;
  with DMExame do
  begin
    QRExame.Close;
    QRExame.Open;

    if FRRelacaoExame = Nil then
      FRRelacaoExame := TFRRelacaoExame.Create(Application);
    FRRelacaoExame.QRPrimario.Preview;
    QRexame.Close;
  End;
end;

procedure TFExameCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(5);
end;

end.
