unit UFuncaoFuncionarioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFFuncaoFuncionarioCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaodeFunes1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeFunes1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncaoFuncionarioCad: TFFuncaoFuncionarioCad;

implementation

uses UFuncaoFuncionario_cl, UFuncaoFuncionarioCons, URFuncaoFuncionario;

{$R *.DFM}

procedure TFFuncaoFuncionarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMFuncaoFuncionario.QFuncaoFuncionario.open;
end;

procedure TFFuncaoFuncionarioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFuncaoFuncionarioCons = Nil then
    FFuncaoFuncionarioCons := TFFuncaoFuncionarioCons.Create(Application);
  If FFuncaoFuncionarioCons.ShowModal = mrOk then
  With DMFuncaoFuncionario do
  Begin
    QFuncaoFuncionario.Close;
    QFuncaoFuncionario.SetVariable('PK',QFuncaoFuncionarioConsCod_Funcao_Funcionario.Value);
    QFuncaoFuncionario.Open;
  End;
end;

procedure TFFuncaoFuncionarioCad.RelaodeFunes1Click(Sender: TObject);
begin
  inherited;
  with DMFuncaoFuncionario do
  begin
    QRFuncaoFuncionario.Close;
    QRFuncaoFuncionario.Open;

    if FRFuncaoFuncionario = Nil then
      FRFuncaoFuncionario := TFRFuncaoFuncionario.Create(Application);
    FRFuncaoFuncionario.QRPrimario.Preview;
    QRFuncaoFuncionario.Close;
  End;
end;

procedure TFFuncaoFuncionarioCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(7);
end;

end.
