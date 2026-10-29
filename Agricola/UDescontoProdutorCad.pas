unit UDescontoProdutorCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFDescontoProdutorCad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    SBCliente: TSpeedButton;
    SBProduto: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    DBEdit14: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    procedure SBClienteClick(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDescontoProdutorCad: TFDescontoProdutorCad;

implementation

uses UDesconto_Produtor_cl, UCadastroCons, UProdutoCons, UCadastro_cl,
  UProduto_cl, UDescontoProdutorCons;

{$R *.DFM}

procedure TFDescontoProdutorCad.SBClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMDescontoProdutor.QDescontoProdutorCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFDescontoProdutorCad.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutocons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMDescontoProdutor.QDescontoProdutorCod_Produto.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFDescontoProdutorCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMDescontoProdutor.QDescontoProdutor.open;
end;

procedure TFDescontoProdutorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMDescontoProdutor.QDescontoProdutor.Close;
  Action := CaFree;
  FDescontoProdutorCad := Nil;
end;

procedure TFDescontoProdutorCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      SBProduto.Enabled:=True;
      SBCliente.Enabled:=True;
    end
  else
    begin
      SBProduto.Enabled:=False;
      SBCliente.Enabled:=False;
end;
 end;
procedure TFDescontoProdutorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FDescontoProdutorCons = Nil then
    FDescontoProdutorCons := TFDescontoProdutorCons.Create(Application);
  if FDescontoProdutorCons.ShowModal = mrOk then
    with DMDescontoProdutor do
      begin
        QDescontoProdutor.Close;
        QDescontoProdutor.SetVariable('PK',QDescontoProdutorConsCod_Desconto_produtor.Value);
        QDescontoProdutor.Open;
        QDescontoProdutorCons.Close;
      end;

end;

end.
