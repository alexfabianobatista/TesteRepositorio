unit UValorEfeitoSeguroCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFValorEfeitoSeguroCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    SBProduto: TSpeedButton;
    procedure SBProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FValorEfeitoSeguroCad: TFValorEfeitoSeguroCad;

implementation

uses UValorEfeitoSeguro_cl, UProduto_cl, UProdutoCons,
  UValorEfeitoSeguroCons;

{$R *.DFM}

procedure TFValorEfeitoSeguroCad.SBProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     DMValorEfeitoSeguro.QValorEfeitoSeguroCadCOD_PRODUTO.Value := DmProduto.QProdutoConsCOD_PRODUTO.AsInteger;
  end;
end;

procedure TFValorEfeitoSeguroCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMValorEfeitoSeguro.QValorEfeitoSeguroCad.Close;
  Action := CaFree;
  FValorEfeitoSeguroCad := Nil;
end;

procedure TFValorEfeitoSeguroCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMValorEfeitoSeguro.QValorEfeitoSeguroCad.Open;
end;

procedure TFValorEfeitoSeguroCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if dsprimario.State in [dsInsert, dsEdit] then
  begin
    SBProduto.Enabled := true;
  end
  else
  begin
    SBProduto.Enabled := false;
  end;
end;

procedure TFValorEfeitoSeguroCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FValorEfeitoSeguroCons = nil then
     FValorEfeitoSeguroCons := TFValorEfeitoSeguroCons.create(application);

  if FValorEfeitoSeguroCons.ShowModal = mrOk then
  begin
    with DMValorEfeitoSeguro do
    begin
      QValorEfeitoSeguroCad.Close;
      QValorEfeitoSeguroCad.SetVariable('PK',QValorEfeitoSeguroConsCOD_VALOR_EFEITO_SEGURO.Value);
      QValorEfeitoSeguroCad.Open;
    end;
  end;
end;

end.
 