unit UEmailConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, ActnList, DBPanel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFEmailConfig = class(TFTCadSimples)
    DBMemo1: TDBMemo;
    Label9: TLabel;
    DBPEmail: TDBPanel;
    DBPSenha: TDBPanel;
    DBPSmtp: TDBPanel;
    DBPPortaSmtp: TDBPanel;
    DBPPop3: TDBPanel;
    DBPPortaPop3: TDBPanel;
    DBPCodigo: TDBPanel;
    DBPHomePage: TDBPanel;
    DBCBSSL: TDBCheckBox;
    DBPImap: TDBPanel;
    DBPanel2: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmailConfig: TFEmailConfig;

implementation

uses UCadastro_cl, UEmailCons, UBiblioteca;

{$R *.dfm}

procedure TFEmailConfig.FormActivate(Sender: TObject);
begin
  inherited;
  with DMCadastro do
    QCadastroEmail.open;
  Bib.addControleCharCase(DBPEmail, Self.Name);
  Bib.addControleCharCase(DBPSenha, Self.Name);
  Bib.addControleCharCase(DBPSmtp, Self.Name);
  Bib.addControleCharCase(DBPPop3, Self.Name);
  Bib.addControleCharCase(DBPImap, Self.Name);
  Bib.addControleCharCase(DBPHomePage, Self.Name);
end;

procedure TFEmailConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMCadastro do
    QCadastroEmail.Close;
  Action := CaFree;
  FEmailConfig := Nil;
end;

procedure TFEmailConfig.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEmailCons = Nil then
    FEmailCons := TFEmailCons.Create(Application);
  FEmailCons.ShowModal;
end;

procedure TFEmailConfig.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Dados Cadastrados com Sucesso');
end;

procedure TFEmailConfig.FormCreate(Sender: TObject);
begin
  inherited;
  Bib.addControleCharCase(DBPEmail, Self.Name);
  Bib.addControleCharCase(DBPSenha, Self.Name);
  Bib.addControleCharCase(DBPSmtp, Self.Name);
  Bib.addControleCharCase(DBPPop3, Self.Name);
  Bib.addControleCharCase(DBPImap, Self.Name);
end;

end.
