unit UCadastro_Preco_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFCadastro_Preco_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BtConsCadastro: TBitBtn;
    BtConsProduto: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastro_Preco_Cad: TFCadastro_Preco_Cad;

implementation

uses UCadastro_Preco_cl, UCadastroCons, UProdutoCons, UCadastro_cl,
  UProduto_cl, UCadastro_Preco_Cons;

{$R *.dfm}

procedure TFCadastro_Preco_Cad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMCadastro_Preco.QCadastro_Preco_CadCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFCadastro_Preco_Cad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    DMCadastro_Preco.QCadastro_Preco_CadCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);

end;

procedure TFCadastro_Preco_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMCadastro_Preco.QCadastro_Preco_Cad.Open;
end;

procedure TFCadastro_Preco_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCadastro_Preco.QCadastro_Preco_Cad.Close;
end;

procedure TFCadastro_Preco_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCadastro_Preco_Cons = Nil Then
     FCadastro_Preco_Cons := TFCadastro_Preco_Cons.Create(Application);
  If FCadastro_Preco_Cons.ShowModal = MrOk Then
   Begin
     DMCadastro_Preco.QCadastro_Preco_Cad.Close;
     DMCadastro_Preco.QCadastro_Preco_Cad.SetVariable('Pk',DMCadastro_Preco.QCadastro_Preco_ConsCod_Cadastro_Preco.Value);
     DMCadastro_Preco.QCadastro_Preco_Cad.Open;
   End;
end;

end.
