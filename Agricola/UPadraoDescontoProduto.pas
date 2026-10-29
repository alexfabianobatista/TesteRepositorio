unit UPadraoDescontoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPadraoDescontoProduto = class(TFTCadSimples)
    BtPadraoProduto: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBDirceu1: TDBDirceu;
    BtProduto: TBitBtn;
    DBDirceu2: TDBDirceu;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    PadroDescontoProduto1: TMenuItem;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    procedure BtPadraoProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PadroDescontoProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoDescontoProduto: TFPadraoDescontoProduto;

implementation

uses UPadraoProduto_cl, UPadraoProdutoCons, UProdutoCons, UProduto_cl,
  UPadraoDescontoProdutoCons, UPadraoDescontoProdutoParam,
  URPadraoDescontoProduto;

{$R *.dfm}

procedure TFPadraoDescontoProduto.BtPadraoProdutoClick(Sender: TObject);
begin
  inherited;
  if FPadraoProdutoCons = Nil then
    FPadraoProdutoCons := TFPadraoProdutoCons.Create(Application);
  if FPadraoProdutoCons.ShowModal = MrOk then
  begin
    with DMPadraoProduto do
    begin
      QPadraoDescontoProdutoCOD_PADRAO_PRODUTO.Text := QPadraoProdutoConsCOD_PADRAO_PRODUTO.Text;
    end;
  end;
end;

procedure TFPadraoDescontoProduto.FormActivate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet.Open;
end;

procedure TFPadraoDescontoProduto.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DmPadraoProduto.QPadraoDescontoProduto.Insert;
end;

procedure TFPadraoDescontoProduto.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = MrOk then
  begin
    with DMPadraoProduto do
    begin
      QPadraoDescontoProdutoCOD_PRODUTO.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
    end;
  end;
end;

procedure TFPadraoDescontoProduto.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPadraoDescontoProdutoCons = Nil then
    FPadraoDescontoProdutoCons := TFPadraoDescontoProdutoCons.Create(Application);
  if FPadraoDescontoProdutoCons.ShowModal = MrOk then
  begin
    with DMPadraoProduto do
    begin
      QPadraoDescontoProduto.Close;
      QPadraoDescontoProduto.SetVariable('PK', QPadraoDescProdConsCOD_PADRAO_DESCONTO_PRODUTO.Text);
      QPadraoDescontoProduto.Open;
    end;
  end;
end;

procedure TFPadraoDescontoProduto.PadroDescontoProduto1Click(
  Sender: TObject);
begin
  inherited;
  if FPadraoDescontoProdutoParam = Nil then
    FPadraoDescontoProdutoParam := TFPadraoDescontoProdutoParam.Create(Application);
  FPadraoDescontoProdutoParam.PGRelatorio.Pages[0].TabVisible := true;
  if FPadraoDescontoProdutoParam.ShowModal = MrOk then
  begin
    with DMPadraoProduto do
    begin
      QRPadraoDescontoProduto.Close;
      if FPadraoDescontoProdutoParam.ME1PadraoProduto.Text <> '' then
        QRPadraoDescontoProduto.SetVariable('PADRAO_PRODUTO', FPadraoDescontoProdutoParam.ME1PadraoProduto.Text)
      else
      QRPadraoDescontoProduto.SetVariable('PADRAO_PRODUTO', Null);

      if FPadraoDescontoProdutoParam.ME1Produto.Text <> '' then
        QRPadraoDescontoProduto.SetVariable('PRODUTO', FPadraoDescontoProdutoParam.ME1Produto.Text)
      else
        QRPadraoDescontoProduto.SetVariable('PRODUTO', Null);
       QRPadraoDescontoProduto.Open;

      if FRPadraoDescontoProduto = Nil then
        FRPadraoDescontoProduto := TFRPadraoDescontoProduto.Create(Application);
      FRPadraoDescontoProduto.QRlPadraoProduto.Caption := FPadraoDescontoProdutoParam.Ed1PadraoProduto.Text;
      FRPadraoDescontoProduto.QRlProduto.Caption := FPadraoDescontoProdutoParam.Ed1Produto.Text;
      if FPadraoDescontoProdutoParam.RGPreview.ItemIndex = 0 then
        FRPadraoDescontoProduto.QRPrimario.Preview
      else
        FRPadraoDescontoProduto.QRPrimario.Print;
    end;
  end;
end;

end.
