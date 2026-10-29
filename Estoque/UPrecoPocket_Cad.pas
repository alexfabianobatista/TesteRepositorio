unit UPrecoPocket_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFPrecoPocket_Cad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    SBProduto: TSpeedButton;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBDirceu1: TDBDirceu;
    Label37: TLabel;
    DBEdit24: TDBEdit;
    SbVendedor: TSpeedButton;
    DBDirceu2: TDBDirceu;
    GroupBox10: TGroupBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Label24: TLabel;
    DBEdit9: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit25: TDBEdit;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit10: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    GroupBox11: TGroupBox;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label18: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label20: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit16: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    GroupBox12: TGroupBox;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    Label22: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit18: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    GroupBox9: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    Preo1: TMenuItem;
    procedure SBProdutoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SbVendedorClick(Sender: TObject);
    procedure Preo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPocket_Cad: TFPrecoPocket_Cad;

implementation

uses UPrecoPocket_cl, UClasseCons, UClasse_cl, UPrecoPocket_Cons,
  UOracle_cl, UProdutoCons, UProduto_cl, UVendedorCons, UVendedor_cl,
  UPrecoPocket_Param, URPrecoPocket;

{$R *.DFM}

procedure TFPrecoPocket_Cad.SBProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
     DMPrecoPocket.QPrecoPocketCod_Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
end;

procedure TFPrecoPocket_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit,DsInsert] then
    begin
      SBProduto.Enabled:=True;
      SbVendedor.Enabled:=True;
    end
  else
    Begin
      SBProduto.Enabled:=False;
      SbVendedor.Enabled:=False;
    End;
end;

procedure TFPrecoPocket_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPrecoPocket.QPrecoPocket.open;
end;

procedure TFPrecoPocket_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPrecoPocket.QPrecoPocket.Close;
  Action := CaFree;
  FPrecoPocket_Cad := Nil;
end;

procedure TFPrecoPocket_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPrecoPocket_Cons = Nil then
    FPrecoPocket_Cons := TFPrecoPocket_Cons.Create(Application);
  If FPrecoPocket_Cons.ShowModal = mrOk then
  with DMPrecoPocket do
  begin
    QPrecoPocket.Close;
    QPrecoPocket.SetVariable('PK',QPrecoPocketConsCod_Preco_Pocket.Value);
    QPrecoPocket.Open;
  end;

end;

procedure TFPrecoPocket_Cad.SbVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
     DMPrecoPocket.QPrecoPocketCod_Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;

end;

procedure TFPrecoPocket_Cad.Preo1Click(Sender: TObject);
begin
  inherited;
  if FPrecoPocket_Param = Nil then
     FPrecoPocket_Param := TFPrecoPocket_Param.Create(Application);
  FPrecoPocket_Param.PGRelatorio.Pages[0].TabVisible:=true;
  if FPrecoPocket_Param.Showmodal = mrOk then
  begin
    with DMPrecoPocket do    // Filtragem dos Dados
    begin
      QRPrecoPocket.Close;
      if Trim(FPrecoPocket_Param.Me0Produto.Text) <> '' then
         QRPrecoPocket.SetVariable('COD_PRODUTO',Trim(FPrecoPocket_Param.Me0Produto.Text))
      else
         QRPrecoPocket.SetVariable('COD_PRODUTO',Null);

      if Trim(FPrecoPocket_Param.Me0Vendedor.Text) <> '' then
         QRPrecoPocket.SetVariable('COD_VENDEDOR',Trim(FPrecoPocket_Param.Me0Vendedor.Text))
      else
         QRPrecoPocket.SetVariable('COD_VENDEDOR',Null);
      QRPrecoPocket.Open;
      if FrPrecoPocket = nil then
         FrPrecoPocket := TFrPrecoPocket.Create(Application);
      FrPrecoPocket.QRLVendedor.Caption := 'Vendedor: ' + FPrecoPocket_Param.Ed0Vendedor.Text;
      if FPrecoPocket_Param.RGPreview.ItemIndex=0 then
         FrPrecoPocket.QRPrimario.Preview
      else
         FrPrecoPocket.QRPrimario.Print;
      QRPrecoPocket.Close;
    End;
  End;
End;

end.
