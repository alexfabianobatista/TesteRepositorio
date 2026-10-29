unit UGuiaAplicacaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, DBCtrls, ImgList, Menus, Db, ComCtrls, Mask,
  Buttons, ExtCtrls, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFGuiaAplicacaoCad = class(TFTCadSimples)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    Label4: TLabel;
    DBMemo2: TDBMemo;
    Label5: TLabel;
    DBMemo3: TDBMemo;
    BtConsProduto: TBitBtn;
    DBEdit3: TDBEdit;
    Emisso1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Emisso1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGuiaAplicacaoCad: TFGuiaAplicacaoCad;

implementation

uses UGuiaAplicacao_cl, UGuiaAplicacaoCons, UProdutoCons, UProduto_cl,
  UGuiaAplicacaoParam;

{$R *.DFM}

procedure TFGuiaAplicacaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMGuiaAplicacao.QGuiaAplicacao.Open;
end;

procedure TFGuiaAplicacaoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
    Begin
     DMGuiaAplicacao.QGuiaAplicacaoCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
     DmGuiaAplicacao.QGuiaAplicacao.SetVariable('PK',DMProduto.QProdutoConsCod_Produto.Value);
   end;

end;

procedure TFGuiaAplicacaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
     with DMGuiaAplicacao do
     begin
        QGuiaAplicacao.Close;
        QGuiaAplicacao.SetVariable('PK',DmProduto.QProdutoConsCOD_PRODUTO.Value);
        QGuiaAplicacao.Open;
     end;
end;

procedure TFGuiaAplicacaoCad.Emisso1Click(Sender: TObject);
begin
  inherited;
  If FGuiaAplicacaoParam = Nil then
    FGuiaAplicacaoParam := TFGuiaAplicacaoParam.Create(Application);
  FGuiaAplicacaoParam.PGRelatorio.Pages[0].TabVisible := True;
  FGuiaAplicacaoParam.ShowModal;
end;

procedure TFGuiaAplicacaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (24);
end;

procedure TFGuiaAplicacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMGuiaAplicacao.QGuiaAplicacao.Close;
  Action := CaFree;
  FGuiaAplicacaoCad := Nil;
end;

end.
