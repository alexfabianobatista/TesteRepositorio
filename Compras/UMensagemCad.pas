unit UMensagemCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFMensagemCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Mensagem1: TMenuItem;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
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
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Mensagem1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemCad: TFMensagemCad;

implementation

uses UMensagem_cl, UMensagemCons, URMensagem, UBiblioteca;

{$R *.DFM}

procedure TFMensagemCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
  With DMMensagem do
  Begin
    QMensagem.Close;
    QMensagem.SetVariable('PK',QMensagemConsCod_Mensagem.Value);
    QMensagem.Open;
  End;
end;

procedure TFMensagemCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMMensagem Do
    QMensagem.Open;
end;

procedure TFMensagemCad.Mensagem1Click(Sender: TObject);
begin
  inherited;
  With DMMensagem do
  Begin
    QRMensagem.Open;
    If FRMensagem = Nil then
      FRMensagem := TFRMensagem.Create(Application);
    FRMensagem.QRPrimario.Preview;
    QRMensagem.Close;
  End;
end;

procedure TFMensagemCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(36);
end;

procedure TFMensagemCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMMensagem Do
    QMensagem.Close;
  Action := CaFree;
  FMensagemCad := Nil;
end;

procedure TFMensagemCad.FormCreate(Sender: TObject);
begin
  inherited;
  //Alteração para permitir digitar em letras minúsculas    Adriel 22/06/2015
  Bib.addControleCharCase(DBEdit2,Self.Name);
  Bib.addControleCharCase(DBEdit3,Self.Name);
  Bib.addControleCharCase(DBEdit4,Self.Name);
  Bib.addControleCharCase(DBEdit5,Self.Name);
  Bib.addControleCharCase(DBEdit6,Self.Name);
  Bib.addControleCharCase(DBEdit7,Self.Name);
  Bib.addControleCharCase(DBEdit8,Self.Name);
  Bib.addControleCharCase(DBEdit9,Self.Name);
  Bib.addControleCharCase(DBEdit10,Self.Name);
end;

end.
