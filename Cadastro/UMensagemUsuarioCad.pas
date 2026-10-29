unit UMensagemUsuarioCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBCtrls, StdCtrls, ActnList, ImgList, DB, Menus,
  ComCtrls, Mask, Buttons, ExtCtrls, DBDirceu, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFMensagemUsuarioCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBDirceu1: TDBDirceu;
    BitBtn1: TBitBtn;
    DBDirceu2: TDBDirceu;
    DBRadioGroup3: TDBRadioGroup;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemUsuarioCad: TFMensagemUsuarioCad;

implementation

uses UMensagemUsuario_cl, UUsuario_cl, UUsuarioCons, UMensagemUsuarioCons;

{$R *.dfm}

procedure TFMensagemUsuarioCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FUsuarioCons = nil then
    FUsuarioCons := TFUsuarioCons.Create(Application);
  if FUsuarioCons.ShowModal = mrOk then
    DmMensagemUsuario.QMensagemUsuarioCOD_USUARIO_DESTINO.Value := DMUsuario.QUsuarioConsCOD_USUARIO.Value;
end;

procedure TFMensagemUsuarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DmMensagemUsuario.QMensagemUsuario.Open;
end;

procedure TFMensagemUsuarioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmMensagemUsuario.QMensagemUsuario.Close;
end;

procedure TFMensagemUsuarioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMensagemUsuarioCons = nil then
    FMensagemUsuarioCons := TFMensagemUsuarioCons.Create(Application);
  if FMensagemUsuarioCons.ShowModal = mrOk then
  begin
    DmMensagemUsuario.QMensagemUsuario.Close;
    DmMensagemUsuario.QMensagemUsuario.SetVariable('PK', DmMensagemUsuario.QMensagemUsuarioConsCOD_MENSAGEM_USUARIO.Value);
    DmMensagemUsuario.QMensagemUsuario.Open;
  end;
end;

end.
