unit UCorCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFCorCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelCor1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelCor1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCorCad: TFCorCad;

implementation

uses UCor_cl, UCorCons,UParamSistema_cl, URCor;

{$R *.DFM}

procedure TFCorCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCor.QCorCad.Open;
end;

procedure TFCorCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMCor.QCorCad.Close;
end;

procedure TFCorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCorCons = nil then
    FCorCons := TFCorCons.Create(Application);
  if FCorCons.showModal = mrOk then
  begin
    with DMCor do
    begin
      QCorCad.Close;
      QCorCad.SetVariable('PK',QCorConsCOD_COR.Value);
      QCorCad.Open;
    end;
  end;
end;

procedure TFCorCad.RelCor1Click(Sender: TObject);
begin
  inherited;
  if FRCor = nil then
    FRCor := TFRCor.Create(Application);
  DMCor.QRCor.Close;
  DMCor.QRCor.Open;
  FRCor.QRPrimario.Preview;
  DMCor.QRCor.Close;
end;

procedure TFCorCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

procedure TFCorCad.FormCreate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'COMIN') then
    Label2.Caption := 'Nome Embarcação: ';
end;

end.
