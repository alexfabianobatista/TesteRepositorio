unit UClassCadastroCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFClassCadastroCad = class(TFTCadSimples)
    DBCheckBox1: TDBCheckBox;
    Classificaes1: TMenuItem;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Classificaes1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassCadastroCad: TFClassCadastroCad;

implementation

uses UClassCadastro_cl, UClassCadastroCons, URClassCadastro_Class;

{$R *.DFM}

procedure TFClassCadastroCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FClassCadastroCons = Nil then
    FClassCadastroCons := TFClassCadastroCons.Create(Application);
  If FClassCadastroCons.ShowModal = mrOk then
  With DMClassCadastro do
  Begin
    QClassCadastro.Close;
    QClassCadastro.SetVariable('PK',QClassCadastroConsCod_Class_Cadastro.Value);
    QClassCadastro.Open;
  End;
end;

procedure TFClassCadastroCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMClassCadastro do
    QClassCadastro.Open;
end;

procedure TFClassCadastroCad.Classificaes1Click(Sender: TObject);
begin
  inherited;
  DMClassCadastro.QRClassCadastro.Open;
  If FRClassCadastro_Classificao = Nil then
    FRClassCadastro_Classificao := TFRClassCadastro_Classificao.Create(Application);
  FRClassCadastro_Classificao.QRPrimario.Preview;
  DMClassCadastro.QRClassCadastro.Close;
end;

procedure TFClassCadastroCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(13);
end;

procedure TFClassCadastroCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMClassCadastro do
    QClassCadastro.Close;
  Action := CaFree;
  FClassCadastroCad := Nil;
end;

end.
