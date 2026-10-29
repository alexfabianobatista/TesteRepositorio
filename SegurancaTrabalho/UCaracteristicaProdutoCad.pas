unit UCaracteristicaProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFCaracteristicaProdutoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaodeCaractersticasdeProdutos1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeCaractersticasdeProdutos1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaracteristicaProdutoCad: TFCaracteristicaProdutoCad;

implementation

uses UCaracteristicaProduto_cl, UCaracteristicaProdutoCons,
  URCaracteristicaProduto, UCadastroParam;

{$R *.DFM}

procedure TFCaracteristicaProdutoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
end;

procedure TFCaracteristicaProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DSPrimario.DataSet.Close;
end;

procedure TFCaracteristicaProdutoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.Create(Application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
  begin
    with DMCaracteristicaProduto do
    begin
      QCaracteristicaProduto.Close;
      QCaracteristicaProduto.SetVariable('PK',QCaracteristicaProdutoConsCOD_CARACTERISTICA_PRODUTO.Value);
      QCaracteristicaProduto.Open;
    end;
  end;
end;

procedure TFCaracteristicaProdutoCad.RelaodeCaractersticasdeProdutos1Click(
  Sender: TObject);
begin
  inherited;
    With DMCaracteristicaProduto do
  Begin
    QRCaracteristicaProduto.Open;
    If FRCaracteristicaProduto = Nil then
    FRCaracteristicaProduto := TFRCaracteristicaProduto.Create(Application);
    FRCaracteristicaProduto.QRPrimario.Preview;
    QRCaracteristicaProduto.close;
  End;
end;

procedure TFCaracteristicaProdutoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(11);
end;

end.

