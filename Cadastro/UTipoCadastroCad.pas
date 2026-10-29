unit UTipoCadastroCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFTipoCadastroCad = class(TFTCadSimples)
    TiposCadastro1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TiposCadastro1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoCadastroCad: TFTipoCadastroCad;

implementation

uses UTipoCadastro_cl, UTipoCadastroCons, URTipoCadastro_TipoCadastro;

{$R *.DFM}

procedure TFTipoCadastroCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoCadastroCons = Nil then
    FTipoCadastroCons := TFTipoCadastroCons.Create(Application);
  If FTipoCadastroCons.ShowModal = mrOk then
  With DMTipoCadastro do
  Begin
    QTipoCadastro.Close;
    QTipoCadastro.SetVariable('PK',QTipoCadastroConsCod_Tipo_Cadastro.Value);
    QTipoCadastro.Open;
  End;

end;

procedure TFTipoCadastroCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMTipoCadastro do
    QTipoCadastro.Open;
end;

procedure TFTipoCadastroCad.TiposCadastro1Click(Sender: TObject);
begin
  inherited;
  DMTipoCadastro.QRTipoCadastro.Open;
  If FRTipoCadastro_TipoCadastro = Nil then
    FRTipoCadastro_TipoCadastro := TFRTipoCadastro_TipoCadastro.Create(Application);
  FRTipoCadastro_TipoCadastro.QRPrimario.Preview;
  DMTipoCadastro.QRTipoCadastro.Close;
end;

procedure TFTipoCadastroCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(8);
end;

procedure TFTipoCadastroCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMTipoCadastro do
    QTipoCadastro.Close;
  Action := CaFree;
  FTipoCadastroCad := Nil;
end;

end.
