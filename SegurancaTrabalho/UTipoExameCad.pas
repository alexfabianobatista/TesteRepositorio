unit UTipoExameCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFTipoExameCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaoTipoExames1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoTipoExames1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoExameCad: TFTipoExameCad;

implementation

uses UTipoExame_cl, UTipoExameCons, UExame_cl, URTipoExame;

{$R *.DFM}

procedure TFTipoExameCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTipoExame.QTipoExame.open;
end;

procedure TFTipoExameCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoExameCons = Nil then
    FTipoExameCons := TFTipoExameCons.Create(Application);
  If FTipoExameCons.ShowModal = mrOk then
  With DMTipoExame do
  Begin
    QTipoExame.Close;
    QTipoExame.SetVariable('PK',QTipoExameConsCod_Tipo_Exame.Value);
    QTipoExame.Open;
  End;
end;

procedure TFTipoExameCad.RelaoTipoExames1Click(Sender: TObject);
begin
  inherited;
  with DMExame do
  begin
    QRTipoExame.Close;
    QRTipoExame.Open;

    if FRTipoExame = Nil then
      FRTipoExame := TFRTipoExame.Create(Application);
    FRTipoExame.QRPrimario.Preview;
    QRTipoExame.Close;
  End;
end;

procedure TFTipoExameCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(6);
end;

end.
