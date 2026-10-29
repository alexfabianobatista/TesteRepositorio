unit UMotoristaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFMotoristaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    RelaoMotoristas1: TMenuItem;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoMotoristas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMotoristaCad: TFMotoristaCad;

implementation

uses UMotorista_cl, UMotoristaCons, URMotorista;

{$R *.DFM}

procedure TFMotoristaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMotorista.QMotoristaCad.open;
end;

procedure TFMotoristaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMMotorista.QMotoristaCad.Close;
  DMMotorista.QMotoristaCons.Close;
  action :=caFree;
  FMotoristaCad:=nil;
end;

procedure TFMotoristaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   if FMotoristaCons = nil then
     FMotoristaCons:= TFMotoristaCons.Create(Application);
  if FMotoristaCons.ShowModal = mrOk then
  begin
    with DMMotorista do
    begin
      QMotoristaCad.Close;
      QMotoristaCad.SetVariable('PK',QMotoristaConsCod_Motorista.Value);
      QMotoristaCad.Open;
    end;
  end;
end;

procedure TFMotoristaCad.RelaoMotoristas1Click(Sender: TObject);
begin
  inherited;
  with DMMotorista do
  begin
    QRMotorista.Close;
    QRMotorista.Open;
    if FRMotorista = nil then
       FRMotorista:= TFRMotorista.Create(Application);
    FRMotorista.QRPrimario.Preview;
    QRMotorista.Close;
  end;
end;

end.
