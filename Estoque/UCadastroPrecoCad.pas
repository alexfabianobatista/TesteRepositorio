unit UCadastroPrecoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, DBDirceu;

type
  TFCadastroPrecoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    DBDirceu2: TDBDirceu;
    BtnFabricante: TSpeedButton;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBDirceu1: TDBDirceu;
    BtnProduto: TSpeedButton;
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnFabricanteClick(Sender: TObject);
    procedure BtnProdutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastroPrecoCad: TFCadastroPrecoCad;

implementation

uses UProduto_cl, UProdutoCons, UCadastro_cl, UCadastroCons,
  UCadastroPrecoCons;

{$R *.dfm}

procedure TFCadastroPrecoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtnProduto.Enabled := DsPrimario.State <> DsBrowse;
  BtnFabricante.Enabled := DsPrimario.State <> DsBrowse;
end;

procedure TFCadastroPrecoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMProduto.QCadastroPreco.Open;
end;

procedure TFCadastroPrecoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProduto.QCadastroPreco.Close;
end;

procedure TFCadastroPrecoCad.BtnFabricanteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOK then
    DMProduto.QCadastroPrecoCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFCadastroPrecoCad.BtnProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOK then
    DMProduto.QCadastroPrecoCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.AsInteger;
end;

procedure TFCadastroPrecoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCadastroPrecoCons = nil then
    FCadastroPrecoCons := TFCadastroPrecoCons.Create(Application);
  if FCadastroPrecoCons.ShowModal = mrOk then
  begin
    DMProduto.QCadastroPreco.Close;
    DMProduto.QCadastroPreco.SetVariable('PK', DMProduto.QCadastroPrecoConsCOD_CADASTRO_PRECO.Value);
    DMProduto.QCadastroPreco.Open;
  end;
end;

end.
