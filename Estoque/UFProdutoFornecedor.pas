unit UFProdutoFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids, DBDirceu, variants, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFProdutoFornecedor = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    SBProdutoCons: TSpeedButton;
    SBCadastroCons: TSpeedButton;
    DBGrid1: TDBGrid;
    DSProdFornecedorCons: TDataSource;
    ProdutoFornecedor1: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Opces1: TMenuItem;
    AlterarPreos1: TMenuItem;
    procedure SBCadastroConsClick(Sender: TObject);
    procedure SBProdutoConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ProdutoFornecedor1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AlterarPreos1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoFornecedor: TFProdutoFornecedor;

implementation

uses UProduto_cl, UCadastro_cl, UOracle_cl, UCadastroCons, UProdutoCons,
  UFProdutoFornecedorCons, UProdutoParam, URProdutoFornecedor,
  URFornecedorProduto, UProdutoRelatorio_cl, UAlteraPreco, UTela_cl;

{$R *.DFM}

procedure TFProdutoFornecedor.SBCadastroConsClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    with DMCadastro do
      DMProduto.QProdutoFornecedorCOD_CADASTRO.VALUE := QCadastroConsCOD_CADASTRO.VALUE;
  end;
end;

procedure TFProdutoFornecedor.SBProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    with DMProduto do
      DMProduto.QProdutoFornecedorCod_Produto.Value := QProdutoConsCOD_PRODUTO.Value;
    end;
end;

procedure TFProdutoFornecedor.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FProdutoFornecedorCons = nil then
     FProdutoFornecedorCons := TFProdutoFornecedorCons.Create(Application);
  if FProdutoFornecedorCons.ShowModal = mrOk then
  begin
    with DMProduto do
    begin
      QProdutoFornecedor.Close;
      QProdutoFornecedor.SetVariable('PK',QProdFornConsLctoCOD_PRODUTO_FORNECEDOR.Value);
      QProdutoFornecedor.Open;
    end;
  end;
end;

procedure TFProdutoFornecedor.ProdutoFornecedor1Click(Sender: TObject);
begin
  inherited;
  if FProdutoParam = nil then
     FProdutoParam := TFProdutoParam.Create(Application);

  FProdutoParam.PGRelatorio.Pages[13].TabVisible := True;
  if FProdutoParam.ShowModal = mrOk then
  begin
    with DMProdutoRelatorio do
    begin
      if FProdutoParam.RGOpcao.ItemIndex = 0 then
      begin
        QRProdFornecedor_F.Close;

        if Trim(FProdutoParam.EdCodCadastro.Text) = '' then
           QRProdFornecedor_F.SetVariable('COD_CADASTRO',Null)
        else
           QRProdFornecedor_F.SetVariable('COD_CADASTRO',FProdutoParam.EdCodCadastro.Text);

        if Trim(FProdutoParam.Fm13Classe.MeClasse.Text) = '' then
           QRProdFornecedor_F.SetVariable('COD_CLASSE',Null)
        else
           QRProdFornecedor_F.SetVariable('COD_CLASSE',Trim(FProdutoParam.Fm13Classe.MeClasse.Text));

        if FRProdutoporFornecedor = nil then
           FRProdutoporFornecedor := TFRProdutoporFornecedor.Create(Application);

        QRProdFornecedor_F.Open;

        if FProdutoParam.RGPreview.ItemIndex = 0 then
           FRProdutoporFornecedor.QRPrimario.Preview
        else
           FRProdutoporFornecedor.QRPrimario.Print;

        QRProdFornecedor_F.Close;
      end
      else
      begin
        QRProdFornecedor_P.Close;

        if Trim(FProdutoParam.EdCodProduto.Text) = '' then
           QRProdFornecedor_P.SetVariable('COD_PRODUTO',Null)
        else
           QRProdFornecedor_P.SetVariable('COD_PRODUTO',FProdutoParam.EdCodProduto.Text);

        if Trim(FProdutoParam.Fm13Classe.MeClasse.Text) = '' then
           QRProdFornecedor_P.SetVariable('COD_CLASSE',Null)
        else
           QRProdFornecedor_P.SetVariable('COD_CLASSE',Trim(FProdutoParam.Fm13Classe.MeClasse.Text));

        if FRFornecedorporProduto = nil then
           FRFornecedorporProduto := TFRFornecedorporProduto.Create(Application);

        QRProdFornecedor_P.Open;

        if FProdutoParam.RGPreview.ItemIndex = 0 then
           FRFornecedorporProduto.QRPrimario.Preview
        else
           FRFornecedorporProduto.QRPrimario.Print;

        QRProdFornecedor_P.Close;

      end;
    end;
  end;
end;

procedure TFProdutoFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  DMProduto.QProdutoFornecedor.Open;
  DMProduto.QProdFornecedorCons.Open;

end;

procedure TFProdutoFornecedor.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMProduto.QProdFornecedorCons.Close;
  DMProduto.QProdFornecedorCons.Open;
end;

procedure TFProdutoFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProduto.QProdutoFornecedor.Close;
  DMProduto.QProdFornecedorCons.Close;
  Action := CaFree;
  FProdutoFornecedor := Nil;
end;

procedure TFProdutoFornecedor.AlterarPreos1Click(Sender: TObject);
begin
  inherited;
  if FAlteraPreco = nil then
     FAlteraPreco := TFAlteraPreco.Create(Application);
  //DMTela.VerificaTela(pModulo,FAlteraPreco.Caption,FAlteraPreco.Name);
  FAlteraPreco.ShowModal;

end;

procedure TFProdutoFornecedor.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit, DsInsert] then
   begin
     SBCadastroCons.Enabled := True;
     SBProdutoCons.Enabled := True;
   End
  Else
   begin
     SBCadastroCons.Enabled := False;
     SBProdutoCons.Enabled := False;
   End;
end;

end.
