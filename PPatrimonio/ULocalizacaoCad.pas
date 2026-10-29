unit ULocalizacaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFLocalizacaoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaodeLocalizaes1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeLocalizaes1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLocalizacaoCad: TFLocalizacaoCad;

implementation

uses ULocalizacao_cl, ULocalizacaoCons, URLocalizacao;

{$R *.DFM}

procedure TFLocalizacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMLocalizacao.QLocalizacao.Close;
  DMLocalizacao.QLocalizacaoCons.Close;
  Action := CaFree;
  FLocalizacaoCad := nil;
end;

procedure TFLocalizacaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMLocalizacao.QLocalizacao.Open;
end;

procedure TFLocalizacaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If(FLocalizacaoCons = nil)Then
    FLocalizacaoCons := TFLocalizacaoCons.Create(Application);
  If(FLocalizacaoCons.showmodal = mrOk)Then
  Begin
    DMLocalizacao.QLocalizacao.Close;
    DMLocalizacao.QLocalizacao.SetVariable('PK',DMLocalizacao.QLocalizacaoConsCOD_LOCALIZACAO.Text);
    DMLocalizacao.QLocalizacao.Open;
  End
end;

procedure TFLocalizacaoCad.RelaodeLocalizaes1Click(Sender: TObject);
begin
  inherited;
  DMLocalizacao.QRLocalizacao.Close;
  DMLocalizacao.QRLocalizacao.Open;
  If(FRLocalizacao = nil)Then
    FRLocalizacao := TFRLocalizacao.Create(Application);
  FRLocalizacao.QRPrimario.preview;
  DMLocalizacao.QRLocalizacao.Close;
end;

procedure TFLocalizacaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

end.
