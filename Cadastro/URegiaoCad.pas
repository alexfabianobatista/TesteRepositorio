unit URegiaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFRegiaoCad = class(TFTCadSimples)
    Regies1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Regies1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegiaoCad: TFRegiaoCad;

implementation

uses URegiao_cl, URegiaoCons, URRegiao_Regiao;

{$R *.DFM}

procedure TFRegiaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRegiaoCons = Nil then
    FRegiaoCons := TFRegiaoCons.Create(Application);
  If FRegiaoCons.ShowModal = mrOk then
  With DMRegiao do
  Begin
    QRegiao.Close;
    QRegiao.SetVariable('PK',QRegiaoConsCod_Regiao.Value);
    QRegiao.Open;
  End;
end;

procedure TFRegiaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMRegiao do
    QRegiao.Open;
end;

procedure TFRegiaoCad.Regies1Click(Sender: TObject);
begin
  inherited;
  DMRegiao.QRegiaoAll.Close;
  DMRegiao.QRegiaoAll.Open;
  If FRRegiao_Regiao = Nil then
    FRRegiao_Regiao := TFRRegiao_Regiao.Create(Application);

  // FRRegiao_Regiao.QRPrimario.PrinterSetup;

  FRRegiao_Regiao.QRPrimario.Preview;
  DMRegiao.QRegiaoAll.Close;
end;

procedure TFRegiaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(11);
end;

procedure TFRegiaoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DMRegiao do
       QRegiao.Close;
  Action := CaFree;
  FRegiaoCad := Nil;
end;

end.
