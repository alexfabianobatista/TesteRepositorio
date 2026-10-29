unit UTravamentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTravamentoCons = class(TFTConsulta)
    PMSessao: TPopupMenu;
    DerrubarSesso1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure DerrubarSesso1Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
  private
    procedure Consultar;
  public
    { Public declarations }
  end;

var
  FTravamentoCons: TFTravamentoCons;

implementation

uses UTravamento_cl, ULogin, UOracle_cl, UUsuario_cl;

{$R *.dfm}

procedure TFTravamentoCons.FormShow(Sender: TObject);
begin
  inherited;
  if FLogin = nil then
    FLogin := TFLogin.Create(Application);

  while not DMUsuario.Privilegiado do
  begin
    if FLogin.ShowModal = MrOk then
    begin
      if not DMUsuario.Privilegiado then
        MessageDlg('Apenas usuários privilegiados tem acesso à esse sistema.', mtError, [mbOK], 0);
    end
    else
    begin
      Close;
      Exit;
    end;
  end;
end;

procedure TFTravamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  Consultar;
end;

procedure TFTravamentoCons.Consultar;
begin
  with DMTravamento do
  begin
    QTravamentoCons.Close;
    QTravamentoCons.ClearVariables;
    if Trim(METexto.Text) <> '' then
      QTravamentoCons.SetVariable('TABELA', '%' + Trim(METexto.Text) + '%');
    QTravamentoCons.Open;
  end;
end;

procedure TFTravamentoCons.DerrubarSesso1Click(Sender: TObject);
begin
  inherited;
  if (not DMTravamento.QTravamentoCons.Eof) and (MessageDlg('Tem certeza que deseja derrubar a sessão ' +
      DMTravamento.QTravamentoConsSID.Text + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    DMOracle.KillSession(DMTravamento.QTravamentoConsSID.Text, DMTravamento.QTravamentoConsSERIAL.Text);
    Consultar;
  end;
end;

procedure TFTravamentoCons.BtOkClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
