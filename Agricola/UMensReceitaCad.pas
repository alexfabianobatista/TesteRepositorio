unit UMensReceitaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFMensReceitaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBMemo2: TDBMemo;
    VersodoReceiturio1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VersodoReceiturio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensReceitaCad: TFMensReceitaCad;

implementation

uses UMensReceita_cl, UMensReceitaCons,
  URVersoReceituario;

{$R *.DFM}

procedure TFMensReceitaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FMensReceitaCons = nil then
     FMensReceitaCons := TFMensReceitaCons.Create(Application);
  If FMensReceitaCons.ShowModal = mrOK then
     with DMMensReceita do
     begin
        QMensReceita.Close;
        QMensReceita.SetVariable('PK',QMensReceitaConsCod_Mens_Receita.Value);
        QMensReceita.Open;
     end;

end;

procedure TFMensReceitaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMMensReceita.QMensReceita.Open;
end;

procedure TFMensReceitaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
    Application.HelpContext (21);
end;

procedure TFMensReceitaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMMensReceita.QMensReceita.Close;
  Action := CaFree;
  FMensReceitaCad := Nil;
end;

procedure TFMensReceitaCad.VersodoReceiturio1Click(Sender: TObject);
begin
  inherited;
  if FRVersoReceituario = nil then
    FRVersoReceituario := TFRVersoReceituario.Create(Application);
  FRVersoReceituario.QRPrimario.Preview;
end;

end.
